<?php

namespace Modules\Ticket\Http\Controllers\Backend;

use App\Authorizable;
use App\Http\Controllers\Backend\BackendBaseController;
use App\Notifications\TicketClosedNotification;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Modules\Post\Enums\PostType;
use Modules\Ticket\Enums\TicketStatus;
use Modules\Ticket\Models\Ticket;
use Yajra\DataTables\DataTables;

class TicketsController extends BackendBaseController
{
    use Authorizable;

    public function __construct()
    {
        $this->module_title = 'Tickets';
        $this->module_name = 'tickets';
        $this->module_path = 'ticket::backend';
        $this->module_icon = 'fa-regular fa-sun';
        $this->module_model = "Modules\Ticket\Models\Ticket";
    }
    public function index()
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);
        $module_action = 'List';
        $$module_name = $module_model::paginate(15);

        return view(
            "{$module_path}.{$module_name}.index",
            compact('module_title', 'module_name', "{$module_name}", 'module_icon', 'module_name_singular', 'module_action')
        );
    }
    public function index_list(Request $request)
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);
        $module_action = 'List';
        $term = trim($request->q);
        if (empty($term)) {
            return response()->json([]);
        }
        $query_data = $module_model::where('title', 'LIKE', "%{$term}%")->active()->limit(15)->get();

        $$module_name = [];
        foreach ($query_data as $row) {
            $$module_name[] = [
                'id' => $row->id,
                'text' => $row->name,
            ];
        }

        return response()->json($$module_name);
    }
    public function index_data()
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'List';

        $page_heading = label_case($module_title);
        $title = $page_heading.' '.label_case($module_action);

        $$module_name = $module_model::select('id','user_id','title', 'message','file','status','created_at');
        $data = $$module_name;

        return Datatables::of($$module_name)
            ->addColumn('action', function ($data) {
                $module_name = $this->module_name;

                return view('backend.includes.action_column', compact('module_name', 'data'));
            })
            ->editColumn('title', '<strong>{{$name}}</strong>')

            ->rawColumns(['title', 'action'])
            ->orderColumns(['id'], '-:column $1')
            ->make(true);
    }

    public function store(Request $request)
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'Store';

        $validated_data = $request->validate([
            'title' => 'required|max:191',
            'slug' => 'nullable|max:191',
            'created_by_alias' => 'nullable|max:191',
            'message' => 'required',
            'image' => 'required|max:191',
            'status' => Rule::enum(TicketStatus::class),
            'published_at' => 'required|date',
        ]);

        $data['user_id'] = auth()->user()->id;
        $data['created_by'] = auth()->user()->name;
        $$module_name_singular = $module_model::create($data);
        if ($request->file) {
            $media = $$module_name_singular->addMedia($request->file('file'))->toMediaCollection($module_name);
            $$module_name_singular->file = $media->getUrl();
            $$module_name_singular->save();
        }

        flash("New '".Str::singular($module_title)."' Added")->success()->important();
        return redirect("admin/{$module_name}");
    }

    public function status(Request $request, $id){
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $ticket = Ticket::find($id);
        if (!$ticket) {
            return response()->json(['error' => 'Ticket not found'], 404);
        }
        $wasOpen = $ticket->status === 'Open';
        $ticket->status = $ticket->status === 'Open' ? 'Closed' : 'Open';
        $ticket->save();

        if ($wasOpen && $ticket->status === 'Closed') {
            $ticket->user->notify(new TicketClosedNotification($ticket));
        }


        flash("The '".Str::singular($module_title)."' Closed")->success()->important();
        return redirect("admin/{$module_name}");
    }
}
