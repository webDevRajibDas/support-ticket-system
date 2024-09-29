<?php

namespace Modules\Ticket\Console\Commands;

use Illuminate\Console\Command;

class TicketCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:TicketCommand';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Ticket Command description';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        return Command::SUCCESS;
    }
}
