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
    <?php $posts = query_posts($query_string . '&orderby=date&order=asc'); ?>
    <?php if ($posts) : ?>

      <header class="page-header">
        <h1 class="page-title"><?php
    printf(__('Category Archives: %s', 'twentyeleven'), '<span>' . single_cat_title('', false) . '</span>');
      ?></h1>

        <?php
        $category_description = category_description();
        if (!empty($category_description))
          echo apply_filters('category_archive_meta', '<div class="category-archive-meta">' . $category_description . '</div>');
        ?>
      </header>

      <?php twentyeleven_content_nav('nav-above'); ?>

      <h1 class="entry-title">Our Contributors
        <br/>
        <a class="btn" href="/become-a-contributor/" 
           style="font-weight:normal">Become a Contributor</a>
      </h1>
      <br/>
      <?php /* Start the Loop */ ?>
      <?php while (have_posts()) : the_post(); ?>

        <div>
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
        </div>

      <?php endwhile; ?>

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
  <?php the_widget('semiFooterWidget', 'cat=13&title=Blog Articles'); ?> 
  <a class="meet" href="/category/blog/">more articles</a>
</div>
<?php get_footer(); ?>
