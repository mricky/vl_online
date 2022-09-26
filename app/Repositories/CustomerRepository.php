<?php
namespace App\Repositories;

use App\Models\{
    Customer
};


interface ICustomer {
    public function findCustomer($term);
}

class CustomerRepository implements ICustomer {

    public function findCustomer($term)
    {
        $customers = Customer::where('name','LIKE',"%{$term}%")->limit(5)->get();

        $formated = [];

        foreach($customers as $item){
           
            $formated[] = ['id'=> $item->id,'text'=> $item->name];
        }
       
        return $formated;
    }
}