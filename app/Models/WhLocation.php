<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WhLocation extends Model
{
    protected $fillable = [
        'wh_location_name',
        'location_type_id',
    ];
}
