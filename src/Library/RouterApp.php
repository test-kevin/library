<?php
namespace TestKevin\Library;

use Flighthub\Framework;
use TestKevin\Library\Store\StoreRouter;
use TestKevin\Library\Main\MainRouter;

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
