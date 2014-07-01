<?php
namespace TestKevin\Library\Tests\Store;

use Flighthub\Framework\Test\DatabaseTestCase;
use PHPUnit_Extensions_Database_DataSet_CompositeDataSet;

class StoreEntityTest extends DatabaseTestCase
{

    protected $registry;

    public function getDataSet()
    {
        return $this->import('store');
    }

    public function tearDown()
    {
        $this->truncate('store');
    }

    public function testFindAll(){

        //$repository = $this->registry->getRepository()->

        //$this->assertTrue(true);

    }
}
