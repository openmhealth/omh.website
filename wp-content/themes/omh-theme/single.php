<?php
/**
 * The Template for displaying all single posts.
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

      <?php
      global $cats;

      $cats = array();
      foreach ((get_the_category()) as $category) {
        array_push($cats, $category->cat_ID);
      }
      ?>

      <nav id="nav-single">
        <h3 class="assistive-text"><?php _e('Post navigation', 'twentyeleven'); ?></h3>
        <span class="nav-previous"><?php previous_post_link('%link', '&laquo; Previous', TRUE);//previous_post_link('%link', __('<span class="meta-nav">&larr;</span> Previous', 'twentyeleven')); ?></span>
        <span class="nav-next"><?php  next_post_link('%link', 'Next &raquo;', TRUE); //next_post_link('%link', __('Next <span class="meta-nav">&rarr;</span>', 'twentyeleven')); ?></span>
      </nav><!-- #nav-single -->

      <?php get_template_part('content', 'single'); ?>

      <?php if (in_array(1, $cats)): ?> 
        <?php comments_template('', true); ?>
      <?php endif; ?>

    <?php endwhile; // end of the loop.  ?>

  </div><!-- #content -->
</div><!-- #primary -->


<div class="semiFooterRow">
  <?php
  ?>
  <?php if (in_array(7, $cats)): ?> 
  <?php the_widget('semiFooterWidget', 'cat=13&title=Blog Entries'); ?> 
    <a class="meet" href="/category/blog/">more posts</a>
  <?php else: ?>
  <?php the_widget('semiFooterWidget', 'cat=7&title=Our Contributors'); ?> 
  <a class="meet" href="/category/contributors/">meet more of our contributors</a>
  <?php endif; ?>
</div>


<?php get_footer(); ?>
