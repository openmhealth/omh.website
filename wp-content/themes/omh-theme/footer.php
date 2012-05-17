<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the id=main div and all content after
 *
 * @package WordPress
 * @subpackage Twenty_Eleven
 * @since Twenty Eleven 1.0
 */
?>

</div><!-- #main -->

<footer id="colophon" role="contentinfo">

  <?php
  /* A sidebar in the footer? Yep. You can can customize
   * your footer with three columns of widgets.
   */
  if (!is_404())
    wp_nav_menu(array('theme_location' => 'primary', 'depth' => 0));
  //get_sidebar('footer');
  ?>
  <div class="addr">
    <div class="addrName">Open mHealth</div>
    <div class="addrStreet">1014 Torney Ave.</div>
    <div class="addrCityState">San Francisco, CA</div>
    <div class="addrZip">94129</div>
    <div class="addrEmail">
      <a href="mailto:admin@openmhealth.org">admin@openmhealth.org</a>
    </div>
  </div>
  <div class="disclaimer">Copyright 2012 Open mHealth, a project of the <a href="http://www.tides.org">Tides Center</a>. All Rights Reserved. | <a href="/media-asset-library">Media Kit</a> | <a href="/privacy">Privacy</a> | <a href="/terms-of-use">Terms of Use</a>
  </div>


</footer><!-- #colophon -->
</div><!-- #page -->

<?php wp_footer(); ?>

<script type="text/javascript">
  $("#s").attr("placeholder","");
</script>

</body>
</html>
