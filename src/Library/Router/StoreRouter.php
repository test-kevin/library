<?php
namespace TestKevin\Library\Router;

use Klein\Klein;
use Flighthub\Framework;
use TestKevin\Library\Registry;
use TestKevin\Library\Store\StoreView;

class StoreRouter implements Framework\RouterInterface
{
    /**
     * @param Registry $registry
     * @param Klein $klein
     */
    public function create($registry, Klein $klein)
    {


        $klein->with('/', function() use ($registry, $klein)  {
            $klein->respond('GET', '/?', function() use ($registry) { (new StoreView($registry))->showAll(); });
        });

        $klein->with('/store', function() use ($registry, $klein)  {
            $klein->with('/[:id]', function() use ($registry, $klein) {
                $klein->respond('GET', '/?', function($request) use ($registry) { (new StoreView($registry))->showOne($request->id); });
            });
        });

        $klein->respond('404', function() use ($registry) { (new StoreView($registry))->notFound(); });
    }
};
