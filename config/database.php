<?php

return [
    'connections' => [
        'default' => [
            'driver' => 'pdo_mysql',
            'host' => 'localhost',
            'dbname' => 'ota',
            'user' => 'ota',
            'password' => 'password',
            'is_dev_mode' => true,
            'metadata' => [
                __DIR__ . '/../src/Library',
                // __DIR__ . '/../vendor/flighthub/core/src/Core'
            ],
            'cache' => null,
            'proxy_dir' => null,
        ]
    ]
];
