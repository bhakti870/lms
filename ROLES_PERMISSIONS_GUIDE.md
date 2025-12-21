# Role and Permission System Documentation

## Overview

This LMS application now has a comprehensive role and permission management system that allows you to control access to different features based on user roles and permissions.

## Features

### 1. **Roles Management**

-   Create, edit, and delete roles
-   Assign multiple permissions to roles
-   View role details including assigned permissions and users
-   Active/Inactive status for roles

### 2. **Permissions Management**

-   Create, edit, and delete permissions
-   Organize permissions by groups (e.g., User Management, Course Management)
-   Active/Inactive status for permissions

### 3. **User-Role Assignment**

-   Users can have multiple roles
-   Roles can be assigned to multiple users
-   Each role has a collection of permissions

## Database Structure

### Tables Created:

1. **roles** - Stores role information
2. **permissions** - Stores permission information
3. **role_permission** - Pivot table for role-permission relationships
4. **user_role** - Pivot table for user-role relationships

## Default Roles and Permissions

### Roles:

1. **Administrator** - Full system access with all permissions
2. **Instructor** - Can manage their own courses and coupons
3. **Student** - Regular user with frontend access only

### Permission Groups:

-   User Management
-   Role Management
-   Permission Management
-   Course Management
-   Category Management
-   Order Management
-   Coupon Management
-   Settings Management
-   Instructor Management
-   Reports

## Usage Examples

### In Controllers

#### Check if user has a permission:

```php
if (auth()->user()->hasPermission('create-course')) {
    // User can create courses
}
```

#### Check if user has any of multiple permissions:

```php
if (auth()->user()->hasAnyPermission(['create-course', 'edit-course'])) {
    // User can create or edit courses
}
```

#### Check if user has all permissions:

```php
if (auth()->user()->hasAllPermissions(['view-users', 'edit-users'])) {
    // User can both view and edit users
}
```

#### Check if user has a role:

```php
if (auth()->user()->hasRole('admin')) {
    // User is an admin
}
```

### In Routes

#### Protect route with permission middleware:

```php
Route::get('/admin/users', [UserController::class, 'index'])
    ->middleware('permission:view-users');
```

#### Protect route with multiple middlewares:

```php
Route::get('/admin/courses/create', [CourseController::class, 'create'])
    ->middleware(['auth', 'permission:create-course']);
```

### In Blade Views

#### Check permission in views:

```blade
@hasPermission('create-course')
    <a href="{{ route('admin.course.create') }}" class="btn btn-primary">Add Course</a>
@endhasPermission
```

#### Check if user has any permission:

```blade
@hasAnyPermission(['create-course', 'edit-course'])
    <div class="course-actions">
        <!-- Show course management options -->
    </div>
@endhasAnyPermission
```

#### Check if user has all permissions:

```blade
@hasAllPermissions(['view-users', 'edit-users', 'delete-users'])
    <div class="user-management-panel">
        <!-- Full user management panel -->
    </div>
@endhasAllPermissions
```

#### Check role in views:

```blade
@hasRole('admin')
    <div class="admin-panel">
        <!-- Admin only content -->
    </div>
@endhasRole
```

#### Check multiple roles:

```blade
@hasAnyRole(['admin', 'instructor'])
    <div class="instructor-tools">
        <!-- Content for admins and instructors -->
    </div>
@endhasAnyRole
```

## Model Methods

### User Model

#### Role Methods:

-   `hasRole($role)` - Check if user has a specific role
-   `hasAnyRole($roles)` - Check if user has any of the given roles
-   `assignRole($role)` - Assign a role to user
-   `removeRole($role)` - Remove a role from user
-   `syncRoles($roles)` - Sync user's roles

#### Permission Methods:

-   `hasPermission($permission)` - Check if user has a specific permission
-   `hasAnyPermission($permissions)` - Check if user has any of the given permissions
-   `hasAllPermissions($permissions)` - Check if user has all given permissions

### Role Model

#### Permission Methods:

-   `hasPermission($permission)` - Check if role has a specific permission
-   `givePermissionTo($permission)` - Assign permission to role
-   `revokePermissionTo($permission)` - Remove permission from role
-   `syncPermissions($permissions)` - Sync role's permissions

## Admin Panel Access

### URLs:

-   **Roles Management**: `/admin/role`
-   **Permissions Management**: `/admin/permission`

### Menu Location:

Navigate to **Roles & Permissions** in the admin sidebar to access:

-   Manage Roles
-   Manage Permissions

## Assigning Roles to Users

To assign roles to users programmatically:

```php
use App\Models\User;
use App\Models\Role;

$user = User::find(1);
$adminRole = Role::where('slug', 'admin')->first();

// Assign single role
$user->assignRole($adminRole);
// OR
$user->assignRole('admin'); // Using slug

// Assign multiple roles
$user->syncRoles([1, 2, 3]); // Using role IDs
```

## Creating Custom Permissions

You can create custom permissions through the admin panel or programmatically:

```php
use App\Models\Permission;

Permission::create([
    'name' => 'Export Data',
    'slug' => 'export-data',
    'group_name' => 'Reports',
    'description' => 'Allow user to export data',
    'is_active' => true,
]);
```

## Best Practices

1. **Use Permission Slugs**: Always use permission slugs (e.g., 'create-course') instead of IDs for better maintainability
2. **Group Permissions**: Organize permissions by functional groups for better management
3. **Descriptive Names**: Use clear, descriptive names for roles and permissions
4. **Regular Audits**: Regularly review and update permissions as features evolve
5. **Least Privilege**: Assign minimum necessary permissions to roles
6. **Documentation**: Keep track of what each permission controls

## Troubleshooting

### Users can't access features:

1. Check if user has the required role assigned
2. Verify the role has the necessary permissions
3. Ensure permissions are active (is_active = 1)

### Permission not working in views:

1. Make sure Blade directives are properly registered in AppServiceProvider
2. Clear view cache: `php artisan view:clear`
3. Check if user is authenticated

### Database errors:

1. Ensure migrations have run: `php artisan migrate`
2. Verify foreign key relationships are intact
3. Check if seeder has populated default data: `php artisan db:seed --class=RolePermissionSeeder`

## Extending the System

### Adding New Permission Groups:

Simply create permissions with a new group_name value through the admin panel or seeder.

### Custom Permission Logic:

You can extend the User model with custom permission checking methods for complex scenarios.

### Integration with Existing Features:

Add permission checks to existing controllers and views using the methods and directives documented above.

## Security Considerations

1. **Never expose permission IDs** in frontend code
2. **Always validate permissions** on the server side
3. **Use middleware** for route protection
4. **Regular security audits** of role-permission assignments
5. **Log permission changes** for audit trails (can be implemented)

## Support

For issues or questions about the role and permission system, refer to this documentation or check the implementation in:

-   Controllers: `app/Http/Controllers/backend/RoleController.php` and `PermissionController.php`
-   Models: `app/Models/Role.php`, `Permission.php`, and `User.php`
-   Middleware: `app/Http/Middleware/PermissionMiddleware.php`
-   Views: `resources/views/backend/admin/role/` and `resources/views/backend/admin/permission/`
