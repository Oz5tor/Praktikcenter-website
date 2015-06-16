========================================================================
======================== Forum Module Read Me ==========================
========================================================================
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
------------------------------------------------------------------------
Start date: june 2013
Author: Tor "Topper" "Oz5tor" Soya.
Designer: Johny "Jonner" Jensen.
Code language: PhP, MySQL, HTML, CSS
Lincens:
Develorpers:
------------------------------------------------------------------------
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Last Update: June 2014
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
permissions to be set:
------------------------------------------------------------------------
$_SESSION['Forum kategori mod'] = 1;	// NOTE: allows one to create,delete and edit categories
$_SESSION['Forum traad] = 1;			// NOTE: allows one to create threads
$_SESSION['Forum traad mod] = 1;		// NOTE: allows one to delete, sticky / unsticky and editing them
$_SESSION['Forum reply] = 1;			// NOTE: allows one to respond to threads
$_SESSION['Forum svar mod] = 1;			// NOTE: allows one to delete replies in threads
------------------------------------------------------------------------
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
whats files hold what parts:
------------------------------------------------------------------------
# forum_index.php			// is the file to include to get the forum into the site
# forum_sql.sql				// holde the tables there is req for the forum to work
# forum_fuctions.php		// holds the main function and are mostly the core ofthe forum module.
------------------------------------------------------------------------
# forum_traade.php 			// is the list over what threads there is
# forum_traad_content_2.php	// is the file where all the replys in a theard is showen
# forum_traad_content.php 	// is where the threads owners text is
# forum_ret_traad.php		// is for editing a owner can editing hes/her's threads
# forum_flyt_traad.php		// makes i poseble to move the threads to a othere categories
# forum_reply_ret.php		// makes it poseble for peeps there are replying to editing theire posts
------------------------------------------------------------------------
# forum_kategori_list.php 	// is where all the categories are showen
# forum_kategorier.php		// this file should porbely be calle create category = its for creating new category
# forum_ret_kat.php			// for edeting the title of a category
------------------------------------------------------------------------
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
To Do:
------------------------------------------------------------------------
# Add: Vote/like system
# FIX: its poseble to view and reply to hidden threads and category if you know the url.
------------------------------------------------------------------------
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
========================================================================
========================================================================