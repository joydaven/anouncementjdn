<?php

namespace App\Providers;

use App\View\Composers\ProfileComposer;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades;
use Illuminate\View\View;

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
        Facades\View::composer('templates.header', function (View $view) {
            $view->with('title', 'Announcement System');
        });
        //view()->composer('templates.header', function($view) {
        //    $view->with('title', 'Announcement System');
        //});
    }
}
