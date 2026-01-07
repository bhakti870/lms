<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CourseProgress extends Model
{
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function course()
    {
        return $this->belongsTo(Course::class);
    }

    /**
     * Get the actual content object (Lecture, Quiz, or Material)
     */
    public function content()
    {
        return match ($this->content_type) {
            'lecture' => $this->belongsTo(CourseLecture::class, 'content_id'),
            'quiz' => $this->belongsTo(Quiz::class, 'content_id'),
            'material' => $this->belongsTo(CourseMaterial::class, 'content_id'),
            default => null,
        };
    }
}
