<?php

namespace TestKevin\Library\Store;

use TestKevin\Library\View;

/**
 * Class StoreView
 * @package TestKevin\Library\Store
 */
class StoreView extends View
{
    /**
     *
     */
    public function showAll()
    {

        $stores = $this->getEntityManager()
            ->getRepository('TestKevin\Library\Store\StoreEntity')
            ->findAll();

        echo $this->render('Store/ShowAll.html.twig', array(
            'stores' => $stores,
        ));
    }

    /**
     * @param $id
     * @return null
     */
    public function showOne($id)
    {
        $store = $this->getEntityManager()
            ->getRepository('TestKevin\Library\Store\StoreEntity')
            ->find($id);

        if (!$store) {
            return $this->notFound();
        }

        echo $this->render('Store/ShowOne.html.twig', array(
            'store' => $store,
        ));
    }

    /**
     * not found
     */
    public function notFound()
    {
        $this->code(404)->body($this->render('Store/NotFound.html.twig'));
    }
}
