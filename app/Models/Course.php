<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    protected $guarded = [];

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }

    public function subCategory()
    {
        return $this->belongsTo(SubCategory::class, 'subcategory_id', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'instructor_id', 'id');
    }

    public function instructor()
    {
        return $this->belongsTo(User::class, 'instructor_id', 'id');
    }

    public function course_goal()
    {
        return $this->hasMany(CourseGoal::class, 'course_id', 'id');
    }

    public function sections()
    {
        return $this->hasMany(CourseSection::class, 'course_id', 'id')->orderBy('display_order');
    }

    public function lectures()
    {
        return $this->hasMany(CourseLecture::class, 'course_id', 'id')->orderBy('display_order');
    }

    public function quizzes()
    {
        return $this->hasMany(Quiz::class, 'course_id', 'id')->orderBy('display_order');
    }

    public function materials()
    {
        return $this->hasMany(CourseMaterial::class, 'course_id', 'id')->orderBy('display_order');
    }

    public function enrollments()
    {
        return $this->hasMany(Enrollment::class, 'course_id', 'id');
    }

    public function reviews()
    {
        return $this->hasMany(Review::class, 'course_id', 'id')->where('status', 1)->latest();
    }
}
