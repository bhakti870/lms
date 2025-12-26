<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CourseQuestion extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function replies() {
        return $this->hasMany(CourseQuestion::class, 'parent_id')->with('user');
    }

    public function course() {
        return $this->belongsTo(Course::class, 'course_id', 'id');
    }

    public function lecture() {
        return $this->belongsTo(CourseLecture::class, 'lecture_id', 'id');
    }
}
