#!/usr/bin/perl 

# Returns a json object of the collection database
use strict;

use HTML::Entities;    # So we can encode characters like <>& etc
use JSON;

sub json_page {
	my ($json) = @_;

	return <<eof;
HTTP/1.0 200 OK
Server: MisterHouse
Content-type: application/json

$json
eof

}

# This is the default collections database, need to pull user generated version
# from the data_dir as a new feature.

my %json = (
	'collections' => {
		0 => {
			'name' => 'Home',
			'icon' => 'fa-home',
			'children' => [1,2,3,4,5,6,7,8,9,10,11,12]
		},
		1 => { 
			'name' => 'Mr. House Home',
			'icon' => 'fa-home',
			'children' => [13,14,15,16,17,18,19,20,29,30]
		},
		2 => { 
			'name' => 'Mail and News',
			'children' => [43,44,45,46,47],
			'icon' => 'fa-envelope',
		},
		3 => { 
			'name' => 'Modes',
			'children' => [48,49,50],
			'icon' => 'fa-tasks',
		},
		4 => { 
			'name' => 'Lights & Appliances',
			'children' => [51,52,53,54,55,56,57],
			'icon' => 'fa-lightbulb-o',
		},
		5 => { 
			'name' => 'HVAC & Weather',
			'children' => [58,59,60,61,62,63,64,65,66,67],
			'icon' => 'fa-umbrella',
		},
		6 => { 
			'name' => 'Security Cameras',
			'children' => [68,69,70,71,72,73,74,75,76],
			'icon' => 'fa-video-camera',
		},
		7 => { 
			'name' => 'Phone Calls & VoiceMail Msgs',
			'children' => [77,78,79,80,81,82,83,84,85],
			'icon' => 'fa-phone',
		},
		8 => { 
			'name' => 'TV/Radio Guide & MP3 Music',
			'children' => [86,87,88,89,90,91,92,93,94,95,96],
			'icon' => 'fa-music',
		},
		9 => { 
			'name' => 'Speech',
			'children' => [97,98,99,100],
			'icon' => 'fa-microphone',
		},
		10 => { 
			'name' => 'Comics & Pictures',
			'children' => [101,102,103,104],
			'icon' => 'fa-picture-o',
		},
		11 => { 
			'name' => 'Events, Calendar, & Clock',
			'children' => [105,106,107,108,109,110,111,112,113,114,115],
			'icon' => 'fa-calendar',
		},
		12 => { 
			'name' => 'Statistics & Logged Data',
			'children' => [36,37,38,39,40,41,42],
			'icon' => 'fa-bar-chart-o',
		},
		13 => { 
			'name' => 'About MrHouse',
			'link' => '/ia7/house/main.shtml',
			'icon' => 'fa-home',
		},
		14 => { 
			'name' => 'About 3Com Audrey',
			'link' => '/ia7/house/aboutaudrey.shtml',
			'icon' => 'fa-desktop',
		},
		15 => { 
			'name' => 'Browse MrHouse',
			'link' => '/ia7/#request=list&type=categories&name=MisterHouse',
			'icon' => 'fa-home',
		},
		16 => { 
			'name' => 'Browse Categories',
			'link' => '/ia7/#request=list&type=categories',
			'icon' => 'fa-archive',
		},
		17 => { 
			'name' => 'Browse Groups',
			'link' => '/ia7/#request=list&type=groups',
			'icon' => 'fa-group',
		},
		18 => { 
			'name' => 'Browse Items',
			'link' => '/ia7/#request=list&type=types',
			'icon' => 'fa-info',
		},
		19 => { 
			'name' => 'Browse Widgets',
			'icon' => 'fa-gears',
			'children' => [31,32,33,34,35]
		},
		20 => { 
			'name' => 'Setup MrHouse',
			'icon' => 'fa-wrench',
			'children' => [21,22,23,24,25,26,27,28]
		},
		21 => { 
			'name' => 'Common Code Activation',
			'link' => '/bin/code_select.pl',
			'icon' => 'fa-code',
		},
		22 => { 
			'name' => 'User Code Activation',
			'link' => '/bin/code_unselect.pl',
			'icon' => 'fa-code',
		},
		23 => { 
			'name' => 'Edit Triggers',
			'link' => '/bin/triggers.pl',
			'icon' => 'fa-clock-o',
		},
		24 => { 
			'name' => 'Edit Items',
			'link' => '/bin/items.pl',
			'icon' => 'fa-list',
		},
		25 => { 
			'name' => 'INI Editor',
			'link' => '/bin/iniedit.pl',
			'icon' => 'fa-table',
		},
		26 => { 
			'name' => 'Program IRMAN',
			'link' => '/ia5/house/irman.shtml',
			'icon' => 'fa-rss',
		},
		27 => { 
			'name' => 'Header Control',
			'link' => '/bin/headercontrol.pl',
			'icon' => 'fa-wrench',
		},
		28 => { 
			'name' => 'Setup TV Provider',
			'link' => '/bin/set_parm_tv_provider.pl',
			'icon' => 'fa-desktop',
		},
		29 => { 
			'name' => 'List Global Variables',
			'link' => '/ia7/#request=list&type=vars',
			'icon' => 'fa-globe',
		},
		30 => { 
			'name' => 'List Save Variables',
			'link' => '/ia7/#request=list&type=save',
			'icon' => 'fa-save',
		},
		31 => { 
			'name' => 'All Widgets',
			'link' => '/ia7/widgets',
			'icon' => 'fa-cogs',
		},
		32 => { 
			'name' => 'Label Widgets',
			'link' => '/ia7/widgets_label',
			'icon' => 'fa-square-o',
		},
		33 => { 
			'name' => 'Entry Widgets',
			'link' => '/ia7/widgets_entry',
			'icon' => 'fa-pencil-square-o',
		},
		34 => { 
			'name' => 'Radiobutton Widgets',
			'link' => '/ia7/widgets_radiobutton',
			'icon' => 'fa-dot-circle-o',
		},
		35 => { 
			'name' => 'Checkbox Widgets',
			'link' => '/ia7/widgets_checkbox',
			'icon' => 'fa-check-square-o',
		},
		36 => { 
			'name' => 'View Print Log',
			'link' => '/ia7/#request=print_log',
			'icon' => 'fa-list',
		},
		37 => { 
			'name' => 'View Speech Log',
			'link' => '/ia5/statistics/speechlog.shtml',
			'icon' => 'fa-bullhorn',
		},
		38 => { 
			'name' => 'View Error Log',
			'link' => '/ia5/statistics/errorlog.shtml',
			'icon' => 'fa-warning',
		},
		39 => { 
			'name' => 'View Backup Log',
			'link' => '/ia5/statistics/backuplog.shtml',
			'icon' => 'fa-floppy-o',
		},
		40 => { 
			'name' => 'WebServer Statistics',
			'link' => '/ia5/statistics/webstats.shtml',
			'icon' => 'fa-link',
		},
		41 => { 
			'name' => 'HouseServer Statistics',
			'link' => '/ia5/statistics/housestats.shtml',
			'icon' => 'fa-home',
		},
		42 => { 
			'name' => 'Browse This Category',
			'link' => '/ia7/widgets_checkbox',
			'icon' => 'fa-ellipsis-v',
		},
		43 => { 
			'name' => 'Read e-mail',
			'link' => '/ia5/news/main.shtml',
			'icon' => 'fa-envelope',
		},
		44 => { 
			'name' => 'Read CNN',
			'external' => '//www.cnn.com',
			'icon' => 'fa-book',
		},
		45 => { 
			'name' => 'Newsgroups',
			'external' => '//groups.google.com/grphp',
			'icon' => 'fa-group',
		},
		46 => { 
			'name' => 'Postal Mailbox',
			'link' => '/ia5/news/postalmail.shtml',
			'icon' => 'fa-inbox',
		},
		47 => { 
			'name' => 'Browse News',
			'link' => '/ia5/news/browse.shtml',
			'icon' => 'fa-list-alt',
		},
		48 => { 
			'name' => 'Control Modes & Events',
			'link' => '/ia5/modes/main.shtml',
			'icon' => 'fa-tasks',
		},
		49 => { 
			'name' => 'Menu Control',
			'link' => '/bin/menu.pl',
			'icon' => 'fa-list-alt',
		},
		50 => { 
			'name' => 'Browse Modes',
			'link' => '/ia5/modes/browse.shtml',
			'icon' => 'fa-th',
		},
		51 => { 
			'name' => 'Browse Groups',
			'link' => '/ia7/#request=list&type=groups',
			'icon' => 'fa-group',
		},
		52 => { 
			'name' => 'Control X10 Items',
			'link' => '/ia7/#request=list&type=types&name=X10_Item',
			'icon' => 'fa-info',
		},
		53 => { 
			'name' => 'Control X10 Appliances',
			'link' => '/ia7/#request=list&type=types&name=X10_Appliance',
			'icon' => 'fa-sitemap',
		},
		55 => { 
			'name' => 'Browse All Lights',
			'link' => '/ia7/#request=list&type=groups&name=All_Lights',
			'icon' => 'fa-lightbulb-o',
		},
		56 => { 
			'name' => 'Browse Appliances',
			'link' => '/ia7/#request=list&type=groups&name=Appliances',
			'icon' => 'fa-sitemap',
		},
		57 => { 
			'name' => 'Floorplan View',
			'link' => '/bin/floorplan.pl',
			'icon' => 'fa-home',
		},
		58 => { 
			'name' => 'Weather Underground',
			'external' => 'http://www.wunderground.com/cgi-bin/findweather/getForecast?query=91403',
			'icon' => 'fa-sun-o',
		},
		59 => { 
			'name' => 'Weather.com - Local',
			'external' => 'http://www.weather.com/weather/local/91403',
			'icon' => 'fa-cloud',
		},
		60 => { 
			'name' => 'Weather.com - National',
			'external' => 'http://www.weather.com/maps/maptype/currentweatherusnational/index_large.html',
			'icon' => 'fa-globe',
		},
		61 => { 
			'name' => 'Weather Station',
			'link' => '/ia5/outside/weather_index.shtml',
			'icon' => 'fa-bolt',
		},
		62 => { 
			'name' => 'HVAC',
			'link' => '/ia7/#request=list&type=groups&name=HVAC',
			'icon' => 'fa-dashboard',
		},
		63 => { 
			'name' => 'Sun & Moon Data',
			'link' => '/ia5/outside/sunmoon.shtml',
			'icon' => 'fa-moon-o',
		},
		64 => { 
			'name' => 'Earthquakes',
			'link' => '/ia5/outside/earthquakes.shtml',
			'icon' => 'fa-bullseye',
		},
		65 => { 
			'name' => 'Iridium Flares',
			'link' => '/ia5/outside/sattelite.shtml',
			'icon' => 'fa-fire',
		},
		66 => { 
			'name' => 'GPS/ APRS Tracking',
			'link' => '/ia5/outside/tracking.shtml',
			'icon' => 'fa-road',
		},
		67 => { 
			'name' => 'Browse Category',
			'link' => '/ia5/outside/browse.shtml',
			'icon' => 'fa-archive',
		},
		68 => { 
			'name' => 'Basic Overview',
			'link' => '/ia5/security/main.shtml',
			'icon' => 'fa-video-camera',
		},
		69 => { 
			'name' => 'Windowed Overview',
			'link' => '/ia5/security/webcam.shtml',
			'icon' => 'fa-th-large',
		},
		70 => { 
			'name' => 'Time Lapse Viewer',
			'link' => '/ia5/security/wc_sshow.shtml',
			'icon' => 'fa-clock-o',
		},
		71 => { 
			'name' => 'Camera Files',
			'link' => '/cameras/',
			'icon' => 'fa-film',
		},
		72 => { 
			'name' => 'Frontdoor Camera',
			'link' => '/ia5/security/frontdoor.shtml',
			'icon' => 'fa-home',
		},
		73 => { 
			'name' => 'Backyard Camera',
			'link' => '/ia5/security/backyardcam.shtml',
			'icon' => 'fa-pagelines',
		},
		74 => { 
			'name' => 'Desktop Camera',
			'link' => '/ia5/security/desktopcam.shtml',
			'icon' => 'fa-desktop',
		},
		75 => { 
			'name' => 'Floorplan View',
			'link' => '/bin/floorplan.pl',
			'icon' => 'fa-building-o',
		},
		76 => { 
			'name' => 'Floorplan View2',
			'link' => '/ia5/security/floorplan.shtml',
			'icon' => 'fa-building-o',
		},
		77 => { 
			'name' => 'Recent Incoming Calls',
			'link' => '/bin/phone_in.pl',
			'icon' => 'fa-arrow-down',
		},
		78 => { 
			'name' => 'Recent Outgoing Calls',
			'link' => '/bin/phone_out.pl',
			'icon' => 'fa-arrow-up',
		},
		79 => { 
			'name' => 'Search Calls',
			'link' => '/bin/phone_search.pl',
			'icon' => 'fa-search',
		},
		80 => { 
			'name' => 'Phone List',
			'link' => '/bin/phone_list.pl',
			'icon' => 'fa-list',
		},
		81 => { 
			'name' => 'VoiceMail Messages',
			'link' => '/ia5/phone/voicemail.shtml',
			'icon' => 'fa-envelope-o',
		},
		82 => { 
			'name' => 'Yellow Pages',
			'external' => 'http://www.yellowpages.com/',
			'icon' => 'fa-building-o',
		},
		83 => { 
			'name' => 'White Pages',
			'external' => 'http://www.whitepages.com/',
			'icon' => 'fa-home',
		},
		84 => { 
			'name' => 'Reverse Lookup',
			'external' => 'http://www.whitepages.com/find_person.pl?fid=p',
			'icon' => 'fa-sort-alpha-desc',
		},
		85 => { 
			'name' => 'Browse Phone',
			'link' => '/ia7/#request=list&type=categories&name=Phone',
			'icon' => 'fa-archive',
		},
		86 => { 
			'name' => 'MP3 Jukebox',
			'link' => '/misc/mp3.html',
			'icon' => 'fa-music',
		},
		87 => { 
			'name' => 'Media Center',
			'link' => '/media/mhmedia.html',
			'icon' => 'fa-play-circle',
		},
		88 => { 
			'name' => 'TV Today',
			'link' => '/tv',
			'icon' => 'fa-calendar-o',
		},
		89 => { 
			'name' => "TV Guide",
			'external' => 'http://tvguide.com/Listings/index.asp?I=70620&Zip=91403',
			'icon' => 'fa-book',
		},
		90 => { 
			'name' => "What's On Now",
			'external' => 'http://tvguide.com/tv',
			'icon' => 'fa-desktop',
		},
		91 => { 
			'name' => 'TV Shortcuts',
			'link' => '/ia5/entertain/shortcuts.shtml',
			'icon' => 'fa-bookmark-o',
		},
		92 => { 
			'name' => 'Local Movies',
			'external' => 'http://www.google.com/search?&q=movie%3A+91403',
			'icon' => 'fa-film',
		},
		93 => { 
			'name' => 'Radio Guide',
			'external' => 'http://realguide.real.com/',
			'icon' => 'fa-signal',
		},
		94 => { 
			'name' => 'Internet Radio',
			'link' => '/ia5/entertain/internetradio.shtml',
			'icon' => 'fa-sitemap',
		},
		95 => { 
			'name' => 'Browse Entertainment',
			'link' => '/ia7/#request=list&type=categories&name=Entertainment',
			'icon' => 'fa-gamepad',
		},
		96 => { 
			'name' => 'Browse Music',
			'link' => '/ia7/#request=list&type=categories&name=Music',
			'icon' => 'fa-headphones',
		},
		97 => { 
			'name' => 'View Speech Log',
			'link' => '/speech',
			'icon' => 'fa-bullhorn',
		},
		98 => { 
			'name' => 'Speak Text',
			'link' => '/ia5/speak/speakframe.html',
			'icon' => 'fa-volume-up',
		},
		99 => { 
			'name' => 'Speech Settings',
			'link' => '/ia5/speak/speechsettings.shtml',
			'icon' => 'fa-cog',
		},
		100 => { 
			'name' => 'Browse Speech',
			'link' => '/ia7/#request=list&type=categories&name=Speech',
			'icon' => 'fa-microphone',
		},
		101 => { 
			'name' => 'Daily Comics',
			'link' => '/comics/index.html',
			'icon' => 'fa-picture-o',
		},
		102 => { 
			'name' => 'Picture Frame',
			'external' => 'http://home.krkeegan.com:8081/misc/photos.shtml',
			'icon' => 'fa-desktop',
		},
		103 => { 
			'name' => 'Browse Photos',
			'link' => '/ia7/#request=list&type=categories&name=Photos',
			'icon' => 'fa-archive',
		},
		104 => { 
			'name' => 'Browse Entertainment',
			'link' => '/ia7/#request=list&type=categories&name=Entertainment',
			'icon' => 'fa-gamepad',
		},
		105 => { 
			'name' => 'Calendar Facts',
			'link' => '/ia5/calendar/main.shtml',
			'icon' => 'fa-check',
		},
		106 => { 
			'name' => 'Calendar',
			'link' => '/organizer/calendar.pl',
			'icon' => 'fa-calendar',
		},
		107 => { 
			'name' => 'Address Book',
			'link' => '/organizer/contacts.pl',
			'icon' => 'fa-book',
		},
		108 => { 
			'name' => 'TODO List',
			'link' => '/organizer/tasks.pl',
			'icon' => 'fa-list',
		},
		109 => { 
			'name' => 'Shopping List',
			'link' => '/bin/shopping_list.pl',
			'icon' => 'fa-shopping-cart',
		},
		110 => { 
			'name' => 'List Manager',
			'link' => '/bin/ListManager.pl',
			'icon' => 'fa-list-alt',
		},
		111 => { 
			'name' => 'Alarms',
			'link' => '/bin/triggers.pl',
			'icon' => 'fa-bell-o',
		},
		112 => { 
			'name' => 'Timers',
			'link' => '/misc/timers.shtml',
			'icon' => 'fa-exclamation',
		},
		113 => { 
			'name' => 'LED Clock',
			'link' => '/clock',
			'icon' => 'fa-clock-o',
		},
		114 => { 
			'name' => 'Browse Timers',
			'link' => '/ia7/#request=list&type=categories&name=Timers',
			'icon' => 'fa-exclamation-circle',
		},
		115 => { 
			'name' => 'Browse Timed_Events',
			'link' => '/ia7/#request=list&type=categories&name=Timed_Events',
			'icon' => 'fa-archive',
		},
	}
);

my $json_output = JSON->new->allow_nonref;
$json_output = $json_output->pretty->encode( \%json );
print &json_page($json_output);