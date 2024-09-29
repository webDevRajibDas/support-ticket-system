<?php
$notifications = optional(auth()->user())->unreadNotifications;
$notifications_count = optional($notifications)->count();
$notifications_latest = optional($notifications)->take(5);
?>

<div class="sidebar sidebar-dark sidebar-fixed border-end" id="sidebar">
    <div class="sidebar-header border-bottom">
        <div class="sidebar-brand d-sm-flex justify-content-center">
            <a href="/">
                <img class="sidebar-brand-full" src="{{ asset('img/logo-with-text.jpg') }}" alt="{{ app_name() }}"
                    height="46">
                <img class="sidebar-brand-narrow" src="{{ asset('img/logo-square.jpg') }}" alt="{{ app_name() }}"
                    height="46">
            </a>
        </div>
        <button class="btn-close d-lg-none" data-coreui-dismiss="offcanvas" data-coreui-theme="dark" type="button"
            aria-label="Close"
            onclick="coreui.Sidebar.getInstance(document.querySelector(&quot;#sidebar&quot;)).toggle()"></button>
    </div>
    <ul class="sidebar-nav" data-coreui="navigation" data-simplebar>
        <li class="nav-item">
            <a class="nav-link" href="{{ route('backend.dashboard') }}">
                <i class="nav-icon fa-solid fa-cubes"></i>&nbsp;@lang('Dashboard')
            </a>
        </li>


        @php
            $module_name = "tickets";
            $text = __('Tickets');
            $icon = "fa-regular fa-file-lines";
            $permission = "view_".$module_name;
            $url = route('backend.'.$module_name.'.index');
        @endphp
        <x-backend.sidebar-nav-item :permission="$permission" :url="$url" :icon="$icon" :text="$text" />


        @php
            $module_name = "posts";
            $text = __('Posts');
            $icon = "fa-regular fa-file-lines";
            $permission = "view_".$module_name;
            $url = route('backend.'.$module_name.'.index');
        @endphp
        <x-backend.sidebar-nav-item :permission="$permission" :url="$url" :icon="$icon" :text="$text" />

        @php
            $module_name = "categories";
            $text = __('Categories');
            $icon = "fa-solid fa-diagram-project";
            $permission = "view_".$module_name;
            $url = route('backend.'.$module_name.'.index');
        @endphp
        <x-backend.sidebar-nav-item :permission="$permission" :url="$url" :icon="$icon" :text="$text" />
        

        
        @php
            $module_name = "settings";
            $text = __('Settings');
            $icon = "fa-solid fa-gears";
            $permission = "edit_".$module_name;
            $url = route('backend.'.$module_name);
        @endphp
        <x-backend.sidebar-nav-item :permission="$permission" :url="$url" :icon="$icon" :text="$text" />

        @php
            $module_name = "users";
            $text = __('Users');
            $icon = "fa-solid fa-user-group";
            $permission = "view_".$module_name;
            $url = route('backend.'.$module_name.'.index');
        @endphp
        <x-backend.sidebar-nav-item :permission="$permission" :url="$url" :icon="$icon" :text="$text" />
        
        @php
            $module_name = "roles";
            $text = __('Roles');
            $icon = "fa-solid fa-user-shield";
            $permission = "view_".$module_name;
            $url = route('backend.'.$module_name.'.index');
        @endphp
        <x-backend.sidebar-nav-item :permission="$permission" :url="$url" :icon="$icon" :text="$text" />

    </ul>
    <div class="sidebar-footer border-top d-none d-md-flex">
        <button class="sidebar-toggler" data-coreui-toggle="unfoldable" type="button"></button>
    </div>
</div>
