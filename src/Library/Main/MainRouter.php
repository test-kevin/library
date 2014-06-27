<?php
namespace TestKevin\Library\Main;

use Klein\Klein;
use Flighthub\Framework;
use TestKevin\Library\Router;

class MainRouter extends Router
{
    /**
     * @param Klein $klein
     */
    public function init(Klein $klein)
    {

        $registry = $this->registry;

        /*$klein->with('/books', function() use ($registry, $klein)  {
            $klein->respond('GET', '/?', function() use ($registry) { (new BookView($registry))->showAll(); });

            $klein->with('/[:id]', function() use ($registry, $klein) {
                $klein->respond('GET', '/read', function($request) use ($registry) { (new BookView($registry))->readSingle($request->id); });
                $klein->respond('GET', '/love', function($request) use ($registry) { (new BookView($registry))->loveSingle($request->id); });
            });
        });

        $klein->respond('404', function() use ($registry) { (new BookView($registry))->showNotFound(); });*/
    }
};
