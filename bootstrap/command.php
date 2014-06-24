<?php

use Flighthub\Flighthub\App;

define('LEGACY_APP', false);
require_once __DIR__ . "/../vendor/autoload.php";
require_once __DIR__ . "/../bridge/bootstrap.php";

$app = new App;
$app->setRootDir(realpath(__DIR__ . '/..'));
$app->init($app::RUNTIME_COMMAND);