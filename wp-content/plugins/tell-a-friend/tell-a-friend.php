<?php
/*
Plugin Name: Tell a Friend
Version: 0.1
Plugin URI: http://www.freetellafriend.com/get_button/
Description: Adds a 'Share This Post' button after each post. The service which is used is freetellafriend.com which supports e-mail address book, social bookmarks and favorites.
Author: FreeTellaFriend
Author URI: http://www.freetellafriend.com/
*/

function tell_a_friend($content) {
global $post;
$taf_permlink = urlencode(get_permalink($post->ID));
$taf_title = urlencode(get_the_title($post->ID) );
$taf_img = get_settings('home') . '/wp-content/plugins/tell-a-friend/button.gif';

	if ( !is_feed() && !is_page() ) {
	$content .= '<a href="https://www.freetellafriend.com/tell/?url='.$taf_permlink.'&title='.$taf_title.'" onclick="window.open(\'https://www.freetellafriend.com/tell/?url='.$taf_permlink.'&title='.$taf_title.'\', \'freetellafriend\', \'scrollbars=1,menubar=0,width=617,height=530,resizable=1,toolbar=0,location=0,status=0,screenX=210,screenY=100,left=210,top=100\'); return false;" target="_blank" title="Share This Post"><img src="'.$taf_img.'" style="width:127px;height:16px;border:0px;" alt="Share This Post" title="Share This Post" /></a>';				  
	}

return $content;
}

add_filter('the_content', 'tell_a_friend');

?>