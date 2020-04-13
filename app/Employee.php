<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use Spatie\MediaLibrary\Models\Media;

class Employee extends Model implements HasMedia
{
    use SoftDeletes, HasMediaTrait;

    public $table = 'employees';

    protected $appends = [
        'photo',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    protected $fillable = [
        'NomPrenom',
        'lieuInscription',
        'Groupe',
        'Specialite',
        'Datedenaissance',
        'Lieudenaissance',
        'CIN',
        'Delivree',
        'Numphone1',
        'Numphone2',
        'DateInscription',
        'Fraisinscrit',
        'fraisForm',
        'etat',
        'Attestations',
        'casier',
        'DescriptionCandidat',
        'photo',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    public function registerMediaConversions(Media $media = null)
    {
        $this->addMediaConversion('thumb')->width(50)->height(50);
    }

    public function appointments()
    {
        return $this->hasMany(Appointment::class, 'employee_id', 'id');
    }

    public function getPhotoAttribute()
    {
        $file = $this->getMedia('photo')->last();

        if ($file) {
            $file->url       = $file->getUrl();
            $file->thumbnail = $file->getUrl('thumb');
        }

        return $file;
    }

    public function services()
    {
        return $this->belongsToMany(Service::class);
    }
}
