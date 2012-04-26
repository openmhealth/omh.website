<?php
/**
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="main">
 *
 * @package WordPress
 * @subpackage Twenty_Eleven
 * @since Twenty Eleven 1.0
 */
?><!DOCTYPE html>
<!--[if IE 6]>
<html id="ie6" <?php language_attributes(); ?>>
<![endif]-->
<!--[if IE 7]>
<html id="ie7" <?php language_attributes(); ?>>
<![endif]-->
<!--[if IE 8]>
<html id="ie8" <?php language_attributes(); ?>>
<![endif]-->
<!--[if !(IE 6) | !(IE 7) | !(IE 8)  ]><!-->
<html <?php language_attributes(); ?>>
  <!--<![endif]-->
  <head>
    <meta charset="<?php bloginfo('charset'); ?>" />
    <meta name="viewport" content="width=device-width" />
    <title><?php
/*
 * Print the <title> tag based on what is being viewed.
 */
global $page, $paged;

wp_title('|', true, 'right');

// Add the blog name.
/*
  bloginfo('name');

  // Add the blog description for the home/front page.
  $site_description = get_bloginfo('description', 'display');
  if ($site_description && ( is_home() || is_front_page() ))
  echo " | $site_description";
 */

// Add a page number if necessary:
if ($paged >= 2 || $page >= 2)
  echo ' | ' . sprintf(__('Page %s', 'twentyeleven'), max($paged, $page));
?></title>

    <link rel="profile" href="http://gmpg.org/xfn/11" />
    <link href="http://fonts.googleapis.com/css?family=Merriweather:400,300,700|Open+Sans:600italic,400italic,400,600|Open+Sans+Condensed:700" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" media="all" href="<?php bloginfo('stylesheet_url'); ?>" />
    <link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />
    <!--[if lt IE 9]>
    <script src="<?php echo get_template_directory_uri(); ?>/js/html5.js" type="text/javascript"></script>
    <![endif]-->
    <?php
    /* We add some JavaScript to pages with the comment form
     * to support sites with threaded comments (when in use).
     */
    if (is_singular() && get_option('thread_comments'))
      wp_enqueue_script('comment-reply');

    /* Always have wp_head() just before the closing </head>
     * tag of your theme, or you will break many plugins, which
     * generally use this hook to add elements to <head> such
     * as styles, scripts, and meta tags.
     */
    wp_head();
    ?>
    <script type="text/javascript" 
            src="<?php echo get_template_directory_uri(); ?>/js/jquery.1.7.1.min.js">
    </script>
  </head>

  <body <?php body_class(); ?>>
    <div id="page" class="hfeed">

      <header id="branding" role="banner">
        <hgroup>
          <h1 id="site-title" onclick="window.location='<?php echo esc_url(home_url('/')); ?>';"><span><a href="<?php echo esc_url(home_url('/')); ?>" title="<?php echo esc_attr(get_bloginfo('name', 'display')); ?>" rel="home"><?php bloginfo('name'); ?></a></span></h1>
          <h2 id="site-description"><?php bloginfo('description'); ?></h2>
          <form  id="joinForm" action="/join" method="get">
            <input id="nameField" type="text" name="MERGE1"/>
            <input id="emailField" type="text" name="MERGE0"/>
            <input id="joinButton" type="submit" value="" />
          </form>

          <form method="get" id="searchForm" action="/">
            <input type="text" class="field" name="s" id="searchField" placeholder="">
            <input type="submit" class="submit" 
                   name="submit" id="searchButton" value="">
          </form>

        </hgroup>
        <div class="header-img">
          <?php
          // Check to see if the header image has been removed
          $header_image = get_header_image();
          if (!empty($header_image) && is_home()) :
            ?>
            <a href="<?php echo esc_url(home_url('/')); ?>">
              <?php
              // The header image
              // Check if this is a post or page, if it has a thumbnail, and if it's a big one
              if (is_singular() &&
                      has_post_thumbnail($post->ID) &&
                      ( /* $src, $width, $height */ $image = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), array(HEADER_IMAGE_WIDTH, HEADER_IMAGE_WIDTH)) ) &&
                      $image[1] >= HEADER_IMAGE_WIDTH) :
                // Houston, we have a new header image!
                echo get_the_post_thumbnail($post->ID, 'post-thumbnail');
              else :
                ?>
                <img class="header-img" src="<?php header_image(); ?>" 
                     style="width:670px; height:490px"/>
                   <?php endif; // end check for featured image or standard header  ?>
            </a>
          <?php endif; // end check for removed header image  ?>
        </div>
        <nav id="access" role="navigation">
          <a href="/" id="floatingLogo"></a>
          <h3 class="assistive-text"><?php _e('Main menu', 'twentyeleven'); ?></h3>
          <?php /*  Allow screen readers / text browsers to skip the navigation menu and get right to the good stuff. */ ?>
          <div class="skip-link"><a class="assistive-text" href="#content" title="<?php esc_attr_e('Skip to primary content', 'twentyeleven'); ?>"><?php _e('Skip to primary content', 'twentyeleven'); ?></a></div>
          <div class="skip-link"><a class="assistive-text" href="#secondary" title="<?php esc_attr_e('Skip to secondary content', 'twentyeleven'); ?>"><?php _e('Skip to secondary content', 'twentyeleven'); ?></a></div>
          <?php /* Our navigation menu.  If one isn't filled out, wp_nav_menu falls back to wp_page_menu. The menu assiged to the primary position is the one used. If none is assigned, the menu with the lowest ID is used. */ ?>
          <?php wp_nav_menu(array('theme_location' => 'primary', 'depth' => 1)); ?>
          <?php wp_nav_menu(array('menu' => 'Social')); ?>
        </nav><!-- #access -->
      </header><!-- #branding -->

      <?php if (is_home()): ?>
        <script type = "text/javascript">
        var win = $(window)
        $(document).ready(function() {
          $('#floatingLogo').hide()
          var branding = $('#branding');
          $(document).scroll(function(){
             var scrollTop = win.scrollTop()
             if(scrollTop > 437){
               //branding.css('top','-410px')
               branding.css('top','-437px')
               $('#floatingLogo').fadeIn(1000)  
             }
             else{
               branding.css('top','-'+scrollTop+'px')
               $('#floatingLogo').fadeOut(1000)  
             }
          })
        })

        </script>

      <?php endif; ?>

      <div id = "main">
        <script type = "text/javascript">
        $(document).ready(function() {
          $("#nameField, #emailField").each(function(){
            if($(this).val() != "")
            $(this).css("background", 
              "url(/wp-content/themes/omh-theme/images/home-input-field.png)")
          })
          $("#nameField, #emailField").focus(function(){
            $(this).css("background", 
              "url(/wp-content/themes/omh-theme/images/home-input-field.png)")
          }).blur(function(){
            var elm = $(this)
            if(elm.val() != "")
              elm.css("background", 
              "url(/wp-content/themes/omh-theme/images/home-input-field.png)")
            else
              elm.css("background","") 
              
          })
        })
        

        </script>

