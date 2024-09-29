@extends('frontend.layouts.app')

@section('title') {{ __($module_title) }} @endsection

@section('content')

<section class="bg-gray-100 text-gray-600 py-20">
    <div class="max-w-2xl px-4 py-8 mx-auto lg:py-16">
        <h1 class="text-2xl font-bold mb-6 text-center">Submit a Ticket</h1>

        <form action="{{route('frontend.tickets.store')}}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="mb-4">
                <label for="title" class="block text-gray-700 font-medium mb-2">Ticket Title</label>
                <input type="text" id="title" name="title" required
                       class="w-full px-4 py-2 border rounded-lg text-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-400">
            </div>
            <div class="mb-4">
                <label for="message" class="block text-gray-700 font-medium mb-2">Description</label>
                <textarea id="message" name="message" rows="5" required
                          class="w-full px-4 py-2 border rounded-lg text-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-400"></textarea>
            </div>

            <div class="mb-4">
                <label for="file" class="block text-gray-700 font-medium mb-2">Attach File</label>
                <input type="file" id="file" name="file"
                       class="w-full px-4 py-2 border rounded-lg text-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-400">
            </div>

            <div>
                <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Submit</button>
            </div>
        </form>
    </div>
</section>

@endsection