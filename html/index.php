<?php
// Expand memory being used by PHP
ini_set('memory_limit','400M');
// server should keep session data for AT LEAST 1 hour
ini_set('session.gc_maxlifetime', 3600);
// each client should remember their session id for EXACTLY 1 hour
session_set_cookie_params(3600);
session_start();
$now = time();

if (isset($_SESSION['discard_after']) && $now > $_SESSION['discard_after']) {
    // this session has worn out its welcome; kill it and start a brand new one
    session_unset();
    session_destroy();
    session_start();
}
$_SESSION['discard_after'] = $now + 3600;
date_default_timezone_set('America/New_York'); 

if (!file_exists('credentials.inc.php')) {
   echo "My credentials are missing!";
   exit;
}

// Include libraries added with composer
require 'vendor/autoload.php';
// Include credentials
require 'credentials.inc.php';

// Start Slim instance
//-------------------------------
$app = new \Slim\Slim(array(
    'debug' => true
));

$app->get('/hello/:name', function ($name) {
    echo "Hello, $name";
});

// Handle not found
$app->notFound(function () use ($app) {
	// Temporarily route /map, /viz to /map.html
	$actual_link = "$_SERVER[REQUEST_URI]";
	
	// Let's make sure we remove a trailing "/" on any not found paths
    $actual_link = rtrim($actual_link, '/');
        
	if ($actual_link == "/phppgadmin"){
		echo "this is phppgadmin";
	} else {		
    	$app->redirect('/404.html');
    }
});


$app->get('/index.html', function () use ($app) {
  $app->redirect('/main/');
});

$app->get('/', function () use ($app) {
    $app->redirect("index.html");
});

$app->get('', function () use ($app) {
    $app->redirect("index.html");
});

$app->get('/main/', function () use ($app) {
	
    $content['title'] = "Main Map";
    $content['intro'] = <<<HTML
		<p>Asheville, NC</p>
HTML;
	// return $app->response->setBody($response);
	// Render content with simple bespoke templates
	$app->view()->setData(array('content' => $content));
	$app->render('tp_main_map.php');
    
});

$app->run();
?>