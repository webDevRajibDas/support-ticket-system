<?php

namespace Modules\Ticket\Enums;

enum TicketStatus: string
{
    case Open = 'Open';
    case Closed = 'Closed';
    case Draft = 'Draft';

    public static function getAllValues(): array
    {
        return array_column(self::cases(), 'value');
    }

    public static function getAllNames(): array
    {
        return array_column(self::cases(), 'name');
    }

    public static function toArray(): array
    {
        $array = [];
        foreach (self::cases() as $case) {
            $array[$case->name] = $case->value;
        }

        return $array;
    }
}
