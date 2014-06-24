<?php
namespace TestKevin\Library;

use Flighthub\Framework;
use TestKevin\Library\Router\MainRouter;
use TestKevin\Library\Router\StoreRouter;

class RouterApp extends Framework\RouterApp
{
    /**
     * @var Registry
     */
    protected $registry;

    public function run()
    {
        $this->add(new MainRouter($this->registry));
        $this->add(new StoreRouter($this->registry));
    }
}
