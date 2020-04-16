@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.create') }} {{ trans('cruds.employee.title_singular') }}
    </div>

    <div class="card-body">
        <form action="{{ route("admin.employees.store") }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="row">
                <div class="col-xs-12 col-md-4" style="display: none"> <div class="form-group">
                        <label for="NomPrenom">{{ trans('cruds.employee.fields.NomPrenom') }}<span>*</span></label>
                        <input type="hidden" id="name" name="name" class="form-control" value="Null" >

                    </div></div>
                <div class="col-xs-12 col-md-4"> <div class="form-group {{ $errors->has('NomPrenom') ? 'has-error' : '' }}">
                        <label for="NomPrenom">{{ trans('cruds.employee.fields.NomPrenom') }}<span>*</span></label>
                        <input type="text" id="NomPrenom" name="NomPrenom" class="form-control" value="{{ old('NomPrenom', isset($employee) ? $employee->NomPrenom : '') }}" required>
                        @if($errors->has('NomPrenom'))
                            <em class="invalid-feedback">
                                {{ $errors->first('NomPrenom') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.name_helper') }}
                        </p>
                    </div></div>
                <div class="col-xs-12 col-md-4">  <div class="form-group {{ $errors->has('lieuInscription') ? 'has-error' : '' }}">
                        <label for="email">{{ trans('cruds.employee.fields.lieuInscription') }} <span>*</span></label>
                        <input type="text" id="lieuInscription" name="lieuInscription" class="form-control" value="{{ old('lieuInscription', isset($employee) ? $employee->lieuInscription : '') }}" required>
                        @if($errors->has('lieuInscription'))
                            <em class="invalid-feedback">
                                {{ $errors->first('lieuInscription') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.email_helper') }}
                        </p>
                    </div></div>
                <div class="col-xs-12 col-md-4"> <div class="form-group {{ $errors->has('Groupe') ? 'has-error' : '' }}">
                        <label for="Groupe">{{ trans('cruds.employee.fields.Groupe') }} <span>*</span></label>
                        <input type="text" id="Groupe" name="Groupe" class="form-control" value="{{ old('Groupe', isset($employee) ? $employee->Groupe : '') }}">
                        @if($errors->has('Groupe'))
                            <em class="invalid-feedback">
                                {{ $errors->first('phone') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.phone_helper') }}
                        </p>
                    </div></div>
            </div>

            <div class="row">
                <div class="col-xs-12 col-md-4"> <div class="form-group {{ $errors->has('Specialite') ? 'has-error' : '' }}">
                        <label for="name">{{ trans('cruds.employee.fields.Specialite') }}<span>*</span></label>
                        <input type="text" id="Specialite" name="Specialite" class="form-control" value="{{ old('Specialite', isset($employee) ? $employee->Specialite : '') }}" required>
                        @if($errors->has('Specialite'))
                            <em class="invalid-feedback">
                                {{ $errors->first('Specialite') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.name_helper') }}
                        </p>
                    </div></div>
                <div class="col-xs-12 col-md-4">  <div class="form-group {{ $errors->has('Datedenaissance') ? 'has-error' : '' }}">

                    <div class="form-group {{ $errors->has('Datedenaissance') ? 'has-error' : '' }}">
                        <label for="Datedenaissance">{{ trans('cruds.employee.fields.Datedenaissance') }}<span>*</span></label>
                        <input type="text" id="Datedenaissance" name="Datedenaissance" class="form-control datetime"
                               value="{{ old('Datedenaissance', isset($employee) ? $employee->Datedenaissance : '') }}" required>
                        <span class="add-on"><i class="icon-th"></i></span>
                        @if($errors->has('Datedenaissance'))
                            <em class="invalid-feedback">
                                {{ $errors->first('Datedenaissance') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.appointment.fields.start_time_helper') }}
                        </p>
                    </div>

                </div>
                </div>
                <div class="col-xs-12 col-md-4"> <div class="form-group {{ $errors->has('Lieudenaissance') ? 'has-error' : '' }}">
                        <label for="Lieudenaissance">{{ trans('cruds.employee.fields.Lieudenaissance') }} <span>*</span></label>
                        <input type="text" id="Lieudenaissance" name="Lieudenaissance" class="form-control" value="{{ old('Lieudenaissance', isset($employee) ? $employee->Lieudenaissance : '') }}">
                        @if($errors->has('Lieudenaissance'))
                            <em class="invalid-feedback">
                                {{ $errors->first('Lieudenaissance') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.phone_helper') }}
                        </p>
                    </div></div>
            </div>

            <div class="row">
                <div class="col-xs-12 col-md-4"> <div class="form-group {{ $errors->has('CIN') ? 'has-error' : '' }}">
                        <label for="CIN">{{ trans('cruds.employee.fields.CIN') }}<span>*</span></label>
                        <input type="text" id="CIN" name="CIN" class="form-control" value="{{ old('CIN', isset($employee) ? $employee->CIN : '') }}" required>
                        @if($errors->has('CIN'))
                            <em class="invalid-feedback">
                                {{ $errors->first('CIN') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.name_helper') }}
                        </p>
                    </div></div>
                <div class="col-xs-12 col-md-4">  <div class="form-group {{ $errors->has('Delivree') ? 'has-error' : '' }}">

                        <div class="form-group {{ $errors->has('Delivree') ? 'has-error' : '' }}">
                            <label for="Datedenaissance">{{ trans('cruds.employee.fields.Delivree') }}<span>*</span></label>
                            <input type="text" id="Delivree" name="Delivree" class="form-control datetime"
                                   value="{{ old('Delivree', isset($employee) ? $employee->Delivree : '') }}" required>
                            @if($errors->has('Delivree'))
                                <em class="invalid-feedback">
                                    {{ $errors->first('Delivree') }}
                                </em>
                            @endif
                            <p class="helper-block">
                                {{ trans('cruds.appointment.fields.start_time_helper') }}
                            </p>
                        </div>

                    </div>
                </div>
                <div class="col-xs-12 col-md-4"> <div class="form-group {{ $errors->has('Numphone1') ? 'has-error' : '' }}">
                        <label for="Numphone1">{{ trans('cruds.employee.fields.Numphone1') }} <span>*</span></label>
                        <input type="text" id="Numphone1" name="Numphone1" class="form-control" value="{{ old('Numphone1', isset($employee) ? $employee->Numphone1 : '') }}">
                        @if($errors->has('Numphone1'))
                            <em class="invalid-feedback">
                                {{ $errors->first('Numphone1') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.phone_helper') }}
                        </p>
                    </div></div>
            </div>

            <div class="row">
                <div class="col-xs-12 col-md-4">
                    <div class="form-group {{ $errors->has('Numphone2') ? 'has-error' : '' }}">
                        <label for="Numphone2">{{ trans('cruds.employee.fields.Numphone2') }}<span>*</span></label>
                        <input type="text" id="Numphone2" name="Numphone2" class="form-control" value="{{ old('Numphone2', isset($employee) ? $employee->Numphone2 : '') }}" required>
                        @if($errors->has('Numphone2'))
                            <em class="invalid-feedback">
                                {{ $errors->first('Numphone2') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.name_helper') }}
                        </p>
                    </div>
                </div>
                <div class="col-xs-12 col-md-4">  <div class="form-group {{ $errors->has('DateInscription') ? 'has-error' : '' }}">
                        <div class="form-group {{ $errors->has('DateInscription') ? 'has-error' : '' }}">
                            <label for="DateInscription">{{ trans('cruds.employee.fields.DateInscription') }}<span>*</span></label>
                            <input type="text" id="DateInscription" name="DateInscription" class="form-control datetime"
                                   value="{{ old('DateInscription', isset($employee) ? $employee->DateInscription : '') }}" required>
                            @if($errors->has('start_time'))
                                <em class="invalid-feedback">
                                    {{ $errors->first('start_time') }}
                                </em>
                            @endif
                            <p class="helper-block">
                                {{ trans('cruds.appointment.fields.start_time_helper') }}
                            </p>
                        </div>
                </div>
                </div>


                <div class="col-xs-12 col-md-4">
                    <div class="form-group {{ $errors->has('Fraisinscrit') ? 'has-error' : '' }}">
                        <label for="Fraisinscrit">{{ trans('cruds.employee.fields.Fraisinscrit') }} <span>*</span></label>
                        <input type="text" id="Fraisinscrit" name="Fraisinscrit" class="form-control" value="{{ old('Fraisinscrit', isset($employee) ? $employee->Fraisinscrit : '') }}">
                        @if($errors->has('Fraisinscrit'))
                            <em class="invalid-feedback">
                                {{ $errors->first('Fraisinscrit') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.phone_helper') }}
                        </p>
                    </div></div>
            </div>


            <div class="row">
                <div class="col-xs-12 col-md-4"> <div class="form-group {{ $errors->has('fraisForm') ? 'has-error' : '' }}">
                        <label for="fraisForm">{{ trans('cruds.employee.fields.fraisForm') }}<span>*</span></label>
                        <input type="text" id="fraisForm" name="fraisForm" class="form-control" value="{{ old('fraisForm', isset($employee) ? $employee->fraisForm : '') }}" required>
                        @if($errors->has('fraisForm'))
                            <em class="invalid-feedback">
                                {{ $errors->first('fraisForm') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.name_helper') }}
                        </p>
                    </div></div>
                <div class="col-xs-12 col-md-4">  <div class="form-group {{ $errors->has('etat') ? 'has-error' : '' }}">
                        <label for="email">{{ trans('cruds.employee.fields.etat') }}<span>*</span></label>
                        <input type="text" id="etat" name="etat" class="form-control" value="{{ old('etat', isset($employee) ? $employee->etat : '') }}">
                        @if($errors->has('etat'))
                            <em class="invalid-feedback">
                                {{ $errors->first('etat') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.email_helper') }}
                        </p>
                    </div></div>
                <div class="col-xs-12 col-md-4"> <div class="form-group {{ $errors->has('Attestations') ? 'has-error' : '' }}">
                        <label for="Attestations">{{ trans('cruds.employee.fields.Attestations') }}<span>*</span></label>
                        <input type="text" id="Attestations" name="Attestations" class="form-control" value="{{ old('phone', isset($employee) ? $employee->Attestations : '') }}">
                        @if($errors->has('Attestations'))
                            <em class="invalid-feedback">
                                {{ $errors->first('Attestations') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.phone_helper') }}
                        </p>
                    </div></div>
            </div>

            <div class="row">
                <div class="col-xs-12 col-md-4"> <div class="form-group {{ $errors->has('casier') ? 'has-error' : '' }}">
                        <label for="name">{{ trans('cruds.employee.fields.casier') }}<span>*</span></label>
                        <input type="text" id="casier" name="casier" class="form-control" value="{{ old('casier', isset($employee) ? $employee->casier : '') }}" required>
                        @if($errors->has('casier'))
                            <em class="invalid-feedback">
                                {{ $errors->first('casier') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.name_helper') }}
                        </p>
                    </div></div>
                <div class="col-xs-12 col-md-4">
                <div class="form-group">
                        <label for="DescriptionCandidat">{{ trans('cruds.employee.fields.DescriptionCandidat') }}<span>*</span></label>
                        <textarea rows="2" class="form-control" id="DescriptionCandidat"  name ="DescriptionCandidat">
                            {{ old('email', isset($employee) ? $employee->DescriptionCandidat : '') }}
                        </textarea>


                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.email_helper') }}
                        </p>
                    </div>


                </div>
                <div class="col-xs-12 col-md-4"> <div class="form-group {{ $errors->has('photo') ? 'has-error' : '' }}">
                    <label for="name">{{ trans('cruds.employee.fields.photo') }}<span>*</span></label>
                        <label class="custom-file-upload">
                        <input type="file" name="photo"/>
                        <i class="fas fa-upload"></i>
                        </label>
                        @if($errors->has('photo'))
                            <em class="invalid-feedback">
                                {{ $errors->first('photo') }}
                            </em>
                        @endif
                        <p class="helper-block">
                            {{ trans('cruds.employee.fields.name_helper') }}
                        </p>
                </div>
            </div>

                <input type="hidden" id="EmailResponsable" name="EmailResponsable" class="form-control" value="{{ $users->email ?? "" }}" >
                <input type="hidden" id="IdResponsable" name="IdResponsable" class="form-control"value="{{ $users->id ?? "" }}" >
                <input class="btn btn-danger" type="submit" value="{{ trans('global.save') }}">
            </div>
        </form>


    </div>
</div>
@endsection


