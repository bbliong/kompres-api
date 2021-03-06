<?php

namespace App\Http\Controllers\AdminController;

use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Facilitator;
use App\Http\Helper\Upload;
use App\Mail\mailFacilitator;
use App\Http\Requests;
use App\Models\User;
use Carbon\Carbon;
use Validator;



class profileController extends Controller
{
    public function organizer(){
    	return view('admin.organizer');
    }


    public function create(Request $request){
     $validator = Validator::make(request()->all(), [
        'nama_instansi' => 'required|max:100',
        'deskripsi_instansi' => 'required|max:500',
        'kategori' => 'required|max:10',
        'berkas' => 'required|file|max:10000', // max 2MB
      ]);

      if($validator->fails()) {
        return redirect()
            ->back()
            ->withErrors($validator->errors());
      }


         if (Auth::user()->role == 1) {
            if(Auth::user()->facilitator == null){
                $logo = $request->image_data;
                $file = $request->file('berkas');   
                $token = str_random(20);

                if($logo !== null){
                  $name = "profile.png";
                  $logo = Upload::changeBase64($request->image_data, 'public/facilitators/'.$token , $name); 
                }else $logo = "";

                if($file !== null){
                  $name = "profile.". $file->getClientOriginalExtension();
                  $path = $file->storeAS('public/facilitators/'.$token , $name);
                }else $path = "";

                $slug = str_slug($request->nama_instansi, '-');
                   $facilitator = Auth::user()->facilitator()->create([
                      'nama_instansi' => $request->nama_instansi,
                      'deskripsi_instansi' => $request->deskripsi_instansi,
                      'token_facilitator'   => $token,
                      'kategori' => $request->kategori,
                      'berkas_pendukung' =>  $path,
                      'img_url' =>  $logo,
                      'str_slug' =>  $slug
                  ]);
              //mengirim email
              $data = Mail::to(Auth::user()->email)->send(new mailFacilitator($facilitator));
              return redirect()
                ->back()
                ->withSuccess('Silahkan cek E-mail untuk melakukan aktifasi menjadi penyedia');;
      
            }
          }
    }

   	public function index(Request $request){
    	$user = $request->user(); 
      $facilitator = $user->facilitator;
     

    	return view('admin.profile', ["user" => $user, "facilitator" => $facilitator]);
    	// return view('admin.profile');
         // return view('admin.listScholarship', ["beasiswas" => $beasiswa]);
    }

    public function update(request $request){
    
      $validator = Validator::make(request()->all(), [
        'nama_instansi' => 'nullable|max:100',
        'deskripsi_instansi' => 'nullable|max:500',
        'kategori' => 'nullable|max:10',
        'alamat' => 'required|max:200',
        'berkas' => 'nullable|file|max:10000', // max 2MB
      ]);
      
      if($validator->fails()) {
      return   redirect()
            ->back()
            ->withErrors($validator->errors());
      }

        $user = $request->user();  
        $facilitator = $user->facilitator;
        // $target =  Upload::create_dir('data-users/facilitators', trim($facilitator->nama_instansi)); 
        // Sebelumnya dipakai untuk bantuan dalam membuat direktori, tapi rupanya kalo pake filesystem laravel sudaha ada fungsinya 
        
        $logo = $request->image_data;
        //1. mengambil request dari form yang sudah diubah menajadi base64 oleh javascript cropit.js
        //2. melakukan validasi apakah ada data dari hasil encode
        //3. memanggil fungsi changeBae64 dengan parameter -> data encode -> direktori folder tujuan -> nama file
        $file = $request->file('berkas');   
          if($logo !== null){
            $name = "profile.png";
            $logo = Upload::changeBase64($request->image_data, 'public/facilitators/'.$facilitator->token_facilitator , $name); 
            $facilitator->img_url =  $logo;
          }
          if($file !== null){
            $name = "profile.". $file->getClientOriginalExtension();
            $path = $file->storeAS('public/facilitators/'.$facilitator->token_facilitator , $name);
            $facilitator->berkas_pendukung =  $path;
          }
    
        $facilitator->nama_instansi = $request->nama_instansi;
        $facilitator->deskripsi_instansi = $request->deskripsi_instansi;
        $facilitator->kategori = $request->kategori;
        $facilitator->alamat = $request->alamat;
        $facilitator->no_tempat = $request->no_tempat;
        $facilitator->nama_jalan = $request->nama_jalan;
        $facilitator->kecamatan = $request->kecamatan;
        $facilitator->kelurahan = $request->kelurahan;
        $facilitator->kota = $request->kota;
        $facilitator->provinsi = $request->provinsi;
        $facilitator->kode_pos = $request->kode_pos;
        $facilitator->str_slug = str_slug($request->nama_instansi, '-');
        $facilitator->lat = $request->lat;
        $facilitator->lng = $request->lng;
      
        $facilitator->save();
        return redirect()
        ->back()
        ->withSuccess(sprintf('File %s has been uploaded.', $request->nama_instansi));
      //  return view('admin.profile', ["user" => $user, "facilitator" => $facilitator]);   
    }

    public function verify_facilitator($token, $id){
      $user = User::find($id);
      if ($user->facilitator->token_facilitator != $token) {
          return redirect('user/'.$user->username)->with('warning', 'token not match');
      }

      $user->role = 2;
      $user->save();
      return redirect('setting/dashboard');
     }

    
}
