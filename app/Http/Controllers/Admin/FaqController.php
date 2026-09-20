<?php

namespace AppHttpControllersAdmin;

use AppHttpControllersController;
use AppModelsFaq;
use IlluminateHttpRequest;

class FaqController extends Controller
{
    public function __construct()
    {
        $this->middleware('admin');
    }

    public function index()
    {
        $faqs = Faq::orderBy('serial', 'asc')->get();
        return view('admin.faq.index', compact('faqs'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'question' => 'required|string',
            'answer' => 'required|string',
            'serial' => 'nullable|integer',
        ]);

        $faq = new Faq();
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
            'answer' => 'required|string',
            'serial' => 'nullable|integer',
        ]);

        $faq = Faq::findOrFail($id);
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
