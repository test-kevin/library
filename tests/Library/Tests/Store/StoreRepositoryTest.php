<?php
namespace TestKevin\Library\Tests\Store;

use Flighthub\Framework\Test\DatabaseTestCase;
use PHPUnit_Extensions_Database_DataSet_CompositeDataSet;

class StoreEntityTest extends DatabaseTestCase
{

    protected $registry;

    public function getDataSet()
    {
        return $this->import('stores');
    }

    public function tearDown()
    {
        $this->truncate('stores');
    }

    public function testFindAll(){

        //$repository = $this->registry->getRepository()->

        $this->assertTrue(true);

    }
}
