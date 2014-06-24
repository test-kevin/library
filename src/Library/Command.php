<?php
namespace TestKevin\Library;

use Flighthub\Framework;

abstract class Command extends Framework\Command
{
    use RegistryTrait;
}
