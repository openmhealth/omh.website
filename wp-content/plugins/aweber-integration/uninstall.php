<?php

// Plugin uninstall tasks

if ( !defined( 'ABSPATH') || !defined('WP_UNINSTALL_PLUGIN') ) {
  return;
}

delete_option('om4_aweber_db_version');
delete_option('om4_aweber_account_id');
delete_option('widget_om4_aweber');


?>