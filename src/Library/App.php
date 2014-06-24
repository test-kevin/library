<?php
namespace TestKevin\Library;

use Flighthub\Framework;

class App extends Framework\App
{
    /**
     * @param Registry|null $registry
     */
    public function __construct(Registry $registry = null)
    {
        if (null === $registry) {
            $this->setRegistry(new Registry());
        }
        $this->setSrcDir(__DIR__);
        $this->getRegistry()->setApp($this);
        parent::__construct($registry);
    }

    public function run()
    {
        switch ($this->getRuntime()) {
            case self::RUNTIME_TEST:
            case self::RUNTIME_ROUTER:
                (new RouterApp($this->getRegistry()))->run();
            case self::RUNTIME_GEARMAN:
                #(new JobApp($this->getRegistry()))->run();
            case self::RUNTIME_COMMAND:
                #(new CommandApp($this->getRegistry()))->run();
            case self::RUNTIME_DOCTRINE:
                break;
        }
    }

    /**
     * @return Registry
     */
    public function getRegistry()
    {
        return $this->registry;
    }

    /**
     * @param Registry $registry
     * @return $this
     */
    public function setRegistry(Registry $registry)
    {
        $this->registry = $registry;
        return $this;
    }
}
