<?php
namespace TestKevin\Library\Error;

use Klein\Klein;
use Flighthub\Framework;
use TestKevin\Library\Registry;
use TestKevin\Library\View\ErrorView;
use TestKevin\Library\Router;


class ErrorRouter extends Router
{
    /**
     * @param Klein $klein
     */
    public function init(Klein $klein)
    {
        $registry = $this->registry;

        $klein->respond('404', function() use ($registry) { (new ErrorView($registry))->showNotFound(); });
    }
}
