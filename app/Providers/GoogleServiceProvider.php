<?php

namespace App\Providers;

use App\Models\Google;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Schema;
use App\Models\Smtp;

class GoogleServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
   public function boot(): void
    {
        if (Schema::hasTable('smtps')) {

            $smtp = Smtp::first();

            if ($smtp) {
                config([
                    'mail.mailers.smtp.host' => $smtp->host,
                    'mail.mailers.smtp.port' => $smtp->port,
                    'mail.mailers.smtp.username' => $smtp->username,
                    'mail.mailers.smtp.password' => $smtp->password,
                    'mail.mailers.smtp.encryption' => $smtp->encryption,
                    'mail.from.address' => $smtp->from_address,
                    'mail.from.name' => $smtp->from_name,
                ]);
            }
        }
    }
}
