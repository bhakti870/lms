<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Bcrypt;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $admin = User::updateOrCreate(['email' => 'admin@example.com'], [
            'name' => 'Admin User',
            'password' => bcrypt('password'),
            'photo' => null,
            'phone' => '1234567890',
            'address' => '123 Admin Street',
            'role' => 'admin',
            'status' => '1',
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        $admin->assignRole('admin');

        $instructor = User::updateOrCreate(['email' => 'instructor@example.com'], [
            'name' => 'Instructor User',
            'password' => bcrypt('password'),
            'photo' => null,
            'phone' => '0987654321',
            'address' => '456 Instructor Avenue',
            'role' => 'instructor',
            'status' => '1',
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        $instructor->assignRole('instructor');

        $user = User::updateOrCreate(['email' => 'user@example.com'], [
            'name' => 'Regular User',
            'password' => Hash::make('password'),
            'photo' => null,
            'phone' => '5555555555',
            'address' => '789 User Lane',
            'role' => 'user',
            'status' => '1',
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        $user->assignRole('user');
    }
}
