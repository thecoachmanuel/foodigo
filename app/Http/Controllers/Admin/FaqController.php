<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Faq;
use Illuminate\Http\Request;

class FaqController extends Controller
{
    public function __construct()
    {
        $this->middleware('admin');
    }

    /**
     * Display a listing of User FAQs.
     */
    public function index()
    {
        $faqs = Faq::where(function ($q) {
            $q->where('type', 'user')->orWhereNull('type');
        })->orderBy('serial', 'asc')->get();

        return view('admin.faq.index', compact('faqs'));
    }

    /**
     * Display a listing of Partner (Restaurant) FAQs.
     */
    public function partnerIndex()
    {
        $faqs = Faq::where('type', 'partner')->orderBy('serial', 'asc')->get();

        return view('admin.faq.partner_index', compact('faqs'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'question' => 'required|string',
            'answer'   => 'required|string',
            'serial'   => 'nullable|integer',
            'type'     => 'nullable|string|in:user,partner',
        ]);

        $faq = new Faq();
        $faq->type = $request->type ?? 'user';
        $faq->question = $request->question;
        $faq->answer = $request->answer;
        $faq->serial = $request->serial ?? 0;
        $faq->status = 1;
        $faq->save();

        $notification = trans('translate.Created Successfully');
        return redirect()->back()->with([
            'message' => $notification,
            'alert-type' => 'success'
        ]);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'question' => 'required|string',
            'answer'   => 'required|string',
            'serial'   => 'nullable|integer',
            'type'     => 'nullable|string|in:user,partner',
        ]);

        $faq = Faq::findOrFail($id);
        if ($request->filled('type')) {
            $faq->type = $request->type;
        }
        $faq->question = $request->question;
        $faq->answer = $request->answer;
        $faq->serial = $request->serial ?? 0;
        $faq->save();

        $notification = trans('translate.Updated Successfully');
        return redirect()->back()->with([
            'message' => $notification,
            'alert-type' => 'success'
        ]);
    }

    public function destroy($id)
    {
        $faq = Faq::findOrFail($id);
        $faq->delete();

        $notification = trans('translate.Deleted Successfully');
        return redirect()->back()->with([
            'message' => $notification,
            'alert-type' => 'success'
        ]);
    }

    public function change_status($id)
    {
        $faq = Faq::findOrFail($id);
        $faq->status = $faq->status == 1 ? 0 : 1;
        $faq->save();

        return response()->json([
            'success' => true,
            'message' => trans('translate.Status Changed Successfully')
        ]);
    }
}
