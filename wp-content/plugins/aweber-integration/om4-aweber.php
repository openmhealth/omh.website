<?php
/*
	$Id: om4-aweber.php 399066 2011-06-20 02:48:32Z jamescollins $
*/

/*
Plugin Name: AWeber Integration
Plugin URI: http://om4.com.au/wordpress-plugins/wordpress-aweber-plugin/
Description: Provides a simple way to add one or more AWeber email subscription form(s) to your sidebar and optionally enable AWeber analytics for your website. Supports AWeber's Javascript snippet embed method as well as the Raw HTML embed method.
Version: 2.2
Author: OM4
Author URI: http://om4.com.au/
Text Domain: aweber-integration
*/

/*  Copyright 2009-2011 OM4 (email : info@om4.com.au)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/


class OM4_Aweber {
	
	var $dbVersion = 1;
	
	var $installedVersion;
	
	var $dirname;
	
	var $textFieldWidth = '97%'; 
	
	/**
	 * Constructor
	 *
	 */
	function OM4_Aweber() {
		
		// Store the name of the directory that this plugin is installed in
		$this->dirname = str_replace('/om4-aweber.php', '', plugin_basename(__FILE__));

		add_action('admin_menu',array(&$this, 'MenuInit'));
		if (is_admin()) {
			add_filter('whitelist_options',array( &$this, 'WhilelistOptions'));
			add_filter( 'plugin_action_links', array(&$this, 'AddPluginActionLink'), 10, 2 );
		} else {
			add_action('wp_footer', array(&$this, 'AnalyticsCode'));
		}
		
		register_activation_hook(__FILE__, array(&$this, 'Install'));
		
		add_action('init', array(&$this, 'Init'));

		// Load the new javascript snippet widget
		add_action('widgets_init', array(&$this, 'LoadWidget'));

		$this->installedVersion = intval(get_option('om4_aweber_db_version'));
	}

	/**
	 * Intialise I18n
	 *
	 */
	function LoadDomain() {
		load_plugin_textdomain('aweber-integration', WP_PLUGIN_DIR.'/'.dirname(plugin_basename(__FILE__)));
	}
	
	/**
	 * Plugin Install Tasks
	 * 
	 * For plugin uninstall tasks see uninstall.php
	 *
	 */
	function Install() {
		// There aren't really any installation tasks at the moment
		
		if (!$this->installedVersion) {
			$this->installedVersion = $this->dbVersion;
			$this->SaveInstalledVersion();
		}
	}

	/**
	 * Performs any upgrade tasks if required
	 *
	 */
	function CheckVersion() {
		if ($this->installedVersion != $this->dbVersion) {
			// Upgrade tasks
			if ($this->installedVersion == 0) {
				$this->installedVersion++;
			}
			$this->SaveInstalledVersion();
		}
	}
	
	function SaveInstalledVersion() {
		update_option('om4_aweber_db_version', $this->installedVersion);
	}

	/**
	 * Tasks to perform during the 'init' hook
	 */
	function Init() {
	    $this->LoadDomain();
	    $this->CheckVersion();

	    // Load old Raw HTML widget
	    $this->EnableOldWidget();

	    $this->DetectOldWidgets();
	}

	/**
	 * Initialise the AWeber Settings menu
	 *
	 */
	function MenuInit() {
	     add_options_page(
	                      __('AWeber', 'aweber-integration'),         //Title
	                      __('AWeber', 'aweber-integration'),         //Sub-menu title
	                      'manage_options', //Security
	                      __FILE__,         //File to open
	                      array(&$this, 'OptionsPage')  //Function to call
	    );
	}

	/**
	 * Search all sidebars for old Raw HTML AWeber widgets.
	 * If an old widget is found, the 'om4_aweber_old_widget_detected' hook is executed
	 *
	 * Run during the init hook
	 */
	function DetectOldWidgets() {
	    $widgetsOption = get_option('sidebars_widgets', array());
	    foreach ($widgetsOption as $sidebar => $widgets) {
		if (strpos($sidebar, 'inactive_widgets') > 1) continue; // We don't care about the inactive widgets
		if ( is_array($widgets) ) {
		    $count = sizeof($widgets);
		    for ($i = 0; $i < $count; $i++) { // loop over each widget in the sidebar
			if (strpos($widgets[$i], 'om4-aweber-') !== false ) {
			    do_action('om4_aweber_old_widget_detected');
			    break;
			}
		    }
		}
	    }
	}

	/**
	 * This function is only executed if one of the sidebar(s) contains an old raw html widget
	 *
	 * Run during the init hook (only if an old widget is present)
	 */
	function EnableOldWidget() {
	    $this->WidgetRegister();
	    add_filter('wp_dropdown_pages', array(&$this, 'PagesDropdownField'));
	}

	/**
	 * Initialise the new WP 2.8+ Javascript snippet widget
	 */
	function LoadWidget() {
	    register_widget( 'OM4_Aweber_Widget' );
	}

	/**
	 * Filter the whitelist of availabe options.
	 * Needed so the settings page saves in WPMU (see http://mu.wordpress.org/forums/topic.php?id=9210)
	 *
	 * @param Array $whitelist
	 * @return Array
	 */
	function WhilelistOptions($whitelist) {
		if(is_array($whitelist)) {
			// When adding options, change the page_options hidden field too! 		
			$option_array = array($this->dirname => array('om4_aweber_account_id'));
			$whitelist = array_merge($whitelist,$option_array);
		}
		return $whitelist;
	}

	/**
	 * The AWeber settings page
	 *
	 */
	function OptionsPage() {
		echo '<div class="wrap"><h2>AWeber Options</h2>';
		
		if (isset($_GET['updated']) && $_GET['updated']) {
			?>
			<div class="updated fade"><p><strong><?php printf(__('Please log into your AWeber account, navigate to Reports -> Settings, and ensure the web site address field contains the following: <code>%s</code>', 'aweber-integration'), site_url()); ?></strong></p></div>
			<?php
		}
		?>
		<form method="post" action="<?php echo admin_url('options.php'); ?>">
		<h3><?php _e('AWeber Sidebar Widget', 'aweber-integration'); ?></h3>
		<p><?php printf(__('The AWeber sidebar widget(s) are available for use on the <a href="%s">widgets management page</a>.', 'aweber-integration'), admin_url('widgets.php')); ?></p>
		
		<h3><?php _e('AWeber Analytics (optional)', 'aweber-integration') ?></h3>
		<p><?php _e('Enter your AWeber account ID below if you wish to enable <a href="http://www.aweber.com/email-analytics.htm" target="_blank">AWeber Email Web Analytics</a> on your site.', 'aweber-integration'); ?></p>
		<p><?php _e('Your account ID can be found by logging into your AWeber account, clicking on Reports, then Settings. Your account ID is displayed in the text box, and is the alphanumeric code after the <code>?id=</code> code. <a href="http://www.aweber.com/faq/questions/523/How+Do+I+Install+Email+Web+Analytics%3F" target="_blank">More information</a>.', 'aweber-integration'); ?></p>
		<p><?php _e('If you don\'t have the Reports &rArr; Settings menu in your AWeber account, you are probably on an old AWeber account package. You will need to contact AWeber support to get your account upgraded to a new plan that includes the analytics option.', 'aweber-integration'); ?></p>
		 <?php 
		 
	      	// WP 2.7+ compatible way of registering options
		register_setting($this->dirname . 'options', 'om4_aweber_account_id');

		settings_fields($this->dirname);
		 
		 // When adding options, change $option_array too!
		echo '<input type="hidden" name="page_options" value="om4_aweber_account_id" />';
		 ?>
	<table class="form-table">
	 <tr valign="top">
	<th scope="row"><b><label for="om4_aweber_account_id"><?php _e('AWeber Account ID:', 'aweber-integration'); ?></label></b></th>
	<td><input type="text" id="om4_aweber_account_id" name="om4_aweber_account_id" value="<?php echo get_option('om4_aweber_account_id') ?>"  /> <?php _e('(letters and numbers only)', 'aweber-integration'); ?></td>
	</tr>
	</table>
	<p><?php _e('Once you have entered your AWeber account ID, the AWeber Analytics tracking code will be automatically added to every page on your website.', 'aweber-integration'); ?></p>
	
	<h3><?php _e('Save Changes', 'aweber-integration'); ?></h3>
	<p><?php _e('Click the button below to save your changes.', 'aweber-integration'); ?></p>
	<p class="submit">
		<input type="submit" name="Submit" value="<?php _e('Save Options', 'aweber-integration'); ?> &raquo;" class="button-primary" />
		<input type="hidden" name="action" value="update" />
		<input type="hidden" name="option_page" value="<?php echo $this->dirname; ?>" />
	</p>
		 </form>
		<?php 
		echo '</div>';
	}

	/**
	 * Adds the aweber analytics tracking code to the footer of the website
	 *
	 */
	function AnalyticsCode() {
		$id = get_option('om4_aweber_account_id');
		
		if (empty($id)) return;
		
		$id = attribute_escape($id);
		
		$scheme = 'http';
		if (is_ssl()) {
			$scheme = 'https';
		}
		echo '<script type="text/javascript" src="' . $scheme . '://analytics.aweber.com/js/awt_analytics.js?id=' . $id . '"></script>';
	}

	/**
	 * Register the old Raw HTML AWeber Widget
	 *
	 */
	function WidgetRegister() {
		$options = get_option('widget_om4_aweber');
		if ($options == false) {
			$options = array(array());
			add_option('widget_om4_aweber', $options);
		}
		
		$control_ops = array('width' => 600, 'height' => 500, 'id_base' => 'om4-aweber');
		$widget_ops = array('classname' => 'widget_aweber', 'description' => __( "Old AWeber widget format. The Javascript snippet widget should be used instead.", 'aweber-integration'));
	
		$name = __('AWeber Mailing List (Raw HTML)', 'aweber-integration');

		
		if (is_array($options)) {
			foreach ( array_keys($options) as $o ) {
				// Old widgets can have null values for some reason
				if ( !isset($options[$o]['title']))
				continue;
				$id = "om4-aweber-$o"; // Never never never translate an id
				wp_register_sidebar_widget($id, $name, array( & $this, 'WidgetDisplay'), $widget_ops, array( 'number' => $o ));
				wp_register_widget_control($id, $name, array( & $this, 'WidgetControl'), $control_ops, array( 'number' => $o ));
			}
		
			// If there are none, we register the widget's existance with a generic template
			if ( !$id ) {
				wp_register_sidebar_widget( 'om4-aweber-1', $name, array( & $this, 'WidgetDisplay'), $widget_ops, array( 'number' => -1 ) );
				wp_register_widget_control( 'om4-aweber-1', $name, array( & $this, 'WidgetControl'), $control_ops, array( 'number' => -1 ) );
			}
		}
	}

	/**
	 * Display the widget
	 *
	 * @param Array
	 * @param Array|int
	 */
	function WidgetDisplay( $args, $widget_args = 1 ) {
		extract( $args, EXTR_SKIP );
		if ( is_numeric($widget_args) )
			$widget_args = array( 'number' => $widget_args );
		$widget_args = wp_parse_args( $widget_args, array( 'number' => -1 ) );
		extract( $widget_args, EXTR_SKIP );
	
		// Data should be stored as array:  array( number => data for that instance of the widget, ... )
		$options = get_option('widget_om4_aweber');
		if ( !isset($options[$number]) )
			return;
		
		$options = $options[$number];
	
		if (strlen($options['form_id'] > 0) && strlen($options['unit']) > 0) {
	
			echo $before_widget;
			echo $before_title;
			if (strlen($options['title']) > 0) echo $options['title'];
			else echo 'Subscribe';
			echo $after_title;
			
	
			// Begin Main Widget Content
	    	?>
	
			<form method="post" action="http://www.aweber.com/scripts/addlead.pl">
			<input type="hidden" name="meta_web_form_id" value="<?php echo $options['form_id'] ?>" />
			<input type="hidden" name="meta_split_id" value="" />
			<input type="hidden" name="unit" value="<?php echo $options['unit'] ?>" />
			<?php 
			$redirect = '';
			if (intval($options['redirect']) > 0) { 
			    $redirect = get_permalink(intval($options['redirect']));
			}
			if (!strlen($redirect)) {
			    // Use the default thank you page
			    $redirect = 'http://www.aweber.com/thankyou-coi.htm?m=text';
			}
			$redirectAlreadySubscribed = '';
			if (intval($options['redirect_already_subscribed']) > 0) { 
			    $redirectAlreadySubscribed = get_permalink(intval($options['redirect_already_subscribed']));
			}
			if (!strlen($redirectAlreadySubscribed)) {
			    // Use the default already subscribed page
			    $redirectAlreadySubscribed = 'http://www.aweber.com/form-sorry.htm?message=already_subscribed_1';
			}
			?>
			<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
			<input type="hidden" name="meta_redirect_onlist" value="<?php echo $redirectAlreadySubscribed; ?>" />
			<input type="hidden" name="meta_adtracking" value="" />
			<input type="hidden" name="meta_message" value="1" />
			<input type="hidden" name="meta_required" value="from" />
			<input type="hidden" name="meta_forward_vars" value="0" />
			<table style="width: 95%;">
			<?php if (strlen($options['message']) > 0) { ?>
			<tr><td colspan="2" class="aweber_msg"><?php echo $options['message'] ?></td></tr>
			<?php } ?>
			<tr><td style="width: 10%;"><label for="aweber_<?php echo $number ?>-name"><?php _e('Name:', 'aweber-integration'); ?></label></td><td><input type="text" name="name" id="aweber_<?php echo $number ?>-name" value="" style="width:95%" /></td></tr>
			<tr><td style="width: 10%;"><label for="aweber_<?php echo $number ?>-email"><?php _e('Email:', 'aweber-integration'); ?></label></td><td><input type="text" name="from" id="aweber_<?php echo $number ?>-email" value="" style="width:95%" /></td></tr>
			<tr><td align="center" colspan="2"><input type="submit" name="submit" value="<?php if (strlen($options['button_text']) > 0) echo $options['button_text']; else _e('Submit', 'aweber-integration'); ?>" /></td></tr>
			<?php if (strlen($options['message_after']) > 0) { ?>
			<tr><td colspan="2" class="aweber_msg_after"><?php echo $options['message_after'] ?></td></tr>
			<?php } ?>
			</table>
			</form>
		    <?php
		    // End Main Widget Content
		
		    echo $after_widget;
		}
	}

	/**
	 * Displays form for a particular instance of the widget.  Also updates the data after a POST submit
	 *
	 * @param Array|int Widget Arguments
	 */
	function WidgetControl( $widget_args = 1 ) {
		global $wp_registered_widgets;
		static $updated = false; // Whether or not we have already updated the data after a POST submit
	
		if ( is_numeric($widget_args) )
			$widget_args = array( 'number' => $widget_args );
		$widget_args = wp_parse_args( $widget_args, array( 'number' => -1 ) );
		extract( $widget_args, EXTR_SKIP );
	
		// Data should be stored as array:  array( number => data for that instance of the widget, ... )
		$options = get_option('widget_om4_aweber');
	
		if ( !is_array($options) )
			$options = array();
	
		if ( !$updated && !empty($_POST['sidebar']) ) {
			// Tells us what sidebar to put the data in
			$sidebar = (string) $_POST['sidebar'];
	
			$sidebars_widgets = wp_get_sidebars_widgets();
			if ( isset($sidebars_widgets[$sidebar]) )
				$this_sidebar =& $sidebars_widgets[$sidebar];
			else
				$this_sidebar = array();
	
			foreach ( $this_sidebar as $_widget_id ) {
				// Remove all widgets of this type from the sidebar.  We'll add the new data in a second.  This makes sure we don't get any duplicate data
				// since widget ids aren't necessarily persistent across multiple updates
				if ( 'widget_om4_aweber' == $wp_registered_widgets[$_widget_id]['callback'] && isset($wp_registered_widgets[$_widget_id]['params'][0]['number']) ) {
					$widget_number = $wp_registered_widgets[$_widget_id]['params'][0]['number'];
					if ( !in_array( "om4-aweber-$widget_number", $_POST['widget-id'] ) ) // the widget has been removed. "om4-aweber-$widget_number" is "{id_base}-{widget_number}
					unset($options[$widget_number]);
				}
			}
			if (isset($_POST['widget-om4-aweber'])) {
				//foreach ( (array) $_POST['widget-om4-aweber'] as $widget_number => $widget_instance ) {
				foreach ( $_POST['widget-om4-aweber'] as $widget_number => $widget_instance ) {
					// compile data from $widget_instance
					
					$options[$widget_number]['title'] = strip_tags(stripslashes($widget_instance['title']));
					$options[$widget_number]['button_text'] = strip_tags(stripslashes($widget_instance['button_text']));
					$options[$widget_number]['message'] = stripslashes(wp_filter_post_kses($widget_instance['message']));
					$options[$widget_number]['unit'] = strip_tags(stripslashes($widget_instance['unit']));
					$options[$widget_number]['form_id'] = strip_tags(stripslashes($widget_instance['form_id']));
					$options[$widget_number]['redirect'] = strip_tags(stripslashes($widget_instance['redirect']));
					$options[$widget_number]['redirect_already_subscribed'] = strip_tags(stripslashes($widget_instance['redirect_already_subscribed']));
					$options[$widget_number]['message_after'] = stripslashes(wp_filter_post_kses($widget_instance['message_after']));
				}
		
				update_option('widget_om4_aweber', $options);
		
				$updated = true; // So that we don't go through this more than once
			}
		}
	
		// Here we echo out the form
		if ( -1 == $number ) { // We echo out a template for a form which can be converted to a specific form later via JS
			$title = '';
			$buttonText = '';
			$message = '';
			$unit = '';
			$formId = '';
			$confirmationPage = '';
			$alreadySubscribedPage = '';
			$messageAfter = '';
			$number = '%i%';
		} else {
			$title = attribute_escape($options[$number]['title']);
			$buttonText = attribute_escape($options[$number]['button_text']);
			$message = attribute_escape($options[$number]['message']);
			$unit = attribute_escape($options[$number]['unit']);
			$formId = attribute_escape($options[$number]['form_id']);
			$confirmationPage = attribute_escape($options[$number]['redirect']);
			$alreadySubscribedPage = attribute_escape($options[$number]['redirect_already_subscribed']);
			$messageAfter = attribute_escape($options[$number]['message_after']);
		}
	
		// The form has inputs with names like widget-om4-aweber[$number][something] so that all data for that instance of
		// the widget are stored in one $_POST variable: $_POST['widget-om4-aweber'][$number]
		
	?>
				<p style="background-color:#FFEBE8; border: 1px solid #CC0000; padding: 0.3em;"><?php echo sprintf(__('If you are experiencing issues with this RAW HTML widget, the new Javascript snippet widget can be used instead. <a href="%s" target="_blank">Click here for instructions</a>.', 'aweber-integration'), 'http://om4.com.au/wordpress-plugins/wordpress-aweber-plugin/migrate-widget/'); ?></p>
				<p style="text-align: left"><?php _e('This widget allows you to add an <a href="http://smartmail.aweber.com" target="_blank">AWeber</a> Web Subscription Form to the sidebar of your site.', 'aweber-integration'); ?></p>
				<p style="text-align: left"><?php _e('Note: This widget currently only supports web forms with a name and email field.', 'aweber-integration'); ?></p>
				<h3><?php _e('AWeber Variables (required)', 'aweber-integration'); ?></h3>
				<p style="text-align: left"><?php _e('The following fields can be found by logging into AWeber, selecting the appropriate list, clicking on Web Forms &rarr; Get HTML &rarr; Raw HTML Version.', 'aweber-integration'); ?></p>
				<?php _e('<b>Unit</b> (letters, numbers and hyphens only)', 'aweber-integration'); ?><br />
				<?php _e('For example, your unit is the word in red (excluding quotation marks) in the following example:<br /><code>&lt;input type="hidden" name="unit" value="<font color="red">default537640</font>"&gt;</code>', 'aweber-integration'); ?><br />
				<input style="width: <?php echo $this->textFieldWidth ?>;" id="widget_om4_aweber_unit_<?php echo $number; ?>" name="widget-om4-aweber[<?php echo $number; ?>][unit]" type="text" value="<?php echo $unit; ?>" /><br />
				<br />
				<b><?php _e('Form ID</b> (numbers only)', 'aweber-integration'); ?><br />
				<?php _e('For example, your Form ID is the number in red (excluding quotation marks) in the following example:<br /><code>&lt;input type="hidden" name="meta_web_form_id" value="<font color="red">574060174</font>"&gt;</code>', 'aweber-integration'); ?><br />
				<input style="width: <?php echo $this->textFieldWidth ?>;" id="widget_om4_aweber_form_id_<?php echo $number; ?>" name="widget-om4-aweber[<?php echo $number; ?>][form_id]" type="text" value="<?php echo $formId; ?>" /><br />
			
				<h3><?php _e('Optional Settings', 'aweber-integration'); ?></h3>
				<?php _e('<b>Widget Title</b> (Optional)', 'aweber-integration'); ?><br /><?php _e('(eg. Subscribe to our newsletter)', 'aweber-integration'); ?><br /><input style="width: <?php echo $this->textFieldWidth ?>;" id="widget_om4_aweber_title_<?php echo $number; ?>" name="widget-om4-aweber[<?php echo $number; ?>][title]" type="text" value="<?php echo $title; ?>" /><br />		
				<br />
				<?php _e('<b>Message</b>  (Optional)', 'aweber-integration'); ?><br />
				<?php _e('Displayed above the name and email text fields. (eg. Subscribe to our mailing list for free)<br />Basic HTML is allowed.', 'aweber-integration'); ?><input style="width: <?php echo $this->textFieldWidth ?>;" id="widget_om4_aweber_message_<?php echo $number; ?>" name="widget-om4-aweber[<?php echo $number; ?>][message]" type="text" value="<?php echo $message; ?>" /><br />
				<br />
				<?php _e('<b>Button Text</b>  (Optional)', 'aweber-integration'); ?><br />
				<?php _e('The text label for the submit button. (eg. Subscribe)', 'aweber-integration'); ?><br />
				<input style="width: <?php echo $this->textFieldWidth ?>;" id="widget_om4_aweber_button_text_<?php echo $number; ?>" name="widget-om4-aweber[<?php echo $number; ?>][button_text]" type="text" value="<?php echo $buttonText; ?>" />
				<br /><br />
				<?php _e('<b>Confirmation / Thank You Page</b> (Optional)', 'aweber-integration'); ?><br />
				<?php _e('This is the page that visitors will be redirected to after they complete the form. The <a href="http://www.aweber.com/thankyou-coi.htm?m=text" target="_blank">default AWeber page</a> will be used if this isn\'t set.', 'aweber-integration'); ?><br />
				<?php echo wp_dropdown_pages("name=widget-om4-aweber[$number][redirect]&echo=0&show_option_none=".__('- Select -', 'aweber-integration')."&selected=" . $confirmationPage); ?>
				<br /><br />
				<?php _e('<b>Already Subscribed Page</b> (Optional)', 'aweber-integration'); ?><br />
				<?php _e('This is the page that visitors will be redirected to if they submit an email address that is already subscribed to the mailing list. The <a href="http://www.aweber.com/form-sorry.htm?message=already_subscribed_1" target="_blank">default AWeber page</a> will be used if this isn\'t set.', 'aweber-integration'); ?><br />
				<?php echo wp_dropdown_pages("name=widget-om4-aweber[$number][redirect_already_subscribed]&echo=0&show_option_none=".__('- Select -', 'aweber-integration')."&selected=" . $alreadySubscribedPage); ?>
				<br /><br />
				<?php _e('<b>Text Below Form</b>  (Optional)', 'aweber-integration'); ?><br />
				<?php _e('Displayed below the subscription form. (eg. Read our &lt;a href="/newsletter/"&gt;current newsletter&lt;/a&gt;)<br />Basic HTML is allowed.', 'aweber-integration'); ?><input style="width: <?php echo $this->textFieldWidth ?>;" id="widget_om4_aweber_message_<?php echo $number; ?>" name="widget-om4-aweber[<?php echo $number; ?>][message_after]" type="text" value="<?php echo $messageAfter; ?>" /><br />
				
				<input type="hidden" id="widget_om4_aweber_submit_<?php echo "$number"; ?>" name="widget-om4-aweber[<?php echo $number; ?>][submit]" value="1" />
	<?php
	}
	
	/**
	 * Set the width of the page dropdown list.
	 * Called by the wp_dropdown_pages filter
	 *
	 * @param string <select> output
	 * @return string
	 */
	function PagesDropdownField($output) {
		if (strpos($output, 'widget-om4-aweber') !== false) {
			$output = str_replace('<select ', '<select style="width: ' . $this->textFieldWidth . '" ', $output);
		}
		return $output; 
	}
	
	/**
	 * Add a link to the settings page from the plugins page
	 */
	function AddPluginActionLink( $links, $file ) {
		static $this_plugin;
		
		if( empty($this_plugin) ) $this_plugin = plugin_basename(__FILE__);

		if ( $file == $this_plugin ) {
			$settings_link = '<a href="' . admin_url( 'options-general.php?page=' . $this_plugin ) . '">' . __('Settings', 'aweber-integration') . '</a>';
			array_unshift( $links, $settings_link );
		}

		return $links;
	}
	
	
	/**
	 * Checks if the current WP installation is WP or WPMU
	 *
	 * @return bool
	 */
	function IsWPMU() {
		global $wpdb;
		return isset($wpdb->blogid);
	}
}

/**
 * New Javascript snippet widget
 *
 */
class OM4_Aweber_Widget extends WP_Widget {

    var $defaults = array();

    var $embedcode = '<script type="text/javascript" src="http://forms.aweber.com/form/%s.js"></script>';

    /**
     * Perl-based regular expression that is used to extract the ID from the javascript snippet
     *
     * The ID can contain numbers and slashes only
     *
     * @var string
     */
    var $embedcoderegexp = '#http://forms\.aweber\.com/form/([0-9/]*)\.js#i';

    /**
     * Widget setup.
     */
    function OM4_Aweber_Widget() {

        /* Widget settings. */
        $widget_ops = array( 'classname' => 'aweber', 'description' => __('Add an AWeber mailing list subscription form to your site', 'aweber-integration') );

        /* Widget control settings. */
        $control_ops = array( 'id_base' => 'aweber', 'width' => 500 );

        /* Create the widget. */
        $this->WP_Widget( 'aweber', __('AWeber Mailing List (Javascript Snippet)', 'aweber-integration'), $widget_ops, $control_ops );

        $this->defaults = array( 'title' => __('Subscribe', 'aweber-integration'), 'id' => '' );

    }

    /**
     * Display the widget on the screen.
     */
    function widget( $args, $instance ) {
    	$instance = wp_parse_args( (array) $instance, $this->defaults );

	$javascript = $this->GetJavaScriptSnippet($instance['id']);

	// Only proceed if the form id for this widget has been set
	if (! strlen($javascript)) return;

	echo $args['before_widget'];

	// Output the title if it has been defined
	if (strlen($instance['title'])) {
	    echo $args['before_title'];
	    echo $instance['title'];
	    echo $args['after_title'];
	}
	
	echo $javascript;
	echo $args['after_widget'];
    }

    /**
     * Update the widget settings.
     */
    function update( $new_instance, $old_instance ) {
        $instance = $old_instance;

        $instance['title'] = strip_tags( $new_instance['title'] );

	$instance['id'] = $this->ParseJavaScriptSnippet( $new_instance['id'] );

        return $instance;
    }

    /**
     * Displays the widget settings controls on the widget panel.
     */
    function form( $instance ) {
        $instance = wp_parse_args( (array) $instance, $this->defaults ); ?>
	<p style="text-align: left;"><?php _e('This widget allows you to add an <a href="http://smartmail.aweber.com" target="_blank">AWeber</a> Web Subscription Form to a sidebar on your website.', 'aweber-integration'); ?></p>
	<p style="text-align: left"><?php _e('You need to configure your subscription form by logging into your AWeber account. Once logged in, select the appropriate list, then click on Web Forms. Click on the name of an existing web form (or create a new one). When designing your web form, be sure to set it\'s width to be smaller than the width of your sidebar. Once you have configured your web form, paste the entire Javascript Snippet into the box below.', 'aweber-integration'); ?></p>
        <p>
            <label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e('Title (optional):', 'aweber-integration'); ?></label>
            <input class="widefat" id="<?php echo $this->get_field_id( 'title' ); ?>" name="<?php echo $this->get_field_name( 'title' ); ?>" value="<?php echo $instance['title']; ?>" />
        </p>
	<p>
            <label for="<?php echo $this->get_field_id( 'title' ); ?>"><?php _e('Javascript Snippet (required):', 'aweber-integration'); ?></label>
            <textarea class="widefat" id="<?php echo $this->get_field_id( 'title' ); ?>" name="<?php echo $this->get_field_name( 'id' ); ?>"><?php echo $this->GetJavaScriptSnippet($instance['id']); ?></textarea>
	    eg.<br /><code><?php echo htmlspecialchars($this->GetJavaScriptSnippet('12/1234567')); ?></code>
        </p>
	<?php
    }

    /**
     * Extract the unique account id from the JavaScript embed code
     * @param string JavaScript embed code
     */
    function ParseJavaScriptSnippet($code) {
	$matches = array();

	$id = '';
	// Attempt to extract the ID from the embed code using our regular expression
	if (preg_match($this->embedcoderegexp, $code, $matches) && sizeof($matches) == 2) {
		$id = $matches[1];
	}
	return $id;
    }

    /*
     * Retrieve the Typekit embed code if the unique account id has been set
     * @return string The typekit embed code if the unique account ID has been set, otherwise an empty string
     */
    function GetJavaScriptSnippet($id = '') {
	if (strlen($id) > 0) return sprintf($this->embedcode, $id);
	return '';
    }
}


if(defined('ABSPATH') && defined('WPINC')) {
	if (!isset($GLOBALS["om4_Aweber"])) {
		$GLOBALS["om4_Aweber"] = new OM4_Aweber();
	}
}

?>