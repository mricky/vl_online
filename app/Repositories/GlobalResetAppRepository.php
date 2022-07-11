<?php
namespace App\Repositories;
use DB;

interface IGLobalResetApp{
    public function deleteAllTransaction() : void;
}

class GlobalResetAppRepository implements IGLobalResetApp 
{
    public function deleteAllTransaction() : void{
        

    }
    
}