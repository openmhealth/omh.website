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
  <div id="content" class="exploreContent" role="main">

    <?php while (have_posts()) : the_post(); ?>

      <nav id="nav-single">
        <h3 class="assistive-text"><?php _e('Post navigation', 'twentyeleven'); ?></h3>
        <span class="nav-previous"><?php previous_post_link('%link', __('<span class="meta-nav">&larr;</span> Previous', 'twentyeleven')); ?></span>
        <span class="nav-next"><?php next_post_link('%link', __('Next <span class="meta-nav">&rarr;</span>', 'twentyeleven')); ?></span>
      </nav><!-- #nav-single -->


      <div class="apps">
        <h1 class="entry-title">Applications <a href="submit-app">Submit an App</a></h1>
        <?php
        $my_query = new WP_Query('category_name=application&posts_per_page=8');
        ?>
        <ul class="appsProjects">
          <?php while ($my_query->have_posts()) : $my_query->the_post(); ?>
            <li>
              <div class="title">
                <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
              </div>         
              <div class="postThumbnail">
                <a href="<?php the_permalink(); ?>">    
                  <?php the_post_thumbnail('medium'); ?>
                </a>
              </div>
              <div class="description">
                <?php the_excerpt(); ?>
              </div>
            </li>
          <?php endwhile; ?>
        </ul>
      </div>

      <div class="projects">
        <h1 class="entry-title">Projects <a href="submit-project">Submit a Project</a></h1>
        <?php
        $my_query = new WP_Query('category_name=project&posts_per_page=8');
        ?>
        <ul class="appsProjects">
          <?php while ($my_query->have_posts()) : $my_query->the_post(); ?>

            <li>
              <div class="title">
                <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
              </div>         
              <div class="postThumbnail">
                <a href="<?php the_permalink(); ?>">    
                  <?php the_post_thumbnail('medium'); ?>
                </a>
              </div>
              <div class="description">
                <?php the_excerpt(); ?>
              </div>
            </li>
          <?php endwhile; ?>
        </ul>
      </div>

      <?php //comments_template('', true); ?>

    <?php endwhile; // end of the loop. ?>

  </div><!-- #content -->
</div><!-- #primary -->

<script type="text/javascript">
  $("body").addClass("single")
</script>


<div class="semiFooterRow">
  <?php the_widget('semiFooterWidget', 'cat=7&title=Our Contributors'); ?> 
  <a class="meet" href="/category/contributors/">meet more of our contributors</a>
</div>
<?php get_footer(); ?>
