<?php

namespace Modules\Ticket\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Notifications\NewTicketNotification;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

class TicketsController extends Controller
{
    public $module_title;
    public $module_name;
    public $module_path;
    public $module_icon;
    public $module_model;

    public function __construct()
    {
        $this->module_title = 'Tickets';
        $this->module_name = 'tickets';
        $this->module_path = 'ticket::frontend';
        $this->module_icon = 'fa-regular fa-sun';
        $this->module_model = "Modules\Ticket\Models\Ticket";
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Illuminate\Foundation\Application
     */
    public function index()
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'List';
        $$module_name = $module_model::where('user_id', auth()->id())->latest()->paginate();
        return view(
            "$module_path.$module_name.index",
            compact('module_title', 'module_name', "$module_name", 'module_icon', 'module_action', 'module_name_singular')
        );
    }



    public function create()
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);
        $module_action = 'Create';

        return view(
            "{$module_path}.{$module_name}.create",
            compact('module_title', 'module_name', 'module_path', 'module_icon', 'module_name_singular', 'module_action')
        );
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

        $validatedData = request()->validate([
            'title' => 'required|string|max:255',
            'message' => 'required|string|min:10',
            'file' => 'nullable|file|mimes:jpg,png,pdf,docx|max:2048',
        ]);

        $data = $validatedData;
        $data['user_id'] = auth()->user()->id;
        $data['updated_at'] = null;
        $$module_name_singular = $module_model::create($data);
        if ($request->file) {
            $media = $$module_name_singular->addMedia($request->file('file'))->toMediaCollection($module_name);
            $$module_name_singular->file = $media->getUrl();
            $$module_name_singular->save();
        }

        $admin = User::whereHas('roles', function ($query) {
            $query->where('name', 'super admin');
        })->first();

        if ($admin) {
            //dd($admin);
            $admin->notify(new NewTicketNotification($$module_name_singular));
        }else{
            return response()->json(['message' => 'Admin user not found'], 404);
        }

        return redirect()->route('frontend.tickets.index')->with('success', "$module_name_singular created successfully.");
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Illuminate\Foundation\Application
     */
    public function show($id)
    {
        $id = decode_id($id);

        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'Show';

        $$module_name_singular = $module_model::findOrFail($id);

        return view(
            "$module_path.$module_name.show",
            compact('module_title', 'module_name', 'module_icon', 'module_action', 'module_name_singular', "$module_name_singular")
        );
    }


}
