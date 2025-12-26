<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Role;
use App\Models\Permission;

class RolePermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create Permissions
        $permissions = [
            // User Management
            ['name' => 'View Users', 'slug' => 'view-users', 'group_name' => 'User Management'],
            ['name' => 'Create User', 'slug' => 'create-user', 'group_name' => 'User Management'],
            ['name' => 'Edit User', 'slug' => 'edit-user', 'group_name' => 'User Management'],
            ['name' => 'Delete User', 'slug' => 'delete-user', 'group_name' => 'User Management'],

            // Role Management
            ['name' => 'View Roles', 'slug' => 'view-roles', 'group_name' => 'Role Management'],
            ['name' => 'Create Role', 'slug' => 'create-role', 'group_name' => 'Role Management'],
            ['name' => 'Edit Role', 'slug' => 'edit-role', 'group_name' => 'Role Management'],
            ['name' => 'Delete Role', 'slug' => 'delete-role', 'group_name' => 'Role Management'],

            // Permission Management
            ['name' => 'View Permissions', 'slug' => 'view-permissions', 'group_name' => 'Permission Management'],
            ['name' => 'Create Permission', 'slug' => 'create-permission', 'group_name' => 'Permission Management'],
            ['name' => 'Edit Permission', 'slug' => 'edit-permission', 'group_name' => 'Permission Management'],
            ['name' => 'Delete Permission', 'slug' => 'delete-permission', 'group_name' => 'Permission Management'],

            // Course Management
            ['name' => 'View Courses', 'slug' => 'view-courses', 'group_name' => 'Course Management'],
            ['name' => 'Create Course', 'slug' => 'create-course', 'group_name' => 'Course Management'],
            ['name' => 'Edit Course', 'slug' => 'edit-course', 'group_name' => 'Course Management'],
            ['name' => 'Delete Course', 'slug' => 'delete-course', 'group_name' => 'Course Management'],
            ['name' => 'Approve Course', 'slug' => 'approve-course', 'group_name' => 'Course Management'],

            // Category Management
            ['name' => 'View Categories', 'slug' => 'view-categories', 'group_name' => 'Category Management'],
            ['name' => 'Create Category', 'slug' => 'create-category', 'group_name' => 'Category Management'],
            ['name' => 'Edit Category', 'slug' => 'edit-category', 'group_name' => 'Category Management'],
            ['name' => 'Delete Category', 'slug' => 'delete-category', 'group_name' => 'Category Management'],

            // Order Management
            ['name' => 'View Orders', 'slug' => 'view-orders', 'group_name' => 'Order Management'],
            ['name' => 'Edit Order', 'slug' => 'edit-order', 'group_name' => 'Order Management'],
            ['name' => 'Delete Order', 'slug' => 'delete-order', 'group_name' => 'Order Management'],

            // Coupon Management
            ['name' => 'View Coupons', 'slug' => 'view-coupons', 'group_name' => 'Coupon Management'],
            ['name' => 'Create Coupon', 'slug' => 'create-coupon', 'group_name' => 'Coupon Management'],
            ['name' => 'Edit Coupon', 'slug' => 'edit-coupon', 'group_name' => 'Coupon Management'],
            ['name' => 'Delete Coupon', 'slug' => 'delete-coupon', 'group_name' => 'Coupon Management'],

            // Settings Management
            ['name' => 'View Settings', 'slug' => 'view-settings', 'group_name' => 'Settings Management'],
            ['name' => 'Edit Settings', 'slug' => 'edit-settings', 'group_name' => 'Settings Management'],

            // Instructor Management
            ['name' => 'View Instructors', 'slug' => 'view-instructors', 'group_name' => 'Instructor Management'],
            ['name' => 'Approve Instructor', 'slug' => 'approve-instructor', 'group_name' => 'Instructor Management'],
            ['name' => 'Edit Instructor', 'slug' => 'edit-instructor', 'group_name' => 'Instructor Management'],
            ['name' => 'Delete Instructor', 'slug' => 'delete-instructor', 'group_name' => 'Instructor Management'],

            // Quiz Management
            ['name' => 'View Quizzes', 'slug' => 'view-quizzes', 'group_name' => 'Quiz Management'],
            ['name' => 'Create Quiz', 'slug' => 'create-quiz', 'group_name' => 'Quiz Management'],
            ['name' => 'Edit Quiz', 'slug' => 'edit-quiz', 'group_name' => 'Quiz Management'],
            ['name' => 'Delete Quiz', 'slug' => 'delete-quiz', 'group_name' => 'Quiz Management'],

            // Review Management
            ['name' => 'View Reviews', 'slug' => 'view-reviews', 'group_name' => 'Review Management'],
            ['name' => 'Approve Review', 'slug' => 'approve-review', 'group_name' => 'Review Management'],
            ['name' => 'Delete Review', 'slug' => 'delete-review', 'group_name' => 'Review Management'],

            // Material Management
            ['name' => 'View Materials', 'slug' => 'view-materials', 'group_name' => 'Material Management'],
            ['name' => 'Create Material', 'slug' => 'create-material', 'group_name' => 'Material Management'],
            ['name' => 'Delete Material', 'slug' => 'delete-material', 'group_name' => 'Material Management'],

            // Live Class Management
            ['name' => 'Manage Live Classes', 'slug' => 'manage-live-classes', 'group_name' => 'Live Class Management'],

            // Notification Management
            ['name' => 'View Notifications', 'slug' => 'view-notifications', 'group_name' => 'Notification Management'],
            ['name' => 'Send Notifications', 'slug' => 'send-notifications', 'group_name' => 'Notification Management'],

            // Subcategory Management
            ['name' => 'View Subcategories', 'slug' => 'view-subcategories', 'group_name' => 'Subcategory Management'],
            ['name' => 'Create Subcategory', 'slug' => 'create-subcategory', 'group_name' => 'Subcategory Management'],
            ['name' => 'Edit Subcategory', 'slug' => 'edit-subcategory', 'group_name' => 'Subcategory Management'],
            ['name' => 'Delete Subcategory', 'slug' => 'delete-subcategory', 'group_name' => 'Subcategory Management'],

            // Reports
            ['name' => 'View Reports', 'slug' => 'view-reports', 'group_name' => 'Reports'],
            ['name' => 'Export Reports', 'slug' => 'export-reports', 'group_name' => 'Reports'],
        ];

        foreach ($permissions as $permission) {
            Permission::updateOrCreate(['slug' => $permission['slug']], $permission);
        }

        // Create Roles
        $adminRole = Role::updateOrCreate(['slug' => 'admin'], [
            'name' => 'Administrator',
            'description' => 'Full system access with all permissions',
            'is_active' => true,
        ]);

        $instructorRole = Role::updateOrCreate(['slug' => 'instructor'], [
            'name' => 'Instructor',
            'description' => 'Can create and manage their own courses',
            'is_active' => true,
        ]);

        $userRole = Role::updateOrCreate(['slug' => 'user'], [
            'name' => 'Student',
            'description' => 'Regular user who can enroll in courses',
            'is_active' => true,
        ]);

        // Assign all permissions to Admin
        $adminRole->permissions()->sync(Permission::all()->pluck('id'));

        // Assign specific permissions to Instructor
        $instructorPermissions = Permission::whereIn('slug', [
            'view-courses',
            'create-course',
            'edit-course',
            'view-coupons',
            'create-coupon',
            'edit-coupon',
            'delete-coupon',
            'view-quizzes',
            'create-quiz',
            'edit-quiz',
            'delete-quiz',
            'view-materials',
            'create-material',
            'delete-material',
            'manage-live-classes',
            'view-reviews',
        ])->pluck('id');
        $instructorRole->permissions()->sync($instructorPermissions);

        // User role typically has no admin panel permissions
        // They can only access frontend features

        $this->command->info('Roles and Permissions seeded successfully!');
    }
}
