<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    use HasFactory;

    protected $guarded = [];

    /**
     * Get the roles for the permission.
     */
    public function roles()
    {
        return $this->belongsToMany(Role::class, 'role_permission');
    }

    /**
     * Get permissions grouped by group_name
     */
    public static function getGroupedPermissions()
    {
        return self::where('is_active', true)
            ->orderBy('group_name')
            ->orderBy('name')
            ->get()
            ->groupBy('group_name');
    }
}
