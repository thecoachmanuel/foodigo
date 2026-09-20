@extends('admin.master_layout')
@section('title')
    <title>{{ __('translate.Partner FAQs (Restaurants)') }}</title>
@endsection

@section('body-header')
    <h3 class="crancy-header__title m-0">{{ __('translate.Help & FAQs') }}</h3>
    <p class="crancy-header__text">{{ __('translate.Manage Pages') }} >> {{ __('translate.Help & FAQs') }}</p>
@endsection

@section('body-content')
    <section class="crancy-adashboard crancy-show">
        <div class="container container__bscreen">
            <div class="row">
                <div class="col-12">
                    <div class="crancy-body">
                        <div class="crancy-dsinner">

                            <div class="crancy-table crancy-table--v3 mg-top-30">
                                <div class="crancy-customer-filter">
                                    <div class="crancy-customer-filter__single crancy-customer-filter__single--csearch d-flex items-center justify-between create_new_btn_box">
                                        <div class="crancy-header__form crancy-header__form--customer create_new_btn_inline_box">
                                            <h4 class="crancy-product-card__title">{{ __('translate.Help & FAQ List') }}</h4>

                                            <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#createFaqModal" class="crancy-btn">
                                                <span>
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                                                        <path d="M8 1V15" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                        <path d="M1 8H15" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    </svg>
                                                </span> {{ __('translate.Create Partner FAQ') }}
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <div id="crancy-table__main_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer">
                                    <table class="crancy-table__main crancy-table__main-v3 dataTable no-footer" id="dataTable">
                                        <thead class="crancy-table__head">
                                            <tr>
                                                <th class="crancy-table__column-2 crancy-table__h2">#</th>
                                                <th class="crancy-table__column-2 crancy-table__h2">{{ __('translate.Question') }}</th>
                                                <th class="crancy-table__column-2 crancy-table__h2">{{ __('translate.Answer') }}</th>
                                                <th class="crancy-table__column-2 crancy-table__h2">{{ __('translate.Status') }}</th>
                                                <th class="crancy-table__column-3 crancy-table__h3">{{ __('translate.Action') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody class="crancy-table__body">
                                            @foreach ($faqs as $index => $faq)
                                                <tr class="odd">
                                                    <td class="crancy-table__column-2 crancy-table__data-2">
                                                        <h4 class="crancy-table__product-title">{{ ++$index }}</h4>
                                                    </td>
                                                    <td class="crancy-table__column-2 crancy-table__data-2">
                                                        <h4 class="crancy-table__product-title">{{ $faq->question }}</h4>
                                                    </td>
                                                    <td class="crancy-table__column-2 crancy-table__data-2" style="max-width: 320px;">
                                                        <p style="font-size: 13px; color: #64748B;">{{ Str::limit($faq->answer, 100) }}</p>
                                                    </td>
                                                    <td class="crancy-table__column-2 crancy-table__data-2">
                                                        @if ($faq->status == 1)
                                                            <a href="{{ route('admin.faq.status', $faq->id) }}"><span class="badge bg-success text-white">{{ __('translate.Active') }}</span></a>
                                                        @else
                                                            <a href="{{ route('admin.faq.status', $faq->id) }}"><span class="badge bg-danger text-white">{{ __('translate.Inactive') }}</span></a>
                                                        @endif
                                                    </td>
                                                    <td class="crancy-table__column-2 crancy-table__data-2">
                                                        <a href="javascript:;" onclick="editFaq({{ json_encode($faq) }})" class="crancy-btn"><i class="fas fa-edit"></i> {{ __('translate.Edit') }}</a>
                                                        <a onclick="itemDeleteConfrimation({{ $faq->id }})" href="javascript:;" data-bs-toggle="modal" data-bs-target="#deleteFaqModal" class="crancy-btn delete_danger_btn"><i class="fas fa-trash"></i> {{ __('translate.Delete') }}</a>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Create FAQ Modal -->
    <div class="modal fade" id="createFaqModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{{ __('translate.Create Partner FAQ') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="{{ route('admin.faq.store') }}" method="POST">
                    <input type="hidden" name="type" value="partner">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group mb-3">
                            <label class="form-label">{{ __('translate.Question') }} <span class="text-danger">*</span></label>
                            <input type="text" name="question" class="form-control" placeholder="e.g. How do I request a wallet payout?" required>
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">{{ __('translate.Answer') }} <span class="text-danger">*</span></label>
                            <textarea name="answer" class="form-control" rows="5" placeholder="Enter clear, helpful answer..." required></textarea>
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">{{ __('translate.Serial Order') }}</label>
                            <input type="number" name="serial" class="form-control" value="0">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="crancy-btn bg-secondary text-white" data-bs-dismiss="modal">{{ __('translate.Close') }}</button>
                        <button type="submit" class="crancy-btn">{{ __('translate.Save') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Partner FAQ Modal -->
    <div class="modal fade" id="editFaqModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{{ __('translate.Edit Partner FAQ') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="editFaqForm" action="" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="form-group mb-3">
                            <label class="form-label">{{ __('translate.Question') }} <span class="text-danger">*</span></label>
                            <input type="text" id="edit_question" name="question" class="form-control" required>
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">{{ __('translate.Answer') }} <span class="text-danger">*</span></label>
                            <textarea id="edit_answer" name="answer" class="form-control" rows="5" required></textarea>
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">{{ __('translate.Serial Order') }}</label>
                            <input type="number" id="edit_serial" name="serial" class="form-control" value="0">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="crancy-btn bg-secondary text-white" data-bs-dismiss="modal">{{ __('translate.Close') }}</button>
                        <button type="submit" class="crancy-btn">{{ __('translate.Update') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div class="modal fade" id="deleteFaqModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{{ __('translate.Delete Confirmation') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>{{ __('translate.Are you realy want to delete this item?') }}</p>
                </div>
                <div class="modal-footer">
                    <form action="" id="item_delect_confirmation" class="delet_modal_form" method="POST">
                        @csrf
                        @method('DELETE')
                        <button type="button" class="crancy-btn bg-secondary text-white" data-bs-dismiss="modal">{{ __('translate.Close') }}</button>
                        <button type="submit" class="crancy-btn delete_danger_btn">{{ __('translate.Yes, Delete') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js_section')
<script>
    function editFaq(faq) {
        let updateUrl = "{{ url('/admin/faq-update') }}/" + faq.id;
        document.getElementById('editFaqForm').action = updateUrl;
        document.getElementById('edit_question').value = faq.question;
        document.getElementById('edit_answer').value = faq.answer;
        document.getElementById('edit_serial').value = faq.serial || 0;
        var myModal = new bootstrap.Modal(document.getElementById('editFaqModal'));
        myModal.show();
    }

    function itemDeleteConfrimation(id){
        $("#item_delect_confirmation").attr("action",'{{ url("/admin/faq-delete/") }}'+"/"+id)
    }
</script>
@endpush
