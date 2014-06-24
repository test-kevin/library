<?php

use Flighthub\Flighthub\App;
use Flighthub\Framework\GearmanBootstrap;

define('LEGACY_APP', false);
require_once __DIR__ . "/../vendor/autoload.php";
require_once __DIR__ . "/../bridge/bootstrap.php";

$app = new App;
$app->setRootDir(realpath(__DIR__ . '/..'));
GearmanBootstrap::$registry = $app->getRegistry();
$app->init($app::RUNTIME_GEARMAN);