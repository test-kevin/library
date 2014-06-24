<?php
namespace TestKevin\Library;

#use TestKevin\Library\Session\SessionHelperTrait;
#use TestKevin\Library;
use Flighthub\Framework;

abstract class View extends Framework\View
{
    use RegistryTrait;

    public function __construct(Registry $registry)
    {
        $this->registry = $registry;
    }
}
