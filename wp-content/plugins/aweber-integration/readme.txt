=== AWeber Integration ===
Contributors: jamescollins, glenn-om4
Donate link: http://om4.com.au/wordpress-plugins/#donate
Tags: aweber, widget, analytics, wp, multisite, wpmu, mailing list, sidebar, email, mail
Requires at least: 2.8
Tested up to: 3.2
Stable tag: 2.2

A simple way to add one or more AWeber email subscription form(s) to your sidebar and optionally enable AWeber email web analytics for your website.

== Description ==

This plugin provides a simple way to add one or more [AWeber](http://www.aweber.com) form(s) to your sidebar 
and optionally enable [AWeber email web analytics](http://www.aweber.com/email-analytics.htm) for your website.

It gives you access to two "AWeber Mailing List" sidebar widgets that let you enter the subscription form's details. 
These details are used to automatically display your AWeber email subscription form.

Both the Javascript Snippet and Raw HTML integration methods are supported.

The settings page lets you enter your AWeber account id. Once entered, the AWeber web email analytics tracking code 
will be automatically enabled on all pages in your website. No manual page or template editing is required.

Compatible with WordPress Multisite.

Very useful for Multisite based installations where JavaScript and `<form>` snippets are not allowed.

See the [AWeber Integration Plugin](http://om4.com.au/wordpress-plugins/wordpress-aweber-plugin/) home page for further information.

== Installation ==

Installation of this plugin is simple:

1. Upload the entire `aweber-integration` directory to the `/wp-content/plugins/` directory.
1. Activate the plugin through the 'Plugins' menu in WordPress.
1. Add an AWeber Mailing List widget to your sidebar and configure its options.
1. (Optionally) visit Settings -> AWeber to enable AWeber analytics.

== Frequently Asked Questions ==

= I'm having trouble with my Raw HTML widgets =

See http://om4.com.au/wordpress-plugins/wordpress-aweber-plugin/migrate-widget/ for detailed instructions on how to migrate these to use the new Javascript snippet widget.

= If I install this plugin, will people get my new posts e-mailed to them automatically? =

This plugin isn't designed specifically to do that, however AWeber does have a [blog broadcast feature](http://www.aweber.com/faq/questions/183/How+Do+I+Create+a+Blog+Broadcast%3F) where you add your blog's RSS feed to your AWeber account, and AWeber will automatically email your list subscribers when it detects a new blog post.

This plugin could be used to add an AWeber subscription widget to your website's sidebar, and then using blog subscriptions these subscribers could be notified via email of new blog posts.

= The widget does not appear on my website? =

Go to Dashboard -> Appearance -> Widgets and ensure the AWeber Mailing List widget has been added to the appropriate sidebar. The widget must have a valid Javascript snippet entered before it will display on your website. The widget title is optional.

= Does the widget support more than a basic Name/Email subscription form? =

Yes! You must use the Javascript snippet embed method (not the Raw HTML embed method) to be able to do this.

= The AWeber analytics tracking code does not appear on my website? =

Ensure that you've set up your account ID in the settings page. If the code still does not appear before your `</body>` tag,
ensure your theme's `footer.php` contains a call to `wp_footer()`.

= How do I find my AWeber analytics account id? =

Your account ID can be found by logging into your AWeber account, clicking on Reports, then Settings. Your account ID is displayed in the text box, and is the alphanumeric code after the ?id= code.

If you don't have the Reports -> Settings menu in your AWeber account, you are probably on an old AWeber account package. You will need to contact AWeber support to get your account upgraded to a new plan that includes the analytics option.

== Screenshots ==
1. Aweber Widget Configuration Panel
2. Aweber Email Analytics Integration
3. Example widget in sidebar

== Changelog ==

= 2.2 =
* WordPress 3.2 compatibility.

= 2.1 =
* WordPress 3.1 compatibility.

= 2.0 =
* Add support for customised/advanced web forms using AWeber's JavaScript snippet embed method
* Deprecate the Raw HTML widget that only supports name and email fields
* Fix "Your form submission was successful but the website owner of the previous page did not provide a valid redirect ("Thank You") page" error message
* Use the new WordPress 2.8+ widget format
* WordPress 3.0 support
* Update Screenshots

= 1.1.6 =
* Add support for the "Already Subscribed Page" option.

= 1.1.5 =
* Make the examples on the widget configuration screen more obvious.
* Improve FAQs.

= 1.1.4 =
* Improve FAQs and update for 2.8.3 compatibility.

= 1.1.3 =
* Readme file updated for 2.8.1 compatibility.

= 1.1.2 =
* Plugin settings now removed only when deleting the plugin via the plugins page.

= 1.1.1 =
* No longer delete plugin settings upon deactivation.

= 1.1 =
* Added translation support.
* Settings page WP 2.7+ UI improvements.
* Add instructions on finding your AWeber analytics account id.
* Added a third screenshot.
* Remove settings upon deactivation.
* WP 2.8 compatibility.

= 1.0.2 =
* PHP 4 compatibility fix.

= 1.0.1 =
* Add screenshots.
* Standardize field widths in widget configuration page.

= 1.0.0 =
* Inital release.

== Upgrade Notice ==

= 2.2 =
* WordPress 3.1 compatibility.

= 2.1 =
* WordPress 3.1 compatibility.

= 2.0 =
This version only compatible with WordPress 2.8 and higher.
It is recommended that you migrate your existing AWeber widgets to the new Javascript snippet method. See http://om4.com.au/wordpress-plugins/wordpress-aweber-plugin/migrate-widget/ for detailed instructions.
