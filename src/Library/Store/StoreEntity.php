<?php

namespace TestKevin\Library\Store;

/**
 * Class StoreEntity
 * @Entity(repositoryClass="TestKevin\Library\Store\StoreRepository")
 * @Table(name="store")
 */
class StoreEntity
{
    /**
     * @Id
     * @Column(name="id", type="integer")
     * @GeneratedValue
     * @var int
     */
    private $id;

    /**
     * @Column(name="name", type="string", length=255)
     * @var string
     */
    private $name;

    /**
     * @Column(name="address", type="text")
     * @var string
     */
    private $address;

    /**
     * @param string $address
     */
    public function setAddress($address)
    {
        $this->address = $address;
    }

    /**
     * @return string
     */
    public function getAddress()
    {
        return $this->address;
    }

    /**
     * @param int $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param string $name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }
}
