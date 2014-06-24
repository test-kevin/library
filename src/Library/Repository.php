<?php
namespace TestKevin\Library;

use Flighthub\Core;

class Repository extends Core\Repository
{
    /**
     * @var Registry
     */
    protected $registry;

    /**
     * @param Registry $registry
     */
    public function __construct(Registry $registry)
    {
        $this->registry = $registry;
    }
}
