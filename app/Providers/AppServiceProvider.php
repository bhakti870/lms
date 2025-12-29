<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Config;
use Illuminate\Pagination\Paginator;
use App\Models\Smtp;
use Blade;

class AppServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        //
    }

    public function boot(): void
    {
        Paginator::useBootstrapFive();

        /**
         * ✅ Dynamic SMTP Settings (SAFE)
         * - Will NOT run during migration
         * - Will NOT crash if table missing
         */
        try {
            if (Schema::hasTable('smtps')) {
                $smtps = Smtp::query()->first();

                if ($smtps) {
                    Config::set('mail.mailers.smtp.host', $smtps->host);
                    Config::set('mail.mailers.smtp.port', $smtps->port);
                    Config::set('mail.mailers.smtp.username', $smtps->username);
                    Config::set('mail.mailers.smtp.password', $smtps->password);
                    Config::set('mail.mailers.smtp.encryption', $smtps->encryption);

                    Config::set('mail.from.address', $smtps->from_address);
                    Config::set('mail.from.name', 'SkillPoint LMS');

                    Config::set('mail.default', 'smtp');
                }
            }
        } catch (\Exception $e) {
            // Silently fail if table is missing or corrupted
        }

        /**
         * Blade Permission Directives
         */
        Blade::if('hasPermission', fn ($permission) =>
            auth()->check() && auth()->user()->hasPermission($permission)
        );

        Blade::if('hasAnyPermission', fn ($permissions) =>
            auth()->check() && auth()->user()->hasAnyPermission($permissions)
        );

        Blade::if('hasAllPermissions', fn ($permissions) =>
            auth()->check() && auth()->user()->hasAllPermissions($permissions)
        );

        Blade::if('hasRole', fn ($role) =>
            auth()->check() && auth()->user()->hasRole($role)
        );
        
        Blade::if('hasAnyRole', fn ($roles) =>
            auth()->check() && auth()->user()->hasAnyRole($roles)
        );

        // View Composer for Header Categories & User Data
        \Illuminate\Support\Facades\View::composer('frontend.section.header', function ($view) {
            $view->with('header_categories', \App\Models\Category::with('subcategory')->withCount('course')->orderBy('name')->get());

            if (auth()->check()) {
                $view->with('header_cart_items', \App\Models\Cart::where('user_id', auth()->id())->with('course')->latest()->get());
                $view->with('header_wishlist_items', \App\Models\Wishlist::where('user_id', auth()->id())->with('course')->latest()->get());
                $view->with('header_notifications', auth()->user()->notifications()->limit(5)->get());
            } else {
                $view->with('header_cart_items', collect([]));
                $view->with('header_wishlist_items', collect([]));
                $view->with('header_notifications', collect([]));
            }
        });
    }
}
