@extends('backend.layouts.app')

@section('title') {{ __($module_action) }} {{ __($module_title) }} @endsection

@section('breadcrumbs')
<x-backend.breadcrumbs>
    <x-backend.breadcrumb-item type="active" icon='{{ $module_icon }}'>{{ __($module_title) }}</x-backend.breadcrumb-item>
</x-backend.breadcrumbs>
@endsection

@section('content')
<div class="card">
    <div class="card-body">
        <x-backend.section-header>
            <i class="{{ $module_icon }}"></i> {{ __($module_title) }} <small class="text-muted">{{ __($module_action) }}</small>
            <x-slot name="subtitle">
                @lang(":module_name Management Dashboard", ['module_name'=>Str::title($module_name)])
            </x-slot>
            <x-slot name="toolbar">

            </x-slot>
        </x-backend.section-header>

        <div class="row mt-4">
            <div class="col">
                <table id="datatable" class="table table-bordered table-hover table-responsive-sm">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>File</th>
                            <th>@lang("ticket::text.created_by")</th>
                            <th class="text-end">@lang("ticket::text.action")</th>

                        </tr>
                    </thead>

                    <tbody>
                        @foreach($$module_name as $module_name_singular)
                        <tr>
                            <td>
                                {{ $module_name_singular->id }}
                            </td>
                            <td>
                                <a href="{{ url("admin/$module_name", $module_name_singular->id) }}">{{ $module_name_singular->title }}</a>
                            </td>
                            <td>
                                {{ $module_name_singular->message }}
                            </td>
                            <td>
                               <img src="{{asset($module_name_singular->file)}}" alt="{{ $module_name_singular->title }}" class="img-thumbnail" width="120" height="100">
                            </td>
                            <td>
                                {{ $module_name_singular->user->first_name }}{{ $module_name_singular->user->last_name }}
                            </td>
                            <td class="text-end">
                                 {{$module_name_singular->status}}
                                <a href='{!!route("backend.$module_name.show", $module_name_singular)!!}' class='btn btn-sm btn-success mt-1' data-toggle="tooltip" title="Show {{ ucwords(Str::singular($module_name)) }}"><i class="fas fa-tv"></i></a>
                            </td>

                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="card-footer">
        <div class="row">
            <div class="col-7">
                <div class="float-left">
                    Total {{ $$module_name->total() }} {{ ucwords($module_name) }}
                </div>
            </div>
            <div class="col-5">
                <div class="float-end">
                    {!! $$module_name->render() !!}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('after-scripts')
    <script>
        $(document).ready(function () {
            $('#ticketStatus').on('change', function () {
                //alert('changed ticket status');
                var ticketId = $(this).data('ticket-id');
                var status = $(this).is(':checked') ? 'Closed' : 'Open';
                $.ajax({
                    url: '/tickets/' + ticketId + '/status',
                    type: 'POST',
                    data: {
                        _token: '{{ csrf_token() }}',
                    },
                    success: function (response) {
                        if (response.success) {
                            alert('Ticket status changed to ' + response.status);
                        } else {
                            alert('Error changing status');
                        }
                    },
                    error: function () {
                        alert('An error occurred');
                    }
                });
            });
        });
    </script>
@endpush