<?php
// playlist.netのSDK読み込み
require_once "ShareMyPlaylists.php";

// public と privateのキー
$public = "kfhIYS6oLegNBN41wjwVsQKPmCyJhuKC";
$private = "pJevp9kOnvRImFW1";

$smp = new ShareMyPlaylists_Api($public, $private);

for ($i=1; $i < 100; $++) {
$parameters = array(
	"id" => 154822
);

$get_playlist = $smp->api("playlists.get", $parameters);

$playlist[] = $get_playlist["playlist"];

}

var_dump($playlist);

// if( !empty($playlist) )
// {
// 	print "<a class=\"image\" href=\"\"><img src=\"".$playlist["image_l"]."\" /></a>";
// }

