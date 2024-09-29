<?php

namespace Modules\Ticket\database\seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Modules\Ticket\Models\Ticket;

class TicketDatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Disable foreign key checks!
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        /*
         * Tickets Seed
         * ------------------
         */

        // DB::table('tickets')->truncate();
        // echo "Truncate: tickets \n";

        Ticket::factory()->count(20)->create();
        $rows = Ticket::all();
        echo " Insert: tickets \n\n";

        // Enable foreign key checks!
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}
