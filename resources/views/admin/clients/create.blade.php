@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.create') }} {{ trans('cruds.client.title_singular') }}
    </div>

    <div class="card-body">
        <form action="{{ route("admin.clients.store") }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
                <label for="name">{{ trans('cruds.client.fields.name') }}</label>
                <input type="text" id="name" name="name" class="form-control" value="{{ old('name', isset($client) ? $client->name : '') }}">
                @if($errors->has('name'))
                    <em class="invalid-feedback">
                        {{ $errors->first('name') }}
                    </em>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.client.fields.name_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('phone') ? 'has-error' : '' }}">
                <label for="phone">{{ trans('cruds.client.fields.phone') }}</label>
                <input type="text" id="phone" name="phone" class="form-control" value="{{ old('phone', isset($client) ? $client->phone : '') }}">
                @if($errors->has('phone'))
                    <em class="invalid-feedback">
                        {{ $errors->first('phone') }}
                    </em>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.client.fields.phone_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('specialite') ? 'has-error' : '' }}">
                <label for="name">{{ trans('cruds.client.fields.specialite') }}</label>
                <input type="text" id="specialite" name="specialite" class="form-control" value="{{ old('specialite', isset($client) ? $client->specialite : '') }}">
                @if($errors->has('specialite'))
                    <em class="invalid-feedback">
                        {{ $errors->first('specialite') }}
                    </em>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.client.fields.name_helper') }}
                </p>
            </div>
            <div class="form-group {{ $errors->has('responsable') ? 'has-error' : '' }}">
                <label for="name">{{ trans('cruds.client.fields.responsable') }}</label>

            @if (count($users) > 0)
                <div class="form-group">


                    <select class="form-control" id="responsable" name="responsable" required>

                        @foreach($users as $user )
                            @if($user->name)
                                <option value="{{ $user->name }}">{{ $user->name   ?? '' }}</option>
                            @endif
                        @endforeach
                    </select>



                </div>

            @else
                    <label for="name">{{ trans('cruds.client.fields.responsableexiste') }}</label>
            @endif
            </div>
            <div class="form-group {{ $errors->has('adresse') ? 'has-error' : '' }}">
                <label for="name">{{ trans('cruds.client.fields.adresse') }}</label>
                <input type="text" id="adresse" name="adresse" class="form-control" value="{{ old('adresse', isset($client) ? $client->adresse : '') }}">
                @if($errors->has('adresse'))
                    <em class="invalid-feedback">
                        {{ $errors->first('adresse') }}
                    </em>
                @endif
                <p class="helper-block">
                    {{ trans('cruds.client.fields.name_helper') }}
                </p>
            </div>




            <div>
                <input class="btn btn-danger" type="submit" value="{{ trans('global.save') }}">
            </div>
        </form>


    </div>
</div>
@endsection