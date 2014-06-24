<?php
namespace TestKevin\Library;

use Flighthub\Framework;

trait RegistryTrait
{
    use Framework\RegistryTrait;
    /**
     * @var Registry
     */
    protected $registry;

    /**
     * @return Repository
     */
    public function getRepository()
    {
        return $this->getRegistry()->getRepository();
    }

    /**
     * @return Registry
     */
    public function getRegistry()
    {
        return $this->registry;
    }
}
