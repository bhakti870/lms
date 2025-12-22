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
        // Add order column to lectures
        Schema::table('course_lectures', function (Blueprint $table) {
            $table->integer('display_order')->default(0)->after('video_duration');
            $table->boolean('is_free')->default(false)->after('display_order');
        });

        // Quizzes Table
        Schema::create('quizzes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('course_id')->constrained()->onDelete('cascade');
            $table->foreignId('section_id')->constrained('course_sections')->onDelete('cascade');
            $table->string('quiz_title');
            $table->text('description')->nullable();
            $table->integer('duration_minutes')->default(0); // 0 means no limit
            $table->integer('pass_mark')->default(0);
            $table->integer('display_order')->default(0);
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });

        // Quiz Questions Table
        Schema::create('quiz_questions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('quiz_id')->constrained()->onDelete('cascade');
            $table->text('question_text');
            $table->string('option_a');
            $table->string('option_b');
            $table->string('option_c');
            $table->string('option_d');
            $table->string('correct_answer'); // a, b, c, or d
            $table->text('explanation')->nullable();
            $table->integer('display_order')->default(0);
            $table->timestamps();
        });

        // Course Materials Table
        Schema::create('course_materials', function (Blueprint $table) {
            $table->id();
            $table->foreignId('course_id')->constrained()->onDelete('cascade');
            $table->foreignId('section_id')->constrained('course_sections')->onDelete('cascade');
            $table->string('material_title');
            $table->enum('type', ['pdf', 'link', 'file', 'other']);
            $table->string('file_path')->nullable();
            $table->string('external_url')->nullable();
            $table->integer('display_order')->default(0);
            $table->timestamps();
        });

        // Enrollments Table (Centralized access management)
        Schema::create('enrollments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->foreignId('course_id')->constrained()->onDelete('cascade');
            $table->string('order_id')->nullable(); // Reference to orders table if exists
            $table->decimal('amount', 10, 2)->default(0);
            $table->timestamp('enrolled_at')->useCurrent();
            $table->enum('status', ['active', 'expired', 'cancelled'])->default('active');
            $table->timestamps();

            $table->unique(['user_id', 'course_id']);
        });

        // Course Progress Table
        Schema::create('course_progress', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->foreignId('course_id')->constrained()->onDelete('cascade');
            $table->string('content_type'); // lecture, quiz, material
            $table->unsignedBigInteger('content_id');
            $table->boolean('is_completed')->default(false);
            $table->timestamp('completed_at')->nullable();
            $table->timestamps();

            $table->unique(['user_id', 'course_id', 'content_type', 'content_id'], 'user_course_content_unique');
        });

        // Quiz Results (To track students' attempts)
        Schema::create('quiz_results', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->foreignId('quiz_id')->constrained()->onDelete('cascade');
            $table->integer('total_questions');
            $table->integer('correct_answers');
            $table->decimal('score', 5, 2);
            $table->boolean('is_pass');
            $table->timestamp('started_at')->nullable();
            $table->timestamp('completed_at')->nullable();
            $table->timestamps();
        });

        // Certificates Table
        Schema::create('certificates', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->foreignId('course_id')->constrained()->onDelete('cascade');
            $table->string('certificate_number')->unique();
            $table->string('file_path')->nullable();
            $table->timestamp('issued_at')->useCurrent();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('certificates');
        Schema::dropIfExists('quiz_results');
        Schema::dropIfExists('course_progress');
        Schema::dropIfExists('enrollments');
        Schema::dropIfExists('course_materials');
        Schema::dropIfExists('quiz_questions');
        Schema::dropIfExists('quizzes');
        
        Schema::table('course_lectures', function (Blueprint $table) {
            $table->dropColumn(['display_order', 'is_free']);
        });
    }
};
