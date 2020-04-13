<style>
    .select-checkbox::before{display: none !important;}
</style>
@extends('layouts.admin')
@section('content')
@can('client_create')
    <div style="margin-bottom: 10px;" class="row">
        <div class="col-lg-12">
            <a class="btn btn-success" href="{{ route("admin.clients.create") }}">
                {{ trans('global.add') }} {{ trans('cruds.client.title_singular') }}
            </a>
        </div>
    </div>
@endcan
<div class="card">
    <div class="card-header">
        {{ trans('cruds.user.title_singular') }} {{ trans('global.list') }}
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class=" table table-bordered table-striped table-hover datatable datatable-Employee">
                <thead>
                <tr>

                    <th>
                        {{ trans('cruds.client.fields.name') }}
                    </th>

                    <th>
                        {{ trans('cruds.client.fields.phone') }}
                    </th>
                    <th>
                        {{ trans('cruds.client.fields.adresse') }}
                    </th>
                    <th>
                        {{ trans('cruds.client.fields.responsable') }}
                    </th>
                    <th>
                        {{ trans('cruds.client.fields.specialite') }}
                    </th>
                    <th>
                </tr>
                </thead>
                <tbody>


                @foreach($clients as $key => $client)
                    <tr data-entry-id="{{ $client->id }}">


                        <td>
                            {{ $client->name ?? '' }}
                        </td>
                        <td>
                            {{ $client->phone ?? '' }}
                        </td>

                        <td>
                            {{ $client->adresse ?? '' }}
                        </td>
                        <td>
                            {{ $client->responsable ?? '' }}
                        </td>
                        <td>
                            {{ $client->specialite  ?? '' }}
                        </td>


                        <td>
                         {{--
                         @can('client_show')
                                <a class="btn btn-xs btn-primary" href="{{ route('admin.clients.show', $client->id) }}">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </a>
                            @endcan

--}}
                            @can('client_edit')
                                <a class="btn btn-xs btn-info" href="{{ route('admin.clients.edit', $client->id) }}">
                                    <i class="fas fa-user-edit" aria-hidden="true"></i>
                                </a>
                            @endcan

                            @can('client_delete')
                                <form action="{{ route('admin.clients.destroy', $client->id) }}" method="POST" onsubmit="return confirm('{{ trans('global.areYouSure') }}');"
                                      style="display: inline-block;">
                                    <input type="hidden" name="_method" value="DELETE">
                                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                    {{--<input type="submit" class="btn btn-xs btn-danger" value="{{ trans('global.delete') }}">--}}
                                    <button type="submit" class="btn btn-xs btn-danger"  >
                                        <i class="fas fa-trash"aria-hidden="true"></i>
                                    </button>
                                </form>
                            @endcan

                        </td>

                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>


    </div>
    </div>
    </div>
@endsection
@section('scripts')
    @parent
    <script>
        $(function () {
            let dtButtons = $.extend(true, [], $.fn.dataTable.defaults.buttons)
                    @can('user_delete')
            let deleteButtonTrans = '{{ trans('global.datatables.delete') }}'
            let deleteButton = {
                text: deleteButtonTrans,
                url: "{{ route('admin.employees.massDestroy') }}",
                className: 'btn-danger',
                action: function (e, dt, node, config) {
                    var ids = $.map(dt.rows({ selected: true }).nodes(), function (entry) {
                        return $(entry).data('entry-id')
                    });

                    if (ids.length === 0) {
                        alert('{{ trans('global.datatables.zero_selected') }}')

                        return
                    }

                    if (confirm('{{ trans('global.areYouSure') }}')) {
                        $.ajax({
                            headers: {'x-csrf-token': _token},
                            method: 'POST',
                            url: config.url,
                            data: { ids: ids, _method: 'DELETE' }})
                            .done(function () { location.reload() })
                    }
                }
            }
            dtButtons.push(deleteButton)
            @endcan

$.extend(true, $.fn.dataTable.defaults, {
                order: [[ 1, 'desc' ]],
                pageLength: 100,
            });
            $('.datatable-Employee:not(.ajaxTable)').DataTable({ buttons: dtButtons })
            $('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
                $($.fn.dataTable.tables(true)).DataTable()
                    .columns.adjust();
            });
        })

    </script>
@endsection