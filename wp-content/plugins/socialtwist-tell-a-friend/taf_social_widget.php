<?php
/*
Plugin Name: Tell-a-Friend Widget Plugin
Plugin URI: http://tellafriend.socialtwist.com
Description: Tell-a-Friend Widget Plugin for Wordpress
Version: 1.0
Author: socialtwist
Author URI: http://tellafriend.socialtwist.com
*/

class taf_social_widget{

  //=====================================
  //Want stats with your AddThis plugin?
  //Put your AddThis username in this variable

    var $addthis_username = "";
  //=====================================


  function taf_social_widget(){
     add_filter('the_content', array(&$this, 'social_widget'));
  }

  function social_widget_doposts($content){

     for ($i=0; $i<10; $i++){
         $content .= $this->social_widget_post($i);
     }
     return $content;
  }

  function social_widget($content){
     $link  = urlencode(get_permalink());
     $title = urlencode(get_the_title($id));

     return $content . $this->social_widget_badge($link, $title);
  }

  function social_widget_post($entry){
     $link  = urlencode(get_permalink());
     $title = urlencode(get_the_title($id));
     if (!isset($link)){
       $widget_post  = $this->social_widget_badge($link, $title);
       $widget_post .= $this->social_widget_postit($entry);
     }
     return $widget_post;
  }

  function social_widget_badge($link, $title){
    $pub = $this->pramati_username;
	$reply = "<div id=\"st0000000001\" class=\"st-taf\"><script src=\"http://taf.socialtwist.com:80/taf/js/shoppr.core.js?id=0000000001\"></script><img style=\"border:0;margin:0;padding:0;\" src=\"http://tellafriend.socialtwist.com:80/wizard/images/tafbutton_blue16.png\" onmouseout=\"hideHoverMap(this)\" onmouseover=\"showHoverMap(this, '0000000001', '$link', '$title')\" onclick=\"cw(this, {id:'0000000001',link: '$link', title: '+$title+' })\"/></div>";
    return $reply;
  }

  function social_widget_postit($i){
     add_filter('the_content', array(&$this, 'social_widget'));
     $content = $this->social_widget($content);

     $cut = explode("|", $content);
     $post = $cut[0];
     $link  = $cut[1];
     return content . "<br />$link";
  }

}

$pramati &= new taf_social_widget();

?>