<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Permission;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class PermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $permissions = Permission::latest()->get()->groupBy('group_name');
        return view('backend.admin.permission.index', compact('permissions'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $groups = Permission::select('group_name')->distinct()->pluck('group_name');
        return view('backend.admin.permission.create', compact('groups'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:permissions,name',
            'group_name' => 'required|string|max:255',
            'description' => 'nullable|string',
        ]);

        Permission::create([
            'name' => $request->name,
            'slug' => Str::slug($request->name),
            'group_name' => $request->group_name,
            'description' => $request->description,
            'is_active' => $request->has('is_active') ? 1 : 0,
        ]);

        return redirect()->route('admin.permission.index')
            ->with('success', 'Permission created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $permission = Permission::with('roles')->findOrFail($id);
        return view('backend.admin.permission.show', compact('permission'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $permission = Permission::findOrFail($id);
        $groups = Permission::select('group_name')->distinct()->pluck('group_name');
        return view('backend.admin.permission.edit', compact('permission', 'groups'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $permission = Permission::findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:255|unique:permissions,name,' . $id,
            'group_name' => 'required|string|max:255',
            'description' => 'nullable|string',
        ]);

        $permission->update([
            'name' => $request->name,
            'slug' => Str::slug($request->name),
            'group_name' => $request->group_name,
            'description' => $request->description,
            'is_active' => $request->has('is_active') ? 1 : 0,
        ]);

        return redirect()->route('admin.permission.index')
            ->with('success', 'Permission updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $permission = Permission::findOrFail($id);
        $permission->delete();

        return redirect()->route('admin.permission.index')
            ->with('success', 'Permission deleted successfully.');
    }
}
