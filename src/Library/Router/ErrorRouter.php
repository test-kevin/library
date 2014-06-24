<?php
namespace TestKevin\Library\Router;

use Klein\Klein;
use Flighthub\Framework;
use TestKevin\Library\Registry;
use TestKevin\Library\View\ErrorView;
use TestKevin\Library\Router;


class ErrorRouter implements Framework\RouterInterface
{
    /**
     * @param Registry $registry
     * @param Klein $klein
     */
    public function create($registry, Klein $klein)
    {
        $klein->respond('404', function() use ($registry) { (new ErrorView($registry))->showNotFound(); });
    }
}
