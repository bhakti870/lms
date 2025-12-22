<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    protected $guarded = [];

    public function course()
    {
        return $this->belongsTo(Course::class);
    }

    public function section()
    {
        return $this->belongsTo(CourseSection::class);
    }

    public function questions()
    {
        return $this->hasMany(QuizQuestion::class)->orderBy('display_order');
    }

    public function results()
    {
        return $this->hasMany(QuizResult::class);
    }
}
