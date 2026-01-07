<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LectureRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, 
     */
    public function rules(): array
    {
        return [

            'course_id' => 'required|exists:courses,id', 
            'section_id' => 'required|exists:course_sections,id', 
            'lecture_title' => 'required|string|max:255', 
            'url' => 'nullable|url|max:255', 
            'content' => 'nullable|string', 
            'video_duration' => 'nullable',
            'is_live' => 'nullable|boolean',
            'live_link' => 'nullable|url|max:255',
            'live_id' => 'nullable|string|max:255',
            'live_password' => 'nullable|string|max:255',
            'live_date' => 'nullable|date',
            'live_time' => 'nullable',

        ];
    }
}
