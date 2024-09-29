<?php

namespace Modules\Ticket\Models;

use App\Models\BaseModel;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Ticket extends BaseModel
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'tickets';


    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Create a new factory instance for the model.
     *
     * @return \Illuminate\Database\Eloquent\Factories\Factory
     */
    protected static function newFactory()
    {
        return \Modules\Ticket\database\factories\TicketFactory::new();
    }
}
