<?php
/**
 * Template Name: Explore Template
 * Description: A Page Template for Explore
 *
 * @package WordPress
 * @subpackage Twenty_Eleven
 * @since Twenty Eleven 1.0
 */
get_header();
?>

<div id="primary">
  <div id="content" role="main">

    <?php while (have_posts()) : the_post(); ?>

      <nav id="nav-single">
        <h3 class="assistive-text"><?php _e('Post navigation', 'twentyeleven'); ?></h3>
        <span class="nav-previous"><?php previous_post_link('%link', __('<span class="meta-nav">&larr;</span> Previous', 'twentyeleven')); ?></span>
        <span class="nav-next"><?php next_post_link('%link', __('Next <span class="meta-nav">&rarr;</span>', 'twentyeleven')); ?></span>
      </nav><!-- #nav-single -->

      <?php get_template_part('content', 'single'); ?>

      <?php comments_template('', true); ?>

    <?php endwhile; // end of the loop. ?>

  </div><!-- #content -->
</div><!-- #primary -->

<script type="text/javascript">
  $("body").addClass("single")
</script>


<div class="semiFooterRow">
  <?php the_widget('semiFooterWidget','cat=7&title=Our Contributors'); ?> 
  <a class="meet" href="/category/contributors/">meet more of our contributors</a>
</div>
<?php get_footer(); ?>
