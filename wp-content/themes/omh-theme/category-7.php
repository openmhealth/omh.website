<?php
/**
 * The template for displaying Category Archive pages.
 *
 * @package WordPress
 * @subpackage Twenty_Eleven
 * @since Twenty Eleven 1.0
 */
get_header();
?>

<section id="primary">
  <div id="content" role="main">

    <?php if (have_posts()) : ?>

      <header class="page-header">
        <h1 class="entry-title">Contributors</h1>

        <?php
        $category_description = category_description();
        if (!empty($category_description))
          echo apply_filters('category_archive_meta', '<div class="category-archive-meta">' . $category_description . '</div>');
        ?>
      </header>

      <?php twentyeleven_content_nav('nav-above'); ?>

      <?php /* Start the Loop */ ?>
      <ul class="appsProjects">
      <?php while (have_posts()) : the_post(); ?>
        <?php //while ($my_query->have_posts()) : $my_query->the_post(); ?>

          <li>
            <div class="postThumbnail">
              <a href="<?php the_permalink(); ?>">    
                <?php the_post_thumbnail('medium'); ?>
              </a>
            </div>

            <div class="title">
              <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
            </div>
            <div class="description">
              <?php the_excerpt(); ?>
            </div>
          </li>

          <?php
          /* Include the Post-Format-specific template for the content.
           * If you want to overload this in a child theme then include a file
           * called content-___.php (where ___ is the Post Format name) and that will be used instead.
           */
          //get_template_part('content', get_post_format());
          ?>

        <?php endwhile; ?>
      </ul>

      <?php twentyeleven_content_nav('nav-below'); ?>

    <?php else : ?>

      <article id="post-0" class="post no-results not-found">
        <header class="entry-header">
          <h1 class="entry-title"><?php _e('Nothing Found', 'twentyeleven'); ?></h1>
        </header><!-- .entry-header -->

        <div class="entry-content">
          <p><?php _e('Apologies, but no results were found for the requested archive. Perhaps searching will help find a related post.', 'twentyeleven'); ?></p>
          <?php get_search_form(); ?>
        </div><!-- .entry-content -->
      </article><!-- #post-0 -->

    <?php endif; ?>

  </div><!-- #content -->
</section><!-- #primary -->

<?php // get_sidebar(); ?>
<div class="semiFooterRow">
  <?php the_widget('omh_latest_posts'); ?> 
  <a class="meet" href="/category/uncategorized/">more posts</a>
</div>
<?php get_footer(); ?>
