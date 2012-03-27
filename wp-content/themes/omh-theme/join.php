<?php
/**
 * 
 * Template Name: Join Template
 * Description: A Page Template for displaying the join page
 * 
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
  $(document).ready(function(){
    var url = 'http://openmhealth.us2.list-manage2.com/subscribe?u=2dca7723b4f125d026d41efd3&id=652d92235c'
    $("body").addClass("single")
    var m = getUrlVars()['MERGE1']
    if(m)
      url+='&MERGE1='+m
    m = getUrlVars()['MERGE0']
    if(m)
      url+='&MERGE0='+m
    m = getUrlVars()['MERGE2']
    if(m)
      url+='&MERGE2='+m
    $('iframe').attr('src',url)
  }) 
  function getUrlVars() {
    var vars = {}
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
      vars[key] = value
    })
    return vars
  }
</script>


<?php get_footer(); ?>
