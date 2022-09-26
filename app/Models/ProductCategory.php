<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    protected $searchableColumns = ['name'];

    protected $fillable = ['name'];
}
