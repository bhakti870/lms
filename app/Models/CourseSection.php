<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CourseSection extends Model
{
    protected $guarded = [];

    public function lectures(){
        return $this->hasMany(CourseLecture::class, 'section_id', 'id')->orderBy('display_order');
    }

    public function quizzes()
    {
        return $this->hasMany(Quiz::class, 'section_id', 'id')->orderBy('display_order');
    }

    public function materials()
    {
        return $this->hasMany(CourseMaterial::class, 'section_id', 'id')->orderBy('display_order');
    }
}
