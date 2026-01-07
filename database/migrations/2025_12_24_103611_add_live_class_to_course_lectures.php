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
            $table->boolean('is_live')->default(false)->after('content');
            $table->string('live_link')->nullable()->after('is_live');
            $table->string('live_id')->nullable()->after('live_link');
            $table->string('live_password')->nullable()->after('live_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('course_lectures', function (Blueprint $table) {
            $table->dropColumn(['is_live', 'live_link', 'live_id', 'live_password']);
        });
    }
};
