<?

require( 'Peachy/Init.php' );

$x = Peachy::newWiki("PortalBot"); //Loads the Configs/sample.cfg file

$x->set_runpage("Portal:Australian Business/Wikinews/Switch");

$y = initPage( "Main_Page/OTD" );

$handle = fopen("http://en.wikipedia.org/wiki/Main_Page", "rb");
$contents = '';
while (!feof($handle)) {
  $contents .= fread($handle, 8192);
}
fclose($handle);

//Find business section
$business         =  strpos($contents, "<span class=\"mw-headline\" id=\"On_this_day...\">On this day...</span>");
//Find start of ordered list after business section
$string_start     =  strpos($contents, "<ul>", $business);
//Find the end of the ordered list after that
$string_end       =  strpos($contents, "</ul>", $string_start);
//Grab that section
$wikinews         =  substr($contents, $string_start+5, $string_end - $string_start-6);

//Convert html list to wiki list
$wikinews         =  str_replace("<li>", "*", $wikinews);
$wikinews         =  str_replace("</li>", "", $wikinews);

//Convert html links to Wiki links
preg_match_all('#<a href=\"([^>\"]+)\"([^>]+)>(.+?)</a>#',$wikinews,$results);

//Parse the preg match
$news = "";
for ($i=0; $i < max(array_map('count', $results)); $i++) {
   $news       .=    "*[http://en.wikipedia.org" . $results[1][$i] . " " . $results[3][$i] . "]\n";
}

   $html        =    "{| class=\"main-page-cell\" style=\"width: 100%\"\n";
   $html       .=    "| class=\"main-page-cell-header\" | On this day...\n";
   $html       .=    "|-\n";
   $html       .=    "|\n";
   $html       .=    $wikinews . "\n";
   $html       .=    "|}";

$y->edit($html, "Updating OTD from Wikipedia", true);
