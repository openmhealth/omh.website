<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'omh');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Z0pxG9[.-/!|.M&4/VOBkbsEtkQ>0?V|3J&K@zm{ kW~`7.g333Hn_jma}v{,G>F');
define('SECURE_AUTH_KEY',  'V#m(X/7LgNB4 g,ji0BuM7.Q;g6(:c!tSXRyJR)Gz#oUo>?0/q-8GJ{;)/xr5Z[t');
define('LOGGED_IN_KEY',    'K~mr7~YIP]V=-Rb&ebF[Yu?oIxuG5V)IYt~WZc(KvI=^*NTyyb9X(lcmhJ0sw_Ok');
define('NONCE_KEY',        'uK.h/|7-yTVSO.9:Q6L$3nQ%4o).H)_in7!mz!o;r|Mw:2ws,*svpEv0Z?dHykK+');
define('AUTH_SALT',        ',[&oF@o=o{O&z I@jTWJ`;7REvEObFgbg,3I;&44{Gmi;K=x}c~S}@}rs $4} CA');
define('SECURE_AUTH_SALT', '(1iTjoHh/RA(x]jYF3yRiW`i!v9s?570m8zb_Rc[_-9wAHrY@%Pi/4^U8t~_<#G%');
define('LOGGED_IN_SALT',   'WO$J@han g,t.7 ?ih.7nnSA@45LHfFO+%U(t$f`l.,^=*1Jn&Yt2)LaWAatp(H;');
define('NONCE_SALT',       '0V9ty1(]2K3Gi1y%2DL:pZrnw*eU~{$)hw0wF~73ZT4+2Y6NYN-^TPj?gnb)yDnD');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

