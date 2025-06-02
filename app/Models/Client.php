<?php

// app/Models/Client.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Client extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'uuid',
        'id_number',
        'date_of_birth',
        'first_name',
        'last_name',
        'email_address',
        'telephone',
        'status',
    ];

    protected static function booted()
    {
        static::creating(function ($client) {
            $client->uuid = (string) Str::uuid();
        });
    }
}
