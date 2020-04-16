<?php

namespace App\Http\Controllers\Admin;
use App\User;
use App\Employee;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\MediaUploadingTrait;
use App\Http\Requests\MassDestroyEmployeeRequest;
use App\Http\Requests\StoreEmployeeRequest;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\UpdateEmployeeRequest;
use Auth;
use App\Service;
use Gate;
use File;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Yajra\DataTables\Facades\DataTables;

class EmployeesController extends Controller
{
    use MediaUploadingTrait;

    public function index(Request $request)
    {

        $users=Auth::user();

        if($users->id == "1"){
            $employees=Employee::all();
        }
        else if($users->id !='1'){
        $employees=Employee::all()->where('IdResponsable','==',$users->id);
        }
        return view('admin.employees.index', compact('employees','users'));
    }

    public function create()
    {
        abort_if(Gate::denies('employee_create'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $services = Service::all()->pluck('name', 'id');
        $users=Auth::user();


        return view('admin.employees.create', compact('services','users'));
    }

    public function store(StoreEmployeeRequest $request)
    {
        $employee = new Employee();

        if ($request->hasFile('photo')) {

            // Get filename with the extension
            $filenameWithExt = $request->file('photo')->getClientOriginalName();
            // Get just filename
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            // Get just ext
            $extension = $request->file('photo')->getClientOriginalExtension();
            $fileNameToStore = $filename . '_' . time() . '.' . $extension;
            // Upload Image

             $path = $request->file('photo')->storeAs('public/photo', $fileNameToStore);
            // $fileNameToStore=  $path;
        }
        else $fileNameToStore="avatar.png";
        $employee->NomPrenom = request('NomPrenom')  ;
        $employee->lieuInscription = request('lieuInscription');
        $employee->Groupe = request('Groupe');
        $employee->Specialite = request('Specialite');
        $employee->Datedenaissance = request('Datedenaissance');
        $employee->Lieudenaissance = request('Lieudenaissance');
        $employee->CIN = request('CIN')  ;
        $employee->Delivree = request('Delivree');
        $employee->Numphone1 = request('Numphone1');
        $employee->Numphone2 = request('Numphone2')  ;
        $employee->DateInscription = request('DateInscription');
        $employee->Fraisinscrit = request('Fraisinscrit');
        $employee->fraisForm = request('fraisForm')  ;
        $employee->etat = request('etat');
        $employee->photo = $fileNameToStore;
        $employee->Attestations = request('Attestations');
        $employee->casier = request('casier');
        $employee->DescriptionCandidat = request('DescriptionCandidat');
        $employee->EmailResponsable = request('EmailResponsable');
        $employee->IdResponsable = request('IdResponsable');
        $employee->save();

        return redirect()->route('admin.employees.index');
    }

    public function edit(Employee $employee)
    {
        abort_if(Gate::denies('employee_edit'), Response::HTTP_FORBIDDEN, '403 Forbidden');



        return view('admin.employees.edit', compact('services', 'employee'));
    }

    public function update(UpdateEmployeeRequest $request, Employee $employee)
    {
        $employee->update($request->all());
        $employee->services()->sync($request->input('services', []));



        return redirect()->route('admin.employees.index');
    }

    public function show(Employee $employee)
    {
        abort_if(Gate::denies('employee_show'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $employee->load('services');

        return view('admin.employees.show', compact('employee'));
    }

    public function destroy(Employee $employee)
    {
        abort_if(Gate::denies('employee_delete'), Response::HTTP_FORBIDDEN, '403 Forbidden');

        $employee->delete();

        return back();
    }

    public function massDestroy(MassDestroyEmployeeRequest $request)
    {
        Employee::whereIn('id', request('ids'))->delete();

        return response(null, Response::HTTP_NO_CONTENT);
    }
}
