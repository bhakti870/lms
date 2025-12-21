<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Blade directive for checking if user has a permission
        \Blade::if('hasPermission', function ($permission) {
            return auth()->check() && auth()->user()->hasPermission($permission);
        });

        // Blade directive for checking if user has any of the given permissions
        \Blade::if('hasAnyPermission', function ($permissions) {
            return auth()->check() && auth()->user()->hasAnyPermission($permissions);
        });

        // Blade directive for checking if user has all of the given permissions
        \Blade::if('hasAllPermissions', function ($permissions) {
            return auth()->check() && auth()->user()->hasAllPermissions($permissions);
        });

        // Blade directive for checking if user has a role
        \Blade::if('hasRole', function ($role) {
            return auth()->check() && auth()->user()->hasRole($role);
        });

        // Blade directive for checking if user has any of the given roles
        \Blade::if('hasAnyRole', function ($roles) {
            return auth()->check() && auth()->user()->hasAnyRole($roles);
        });
    }
}
