<?php
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'vserra' );

/** MySQL database password */
define( 'DB_PASSWORD', '123soleil' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

// ** Authentication Unique Keys and Salts. ** //
define( 'AUTH_KEY',         'e4WvxGz`Wn|4>&@mY9iM9A6[w^-LAmf-86+@sv6b 11rK?XA,kax-|1iYyr5[;5K' );
define( 'SECURE_AUTH_KEY',  'C3tk|[poAR;W5=ArZ( L+O+NbPa,&h`c3vFMkU~-T_b5=?TVzaw*dPzBZDS_z.+j' );
define( 'LOGGED_IN_KEY',    'xqjuR7sRQPZ,=aIzv91c BWHa4 ^+,,@t c^ju?6O*A_2:x|*9ipm1Y/y[10PpHv' );
define( 'NONCE_KEY',        '.<MrGUo`5onLp2(DK?twOCl/DBom#]n_qB#CLUQ*R-^5w1]SGedLhr+yR^?VrB=s' );
define( 'AUTH_SALT',        '0 k<@]|&~R:/ne; #:Z=khXb.CRV:`B:|U2Q.W/XX^vO2QUAK@/~k|D4p2<$7L(T' );
define( 'SECURE_AUTH_SALT', '-Y0R2mO3~+0{9(^~>=*E_M<i?y^l|l5?QXxy];iH3Z_|,Uq?w1]D.qkwl+&DRMda' );
define( 'LOGGED_IN_SALT',   'W;z+R`0ote|s+*P&{^+j^nB4_.ob0x]5Ini3wA-.>j*vS}(fNsxQW/<A?t/U*OWy' );
define( 'NONCE_SALT',       'qvLnRDxkv3-Wp>lq_xjnl]R9T|C^MSc9ZW<rN3nb~akZM2wjG-1hjCGD}QA8lvL(' );

// ** WordPress Database Table prefix. ** //
$table_prefix = 'wp_';

// ** For developers: WordPress debugging mode. ** //
define( 'WP_DEBUG', false );

// ** Absolute path to the WordPress directory. ** //
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

// ** Sets up WordPress vars and included files. ** //
require_once ABSPATH . 'wp-settings.php';