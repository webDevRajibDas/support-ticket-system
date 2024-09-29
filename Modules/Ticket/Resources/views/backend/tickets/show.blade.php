@extends('backend.layouts.app')

@section('title') {{ __($module_action) }} {{ __($module_title) }} @endsection

@section('breadcrumbs')
<x-backend.breadcrumbs>
    <x-backend.breadcrumb-item route='{{route("backend.$module_name.index")}}' icon='{{ $module_icon }}'>
        {{ __($module_title) }}
    </x-backend.breadcrumb-item>
    <x-backend.breadcrumb-item type="active">{{ __($module_action) }}</x-backend.breadcrumb-item>
</x-backend.breadcrumbs>
@endsection

@section('content')
    <div class="card" style="width: 18rem;">
        <img src="{{asset($$module_name_singular->file)}}" class="card-img-top" alt="">

        <div class="card-body">
            <form action="{{route('backend.tickets.status',$$module_name_singular->id)}}" method="post">
                @csrf
                <h4>Title : {{$$module_name_singular->title}}</h4>
                <p class="card-text">Description : {{$$module_name_singular->message}}</p>
                <p class="card-text">Status : {{$$module_name_singular->status}}</p>
                <input type="hidden" value="{{$$module_name_singular->id}}">
                <button type="submit" class="btn btn-primary">Do You Closed!!</button>
            </form>
        </div>
    </div>
@endsection