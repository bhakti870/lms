<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('course_lectures', function (Blueprint $table) {
            $table->date('live_date')->nullable()->after('live_password');
            $table->time('live_time')->nullable()->after('live_date');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('course_lectures', function (Blueprint $table) {
            $table->dropColumn(['live_date', 'live_time']);
        });
    }
};
