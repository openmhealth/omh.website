<?php
/*
Plugin Name: Wufoo Shortcode Plugin
Description: Enables shortcode to embed Wufoo forms. Usage: <code>[wufoo username="chriscoyier" formhash="x7w3w3" autoresize="true" height="458" header="show" ssl="true"]</code>. This code is available to copy and paste directly from the Wufoo Code Manager.
Version: 1.3
License: GPL
Author: Chris Coyier / Wufoo
Author URI: http://wufoo.com
*/

function createWufooEmbedJS($atts, $content = null) {
	extract(shortcode_atts(array(
		'username'   => '',
		'formhash'   => '', 
		'autoresize' => true,
		'height'     => '500',
		'header'     => 'show', 
		'ssl'        => '',
		'defaultv' => ''
	), $atts));
	
	if (!$username or !$formhash) {
		
		$error = "
		<div style='border: 20px solid red; border-radius: 40px; padding: 40px; margin: 50px 0 70px;'>
			<h3>Uh oh!</h3>
			<p style='margin: 0;'>Something is wrong with your Wufoo shortcode. If you copy and paste it from the <a href='http://wufoo.com/docs/code-manager/'>Wufoo Code Manager</a>, you should be golden.</p>
		</div>";
		
		return $error;
		
	} else {
		
		$JSEmbed = '<script type="text/javascript">var host = (("https:" == document.location.protocol) ? "https://secure." : "http://");document.write(unescape("%3Cscript src=\'" + host + "wufoo.com/scripts/embed/form.js\'  type=\'text/javascript\'%3E%3C/script%3E"));</script>';
	
		$JSEmbed .= "<script type='text/javascript'>";
		$JSEmbed .= "var $formhash = new WufooForm();";
		$JSEmbed .= "$formhash.initialize({";
		$JSEmbed .= "'userName':'$username', ";
		$JSEmbed .= "'formHash':'$formhash', ";
		$JSEmbed .= "'autoResize':$autoresize,";
		$JSEmbed .= "'height':'$height',";
		$JSEmbed .= "'header':'$header', ";
		$JSEmbed .= "'defaultValues' : '$defaultv'";
		
		// Only output SSL value if passes as param
		// Gratis and Ad Hoc plans don't show that param (don't offer SSL)
		if ($ssl) {
			$JSEmbed .= ",'ssl':$ssl";
		}
		
		$JSEmbed .= "});";
		
		$JSEmbed .= "$formhash.display();";
		$JSEmbed .= "</script>";

		/**
		* iframe embed, loaded inside <noscript> tags
		*/
		$iframe_embed = '<iframe ';
		$iframe_embed .= 'height="'. (int) $height .'" ';
		$iframe_embed .= 'allowTransparency="true" frameborder="0" scrolling="no" style="width:100%;border:none;"';
		$iframe_embed .= 'src="https://'. $username .'.wufoo.com/embed/'. $formhash . '/';
		$iframe_embed .= "def/$defaultv\">";
		$iframe_embed .= '<a href="https://'. $username .'.wufoo.com/forms/'. $formhash .'/';
		$iframe_embed .= "def/$defaultv\" ";
		$iframe_embed .= 'rel="nofollow">Fill out my Wufoo form!</a></iframe>';
				
		/**
		* Return embed in JS and iframe
		*/
		return "$JSEmbed <noscript> $iframe_embed </noscript>";
			
	}
}

add_shortcode('wufoo', 'createWufooEmbedJS');

?>