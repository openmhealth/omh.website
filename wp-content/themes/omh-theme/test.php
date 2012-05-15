<?php
/**
 * Template Name: Test template
 * Description: A Page Template for displaying applications
 *
 * @package WordPress
 * @subpackage Twenty_Eleven
 * @since Twenty Eleven 1.0
 */
get_header();
?>

<section id="primary">
  <div id="content" role="main">
    <div class="btn btn-primary">Test Button</div>
  </div><!-- #content -->
</section><!-- #primary -->

<?php // get_sidebar();  ?>
<div class="semiFooterRow">
  <?php the_widget('semiFooterCarousel', 'cat=7&title=Our Contributors'); ?> 
  <a class="meet" href="/category/contributor/">meet more of our contributors</a>
</div>
<?php get_footer(); ?>
