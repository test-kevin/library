<?php

return [
    'level' => Psr\Log\LogLevel::INFO,
    'error' => __DIR__ . "/../logs/errors.log",
    'email' => __DIR__ . "/../logs/emails.log",
    'email_dir' => __DIR__ . "/../logs/emails",
    'gearman' => __DIR__ . "/../logs/gearman.log",
];