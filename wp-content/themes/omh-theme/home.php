<?php
/**
 *
 * Template Name: Home Page
 * Description: A Page Template for the Home Page
 *
 *
 * The template for displaying all pages.
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site will use a
 * different template.
 *
 * @package WordPress
 * @subpackage Twenty_Eleven
 * @since Twenty Eleven 1.0
 */
get_header();
?>
<div id="primary">
  <div id="content" role="main">
    <?php
    $pid = 2;
    $page_data = get_page($pid);
    $content = apply_filters('the_content', $page_data->post_content);
    echo $content;
    ?>
  </div><!-- #content -->
</div><!-- #primary -->
<?php get_sidebar(); ?>

<div class="semiFooterRow">
  <?php the_widget('semiFooterWidget', 'cat=7&title=Our Contributors'); ?> 
  <a class="meet" href="/category/contributor/">meet more of our contributors</a>
</div>


<?php get_footer(); ?>
