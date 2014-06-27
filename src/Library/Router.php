<?php
namespace TestKevin\Library;

use Flighthub\Framework;

abstract class Router extends Framework\Router
{
    use RegistryTrait;

    public function __construct(Registry $registry)
    {
        $this->registry = $registry;
    }
}
