<?php

use TestKevin\Library\App;

define('LEGACY_APP', false);
require_once __DIR__ . "/../vendor/autoload.php";

$app = new App;
$app->setRootDir(realpath(__DIR__ . '/..'));
$app->init($app::RUNTIME_DOCTRINE);
