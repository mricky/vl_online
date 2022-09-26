<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductBrand extends Model
{
    protected $searchableColumns = ['name'];

    protected $fillable = ['name'];
}
