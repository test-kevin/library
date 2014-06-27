<?php

global $app;

use TestKevin\Library\App;

define('LEGACY_APP', false);
require_once __DIR__ . "/../vendor/autoload.php";

if (!defined('TEST')) {
    putenv("APP_ENV=test");
    define('TEST', true);

    $app = new App;
    $app->setRootDir(realpath(__DIR__ . '/..'));
    $app->setEnv(App::ENV_TEST);
    $app->init($app::RUNTIME_TEST);
}
