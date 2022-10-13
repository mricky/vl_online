<?php
namespace App\Repositories;

use App\Models\{
    Vendor
};
interface IVendor {
    public function findVendor($term);
}

class VendorRepository implements IVendor {

    public function findVendor($term)
    {
        $vendors = Vendor::where('name','LIKE',"%{$term}%")->limit(5)->get();

        $formated = [];

        foreach($vendors as $item){
           
            $formated[] = ['id'=> $item->id,'text'=> $item->name];
        }
       
        return $formated;
    }
}