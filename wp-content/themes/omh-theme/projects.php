<?php
/**
 * Template Name: Project Template
 * Description: A Page Template for displaying projects
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

        <?php
        $category_description = category_description();
        if (!empty($category_description))
          echo apply_filters('category_archive_meta', '<div class="category-archive-meta">' . $category_description . '</div>');
        ?>
      </header>

      <?php twentyeleven_content_nav('nav-above'); ?>

      <h1 class="entry-title">Projects</h1>
      <br/>
      <?php
      $my_query = new WP_Query('category_name=project&posts_per_page=10');
      ?>
      <ul class="appsProjects">
        <?php while ($my_query->have_posts()) : $my_query->the_post(); ?>

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


    <?php endif; ?>

  </div><!-- #content -->
</section><!-- #primary -->

<?php // get_sidebar();  ?>
<div class="semiFooterRow">
  <?php the_widget('semiFooterWidget','cat=6&title=More Projects'); ?> 
</div>
<?php get_footer(); ?>
