<?php
namespace TestKevin\Library\View;

use TestKevin\Library\View;

class ErrorView extends View
{
    public function showNotFound()
    {
        $this->code(404)->body($this->render('errors/not_found.twig'));
    }

    public function showUnauthorized()
    {
        $this->code(401)->body($this->render('errors/unauthorized.twig'));
    }
}
