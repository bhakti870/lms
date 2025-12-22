<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Quiz;
use App\Models\QuizQuestion;
use App\Models\CourseSection;
use Illuminate\Http\Request;

class QuizController extends Controller
{
    /**
     * Store a newly created quiz.
     */
    public function store(Request $request)
    {
        $request->validate([
            'course_id' => 'required|exists:courses,id',
            'section_id' => 'required|exists:course_sections,id',
            'quiz_title' => 'required|string|max:255',
            'duration_minutes' => 'nullable|integer|min:0',
            'pass_mark' => 'nullable|integer|min:0|max:100',
        ]);

        Quiz::create([
            'course_id' => $request->course_id,
            'section_id' => $request->section_id,
            'quiz_title' => $request->quiz_title,
            'description' => $request->description,
            'duration_minutes' => $request->duration_minutes ?? 0,
            'pass_mark' => $request->pass_mark ?? 0,
            'is_active' => true,
        ]);

        return back()->with('success', 'Quiz added successfully!');
    }

    /**
     * Show quiz details and questions management page.
     */
    public function edit($id)
    {
        $quiz = Quiz::with('questions')->findOrFail($id);
        return view('backend.instructor.quiz.edit', compact('quiz'));
    }

    /**
     * Update quiz details.
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'quiz_title' => 'required|string|max:255',
            'duration_minutes' => 'nullable|integer|min:0',
            'pass_mark' => 'nullable|integer|min:0|max:100',
        ]);

        $quiz = Quiz::findOrFail($id);
        $quiz->update($request->all());

        return back()->with('success', 'Quiz updated successfully!');
    }

    /**
     * Remove the quiz.
     */
    public function destroy($id)
    {
        Quiz::findOrFail($id)->delete();
        return back()->with('success', 'Quiz deleted successfully!');
    }

    /**
     * Add Question to Quiz.
     */
    public function storeQuestion(Request $request)
    {
        $request->validate([
            'quiz_id' => 'required|exists:quizzes,id',
            'question_text' => 'required',
            'option_a' => 'required',
            'option_b' => 'required',
            'option_c' => 'required',
            'option_d' => 'required',
            'correct_answer' => 'required|in:a,b,c,d',
            'explanation' => 'nullable',
        ]);

        QuizQuestion::create($request->all());

        return back()->with('success', 'Question added successfully!');
    }

    /**
     * Update Question.
     */
    public function updateQuestion(Request $request, $id)
    {
        $request->validate([
            'question_text' => 'required',
            'option_a' => 'required',
            'option_b' => 'required',
            'option_c' => 'required',
            'option_d' => 'required',
            'correct_answer' => 'required|in:a,b,c,d',
        ]);

        $question = QuizQuestion::findOrFail($id);
        $question->update($request->all());

        return back()->with('success', 'Question updated successfully!');
    }

    /**
     * Delete Question.
     */
    public function destroyQuestion($id)
    {
        QuizQuestion::findOrFail($id)->delete();
        return back()->with('success', 'Question deleted successfully!');
    }
}
