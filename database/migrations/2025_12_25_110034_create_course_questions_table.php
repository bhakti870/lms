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
        Schema::create('course_questions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('course_id');
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('lecture_id')->nullable();
            $table->unsignedBigInteger('parent_id')->nullable();
            $table->text('question'); // Used for both questions and replies/answers
            $table->boolean('is_instructor_reply')->default(false);
            $table->timestamps();

            // Foreign Keys (Assuming standard table names, using unsignedBigInteger for safety if constraints fail on exact table matching)
            // It is safer to use standard foreignId logic IF we are sure of table names. 
            // Given the environment, I'll stick to bigInteger to avoid 'table not found' errors during migration if order is weird, 
            // but ideally we should use foreign().
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('course_questions');
    }
};
