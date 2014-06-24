<?php
namespace TestKevin\Library\Book;

use TestKevin\Library\View;

class BookView extends View
{

    public function showAll()
    {
        /*if ($this->getAgent()->isAuthorized(AgentEntity::AUTHORIZATION_LEVEL_ADMIN)) {
            $this->json($this->getRepository()->getAgentRepository()->findAll());
        } else {
            $this->showUnauthorized();
        }*/

        echo 'Toute les livres';
    }

    public function readSingle($id)
    {
        echo 'read single : ';
        var_dump($id);
    }

    public function loveSingle($id)
    {
        echo 'love single : ';
        var_dump($id);
    }

    public function showNotFound()
    {
        echo '404 : NOT FOUND !!!';
    }
}
