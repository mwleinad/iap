<?php
 
/*

CometChat
Copyright (c) 2012 Inscripts

CometChat ('the Software') is a copyrighted work of authorship. Inscripts 
retains ownership of the Software and any copies of it, regardless of the 
form in which the copies may exist. This license is not a sale of the 
original Software or any copies.

By installing and using CometChat on your server, you agree to the following
terms and conditions. Such agreement is either on your own behalf or on behalf
of any corporate entity which employs you or which you represent
('Corporate Licensee'). In this Agreement, 'you' includes both the reader
and any Corporate Licensee and 'Inscripts' means Inscripts (I) Private Limited:

CometChat license grants you the right to run one instance (a single installation)
of the Software on one web server and one web site for each license purchased.
Each license may power one instance of the Software on one domain. For each 
installed instance of the Software, a separate license is required. 
The Software is licensed only to you. You may not rent, lease, sublicense, sell,
assign, pledge, transfer or otherwise dispose of the Software in any form, on
a temporary or permanent basis, without the prior written consent of Inscripts. 

The license is effective until terminated. You may terminate it
at any time by uninstalling the Software and destroying any copies in any form. 

The Software source code may be altered (at your risk) 

All Software copyright notices within the scripts must remain unchanged (and visible). 

The Software may not be used for anything that would represent or is associated
with an Intellectual Property violation, including, but not limited to, 
engaging in any activity that infringes or misappropriates the intellectual property
rights of others, including copyrights, trademarks, service marks, trade secrets, 
software piracy, and patents held by individuals, corporations, or other entities. 

If any of the terms of this Agreement are violated, Inscripts reserves the right 
to revoke the Software license at any time. 

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

include_once dirname(__FILE__)."/cometchat_init.php";
include_once dirname(__FILE__)."/license.php";

$response = array();
$messages = array();
$lastPushedAnnouncement = 0;
$processFurther = 1;

$status['available'] = $language[30];
$status['busy'] = $language[31];
$status['offline'] = $language[32];
$status['invisible'] = $language[33];
$status['away'] = $language[34];

if (empty($_REQUEST['f'])) {
	$_REQUEST['f'] = 0;
}

if ($userid != 0) {
	if (!empty($_REQUEST['chatbox'])) {
		getChatboxData($_REQUEST['chatbox']);
	} else {
		if (!empty($_REQUEST['status'])) {
			setStatus($_REQUEST['status']);
		}
		$_REQUEST['initialize'] = 1;
		if (!empty($_REQUEST['initialize']) && $_REQUEST['initialize'] == 1) { 

			$response['token'] = $_SESSION['token'];

			$_SESSION['cometchat']['timedifference'] = round((($_REQUEST['currenttime']-getTimeStamp())/60)/30)*60*30;

			if (USE_COMET == 1) {
				
				$response['cometid']['id'] = md5($userid.KEY_A.KEY_B.KEY_C);
				$response['cometid']['td'] = $_SESSION['cometchat']['timedifference'];
				
				if (empty($_SESSION['cometchat']['cometmessagesafter'])) {
					$_SESSION['cometchat']['cometmessagesafter'] = getTimeStamp();
				}
				$response['initialize'] = 0;
				$response['init'] = '1';

			} else {

				$sql = ("select id from cometchat order by id desc limit 1");
				$query = mysql_query($sql);
				if (defined('DEV_MODE') && DEV_MODE == '1') { echo mysql_error(); }
				$result = mysql_fetch_array($query);
				
				$response['init'] = '1';
				$response['initialize'] = $result['id'];
			}
			getStatus(); 

			if (!empty($_COOKIE[$cookiePrefix.'state'])) {
				$states = explode(':',urldecode($_COOKIE[$cookiePrefix.'state']));
				
				$openChatboxId = '';

				if ($states[2] != '' && $states[2] != ' ') {
					$openChatboxId = $states[2];
				}
				
				getChatboxData($openChatboxId);
			}


		}
		
		$_REQUEST['buddylist'] = 1;
		if (!empty($_REQUEST['buddylist']) && $_REQUEST['buddylist'] == 1 && $processFurther) { getBuddyList(); }
		
		if (USE_COMET == 0) { getLastTimestamp(); }
		if (defined('DISABLE_ISTYPING') && DISABLE_ISTYPING != 1 && $processFurther) { typingTo(); }
		if (defined('DISABLE_ANNOUNCEMENTS') && DISABLE_ANNOUNCEMENTS != 1 && $processFurther) { checkAnnoucements(); }

		if ($processFurther) {
			fetchMessages();
		}
	}

	if ($processFurther) {
		$sql = updateLastActivity($userid);
	
		if ($guestsMode && $userid >= 10000000) { 
			$sql = updateGuestLastActivity($userid,$sql);
		}

		$query = mysql_query($sql);
		if (defined('DEV_MODE') && DEV_MODE == '1') { echo mysql_error(); }
	
		if (!empty($_REQUEST['typingto']) && $_REQUEST['typingto'] != 0 && DISABLE_ISTYPING != 1) {
			$sql = ("insert into cometchat_status (userid,typingto,typingtime) values ('".mysql_real_escape_string($userid)."','".mysql_real_escape_string($_REQUEST['typingto'])."','".getTimeStamp()."') on duplicate key update typingto = '".mysql_real_escape_string($_REQUEST['typingto'])."', typingtime = '".getTimeStamp()."'");
			$query = mysql_query($sql);
			if (defined('DEV_MODE') && DEV_MODE == '1') { echo mysql_error(); }
		}
	}

} else {
	$response['loggedout'] = '1';
	setcookie($cookiePrefix.'state','',time()-3600,'/');
	unset($_SESSION['cometchat']);
}

function getStatus() {
	global $response;
	global $userid;
	global $status;
	global $startOffline;
	global $processFurther;

	$sql = getUserStatus($userid);
 	$query = mysql_query($sql);
	if (defined('DEV_MODE') && DEV_MODE == '1') { echo mysql_error(); }

	$chat = mysql_fetch_array($query);

	if ($startOffline == 1 && empty($_SESSION['cometchat']['startoffline'])) {
		$_SESSION['cometchat']['startoffline'] = 1;
		$chat['status'] = 'offline';
		setStatus('offline');
		$_SESSION['cometchat']['cometchat_sessionvars']['buddylist'] = 0;
		$processFurther = 0;
	} else {
		if (empty($chat['status'])) {
			$chat['status'] = 'available';	
		} else {
			if ($chat['status'] == 'away') {
				$chat['status'] = 'available';
				setStatus('available');
			}
			if ($chat['status'] == 'offline') {
				$processFurther = 0;
				$_SESSION['cometchat']['cometchat_sessionvars']['buddylist'] = 0;
			}
		}
	}
	
	if (empty($chat['message'])) {
		$chat['message'] = $status[$chat['status']];		
	}
	
	$chat['message'] = html_entity_decode($chat['message']);

	$s = array('message' => $chat['message'], 'status' => $chat['status']);
	$response['userstatus'] = $s;
}

function setStatus($message) {

	global $userid;
	
	$sql = ("insert into cometchat_status (userid,status) values ('".mysql_real_escape_string($userid)."','".mysql_real_escape_string(sanitize_core($message))."') on duplicate key update status = '".mysql_real_escape_string(sanitize_core($message))."'");
	$query = mysql_query($sql);
	if (defined('DEV_MODE') && DEV_MODE == '1') { echo mysql_error(); }

	if (function_exists('hooks_activityupdate')) {
		hooks_activityupdate($userid,$message);
	}

}

function getLastTimestamp() {
	if (empty($_REQUEST['timestamp'])) {
		$_REQUEST['timestamp'] = 0;
	}

	if ($_REQUEST['timestamp'] == 0) {
		foreach ($_SESSION['cometchat'] as $key => $value) {
			if (substr($key,0,15) == "cometchat_user_") {
				if (!empty($_SESSION['cometchat'][$key]) && is_array($_SESSION['cometchat'][$key])) {
					$temp = end($_SESSION['cometchat'][$key]);
					if ($_REQUEST['timestamp'] < $temp['id']) {
						$_REQUEST['timestamp'] = $temp['id'];
					}
				}
			}
		}

		if ($_REQUEST['timestamp'] == 0) {
			$sql = ("select id from cometchat order by id desc limit 1");
			$query = mysql_query($sql);
			if (defined('DEV_MODE') && DEV_MODE == '1') { echo mysql_error(); }
			$chat = mysql_fetch_array($query);

			$_REQUEST['timestamp'] = $chat['id'];
		}
	}
	
}


function getBuddyList() {
	global $response;
	global $userid;
	global $db;
	global $status;
	global $hideOffline;
	global $plugins;
	global $guestsMode; 

	$time = getTimeStamp();
	$buddyList = array();
	
	if ((empty($_SESSION['cometchat']['cometchat_buddytime'])) || ($_REQUEST['initialize'] == 1)  || ($_REQUEST['f'] == 1)  || (!empty($_SESSION['cometchat']['cometchat_buddytime']) && ($time-$_SESSION['cometchat']['cometchat_buddytime'] >= REFRESH_BUDDYLIST))) {
		
		if ($_REQUEST['initialize'] == 1 && !empty($_SESSION['cometchat']['cometchat_buddyblh']) && ($time-$_SESSION['cometchat']['cometchat_buddytime'] < REFRESH_BUDDYLIST)) {

			$response['buddylist'] = $_SESSION['cometchat']['cometchat_buddyresult'];
			$response['blh'] = $_SESSION['cometchat']['cometchat_buddyblh'];

		} else {

			$blockList = array();

			if (in_array('block',$plugins)) {
			
				$sql = "(select toid as id from cometchat_block where fromid = '".mysql_real_escape_string($userid)."') union (select fromid as id from cometchat_block where toid = '".mysql_real_escape_string($userid)."') ";
			
				$query = mysql_query($sql);
				while ($user = mysql_fetch_array($query)) {
					array_push($blockList,$user['id']);
				}
			}

			$sql = getFriendsList($userid,$time);

			if ($guestsMode) {
				$sql = getGuestsList($userid,$time,$sql);
			}
 
			$query = mysql_query($sql);
			if (defined('DEV_MODE') && DEV_MODE == '1') { echo mysql_error(); }

			while ($chat = mysql_fetch_array($query)) {

				if (!in_array($chat['userid'],$blockList)) {

					if ((($time-processTime($chat['lastactivity'])) < ONLINE_TIMEOUT) && $chat['status'] != 'invisible' && $chat['status'] != 'offline') {
						if ($chat['status'] != 'busy' && $chat['status'] != 'away') {
							$chat['status'] = 'available';
						}
					} else {
						$chat['status'] = 'offline';
					}

					if ($chat['message'] == null) {
						$chat['message'] = $status[$chat['status']];
					}
					
					$link = getLink($chat['link']);
					$avatar = getAvatar($chat['avatar']);

					if (function_exists('processName')) {
						$chat['username'] = processName($chat['username']);
					}
					
					$chat['username'] = html_entity_decode($chat['username']);

					if (empty($chat['grp'])) {
						$chat['grp'] = '';
					}

					if (!empty($chat['username']) && ($hideOffline == 0 || ($hideOffline == 1 && $chat['status'] != 'offline'))) {
						$buddyList[] = array('id' => $chat['userid'], 'n' => $chat['username'], 's' => $chat['status'], 'm' => $chat['message'], 'g' => $chat['grp'], 'a' => $avatar, 'l' => $link);
					}
				}
			}

			if (function_exists('hooks_forcefriends') && is_array(hooks_forcefriends())) {
				$buddyList = array_merge(hooks_forcefriends(),$buddyList);
			}

			$buddyOrder = array();
			$buddyGroup = array();
			$buddyStatus = array();
			$buddyName = array();

			foreach ($buddyList as $key => $row) {
				if (empty($row['g'])) { $row['g'] = ''; }
				$buddyGroup[$key]  = strtolower($row['g']);
				$buddyStatus[$key] = strtolower($row['s']);
				$buddyName[$key] = strtolower($row['n']);
				if ($row['g'] == '') {
					$buddyOrder[$key] = 1;
				} else {
					$buddyOrder[$key] = 0;
				}				
			}

			array_multisort($buddyOrder, SORT_ASC, $buddyGroup, SORT_STRING, $buddyStatus, SORT_STRING, $buddyName, SORT_STRING, $buddyList);

			$_SESSION['cometchat']['cometchat_buddytime'] = $time;

			$blh = md5(serialize($buddyList));

			if ((empty($_REQUEST['blh'])) || (!empty($_REQUEST['blh']) && $blh != $_REQUEST['blh'])) {
				$response['buddylist'] = $buddyList;
				$response['blh'] = $blh;
			}

			$_SESSION['cometchat']['cometchat_buddyresult'] = $buddyList;
			$_SESSION['cometchat']['cometchat_buddyblh'] = $blh;

		}
	} 
}
  
function fetchMessages() {
	global $response;
	global $userid;
	global $db;
	global $messages;
	global $cookiePrefix;

	$timestamp = 0;

	if (USE_COMET == 1) { return; }
	
	$sql = ("select cometchat.id, cometchat.from, cometchat.to, cometchat.message, cometchat.sent, cometchat.read, cometchat.direction from cometchat where ((cometchat.to = '".mysql_real_escape_string($userid)."' and cometchat.direction <> 2) or (cometchat.from = '".mysql_real_escape_string($userid)."' and cometchat.direction <> 1)) and (cometchat.id > '".mysql_real_escape_string($_REQUEST['timestamp'])."' or (cometchat.to = '".mysql_real_escape_string($userid)."' and cometchat.read != 1)) order by cometchat.id");

	$query = mysql_query($sql);
	if (defined('DEV_MODE') && DEV_MODE == '1') { echo mysql_error(); }
 
	while ($chat = mysql_fetch_array($query)) {

		$self = 0;
		$old = 0;
		if ($chat['from'] == $userid) {
			$chat['from'] = $chat['to'];
			$self = 1;
			$old = 1;
		}

		if ($chat['read'] == 1) {
			$old = 1;
		}

		if (!empty($_COOKIE[$cookiePrefix.'lang']) && $chat['direction'] == 0 && $self == 0 && $old == 0) {
				
				$translated = text_translate($chat['message'],'',$_COOKIE[$cookiePrefix.'lang']);
				
				if ($translated != '') {
					$chat['message'] = strip_tags($translated).' <span class="untranslatedtext">('.$chat['message'].')</span>';
				}
		} 

		$messages[] = array('id' => $chat['id'], 'from' => $chat['from'], 'message' => $chat['message'], 'self' => $self, 'old' => $old, 'sent' => ($chat['sent']+$_SESSION['cometchat']['timedifference']));

		if ($self == 0 && $old == 0 && $chat['read'] != 1) {
			$_SESSION['cometchat']['cometchat_user_'.$chat['from']][] = array('id' => $chat['id'], 'from' => $chat['from'], 'message' => $chat['message'], 'self' => 0, 'old' => 1, 'sent' => ($chat['sent']+$_SESSION['cometchat']['timedifference']));
		}


		$timestamp = $chat['id'];
	}	

	if (!empty($messages)) {
		$sql = ("update cometchat set cometchat.read = '1' where cometchat.to = '".mysql_real_escape_string($userid)."' and cometchat.id <= '".mysql_real_escape_string($timestamp)."'");
		$query = mysql_query($sql);
		if (defined('DEV_MODE') && DEV_MODE == '1') { echo mysql_error(); }
			
	}
}

function typingTo() {
	global $response;
	global $userid;
	global $db;
	global $messages;
	$timestamp = 0;

	if (USE_COMET == 1) { return; }
	
	$sql = ("select GROUP_CONCAT(userid, ',') from cometchat_status where typingto = '".mysql_real_escape_string($userid)."' and ('".getTimeStamp()."'-typingtime < 10)");
	$query = mysql_query($sql);
	if (defined('DEV_MODE') && DEV_MODE == '1') { echo mysql_error(); }
 
	$chat = mysql_fetch_array($query);

	if (!empty($chat[0])) {
		$response['tt'] = $chat[0];
	} else {
		$response['tt'] = '';
	}
}

function checkAnnoucements() {
	global $response;
	global $userid;
	global $db;
	global $messages;
	global $cookiePrefix;
	global $notificationsFeature;
	global $notificationsClub;

	$timestamp = 0;
	
	if ($notificationsFeature) {

		$sql = ("select count(id) as count from cometchat_announcements where `to` = '".mysql_real_escape_string($userid)."' and  `recd` = '0'");
		$query = mysql_query($sql);
		if (defined('DEV_MODE') && DEV_MODE == '1') { echo mysql_error(); }
		$count = mysql_fetch_array($query);
		$count = $count['count'];
			
		if ($count > 0) {
			$sql = ("select id,announcement from cometchat_announcements where `to` = '".mysql_real_escape_string($userid)."' and  `recd` = '0' order by id desc limit 1");
			$query = mysql_query($sql);
			if (defined('DEV_MODE') && DEV_MODE == '1') { echo mysql_error(); }
			$announcement = mysql_fetch_array($query);

			if (!empty($announcement[1])) {
				$sql = ("update cometchat_announcements set `recd` = '1' where `id` <= '".mysql_real_escape_string($announcement[0])."' and `to`  = '".mysql_real_escape_string($userid)."'");
				$query = mysql_query($sql);

				$response['an'] = array('id' => $announcement[0], 'm' => $announcement[1], 'o' => $count);
				return;
			}
		}

	}
 	
	$sql = ("select id,announcement from cometchat_announcements where `to` = '0' or `to` = '-1' order by id desc limit 1");
	$query = mysql_query($sql);
	if (defined('DEV_MODE') && DEV_MODE == '1') { echo mysql_error(); }
 
	$announcement = mysql_fetch_array($query);

	if (!empty($announcement[1]) && (empty($_COOKIE[$cookiePrefix.'an']) || (!empty($_COOKIE[$cookiePrefix.'an']) && $_COOKIE[$cookiePrefix.'an'] < $announcement[0]))) {
		$response['an'] = array('id' => $announcement[0], 'm' => $announcement[1]);
	}
}

if (!empty($messages)) {
	$response['messages'] = $messages;
}

header('Content-type: application/json; charset=utf-8');

if (isset($response['initialize'])) {
	$initialize = $response['initialize'];
	unset($response['initialize']);
	$response['initialize'] = $initialize;
}

if (!empty($_GET['callback'])) {
	echo $_GET['callback'].'('.json_encode($response).')';
} else {
	echo json_encode($response);
}
exit;