<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\CourseMaterial;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CourseMaterialController extends Controller
{
    /**
     * Store a newly created material.
     */
    public function store(Request $request)
    {
        $request->validate([
            'course_id' => 'required|exists:courses,id',
            'section_id' => 'required|exists:course_sections,id',
            'material_title' => 'required|string|max:255',
            'type' => 'required|in:pdf,link,file',
            'file' => 'required_if:type,pdf,file|file|max:10240', // 10MB limit
            'external_url' => 'required_if:type,link|nullable|url',
        ]);

        $data = [
            'course_id' => $request->course_id,
            'section_id' => $request->section_id,
            'material_title' => $request->material_title,
            'type' => $request->type,
        ];

        if ($request->type === 'link') {
            $data['external_url'] = $request->external_url;
        } else {
            if ($request->hasFile('file')) {
                $file = $request->file('file');
                $filename = time() . '_' . $file->getClientOriginalName();
                $path = 'uploads/materials/' . $filename;
                $file->move(public_path('uploads/materials'), $filename);
                $data['file_path'] = $path;
            }
        }

        CourseMaterial::create($data);

        return back()->with('success', 'Material added successfully!');
    }

    /**
     * Show the material edit form (actually we'll use a modal, but this returns the data if needed, or we can just handle it via update)
     */
    public function edit($id)
    {
        $material = CourseMaterial::findOrFail($id);
        return response()->json($material);
    }

    /**
     * Update the material.
     */
    public function update(Request $request, $id)
    {
        $material = CourseMaterial::findOrFail($id);

        $request->validate([
            'material_title' => 'required|string|max:255',
            'type' => 'required|in:pdf,link,file',
            'file' => 'nullable|file|max:10240', // 10MB limit
            'external_url' => 'required_if:type,link|nullable|url',
        ]);

        $data = [
            'material_title' => $request->material_title,
            'type' => $request->type,
        ];

        if ($request->type === 'link') {
            $data['external_url'] = $request->external_url;
            // If it was a file before, we might want to delete it, but let's keep it simple for now or explicitly null it
            $data['file_path'] = null;
        } else {
            if ($request->hasFile('file')) {
                // Delete old file if exists
                if ($material->file_path && file_exists(public_path($material->file_path))) {
                    unlink(public_path($material->file_path));
                }

                $file = $request->file('file');
                $filename = time() . '_' . $file->getClientOriginalName();
                $path = 'uploads/materials/' . $filename;
                $file->move(public_path('uploads/materials'), $filename);
                $data['file_path'] = $path;
                $data['external_url'] = null;
            }
        }

        $material->update($data);

        return back()->with('success', 'Material updated successfully!');
    }

    /**
     * Remove the material.
     */
    public function destroy($id)
    {
        $material = CourseMaterial::findOrFail($id);
        
        if ($material->file_path && file_exists(public_path($material->file_path))) {
            unlink(public_path($material->file_path));
        }

        $material->delete();
        return back()->with('success', 'Material deleted successfully!');
    }
}
