<?php
namespace TestKevin\Library\Router;

use Klein\Klein;
use Flighthub\Framework;
use TestKevin\Library\Registry;

use TestKevin\Library\Book\BookView;

class MainRouter implements Framework\RouterInterface
{
    /**
     * @param Registry $registry
     * @param Klein $klein
     */
    public function create($registry, Klein $klein)
    {

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
