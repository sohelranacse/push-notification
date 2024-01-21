<?php
use Minishlink\WebPush\WebPush;
use Minishlink\WebPush\Subscription;
// use Minishlink\WebPush\VAPID;

require "includes/database.php";
require 'web-push/vendor/autoload.php';

// var_dump(VAPID::createVapidKeys()); die;

$publicKey = "BDesDgnZyBBcpCJUHyuZeSL7wcsHfSpvTUbFGk7Ub3MoBLDKn_geS6Ty3Zrwn5zu_S7ERtTbmsgwSTYgKYFuAq8";
$privateKey = "zubpEvQpq2mgpz1HjqA3iemVDA3VOsz7ZOhV1ZtK_tI";

$message = json_encode([
    'title' => 'Mirajul Islam and Dilshan want to join your network!',
    'body' => 'Click to view',
    'icon' => 'https://deshiwedding.com/image/cache/catalog/deshiWeddingLogoTrans-777x176.png',
    'badge' => 'https://match.deshiwedding.com/_files/favicon.ico?v=1651377463',
    'extraData' => 'https://match.deshiwedding.com/profile_view'
]);


$time = time();
$query = $con->query("SELECT * FROM `push_subscribers` WHERE `expirationTime` = 0 OR `expirationTime` > '{$time}'");
if($query->num_rows > 0){
    $auth = [
        'VAPID' => [
            'subject' => 'https://match.deshiwedding.com', // can be a mailto: or your website address
            'publicKey' => $publicKey, // (recommended) uncompressed public key P-256 encoded in Base64-URL
            'privateKey' => $privateKey, // (recommended) in fact the secret multiplier of the private key encoded in Base64-URL
        ],
    ];
    $webPush = new WebPush($auth);

    while ($subscriber = $query->fetch_assoc()) {
        $subscription = Subscription::create([
                "endpoint" => $subscriber['endpoint'],
                "keys" => [
                    'p256dh' => $subscriber['p256dh'],
                    'auth' => $subscriber['authKey']
                ]
            ]);
        $webPush->queueNotification($subscription, $message);
    }

    foreach ($webPush->flush() as $report) {
        $endpoint = $report->getRequest()->getUri()->__toString();
    
        if ($report->isSuccess())
            echo "Message sent successfully for {$endpoint}.<br>";
        else
            echo "Message failed to sent for {$endpoint}: {$report->getReason()}.<br>";
    }
}
else
    echo "No Subscribers";
