<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ClientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $clients = Client::whereNull('deleted_at')->orderBy('created_at', 'desc')->paginate(10);
        return response()->json($clients);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'first_name'    => 'required|string|max:255',
            'last_name'     => 'required|string|max:255',
            'telephone'     => 'required|string|max:15',
            'email_address' => 'required|email|max:255|unique:clients,email_address',
            'id_number'     => 'required|string|max:20|unique:clients,id_number',
            'date_of_birth' => 'required|date',
            'status'        => 'required|in:active,inactive',
        ]);

        $uuid = (string) Str::uuid();

        $client = new Client;
        $client->first_name = $validatedData['first_name'];
        $client->last_name = $validatedData['last_name'];
        $client->telephone = $validatedData['telephone'];
        $client->email_address = $validatedData['email_address'];
        $client->id_number = $validatedData['id_number'];
        $client->date_of_birth = $validatedData['date_of_birth'];
        $client->status = $validatedData['status'];
        $client->uuid = $uuid;
        $client->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $client = DB::table('clients')->where('id', $id)->whereNull('deleted_at')->first();
        return response()->json($client);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = array();
        $data['first_name'] = $request->first_name;
        $data['last_name'] = $request->last_name;
        $data['telephone'] = $request->telephone;
        $data['email_address'] = $request->email_address;
        $data['id_number'] = $request->id_number;
        $data['date_of_birth'] = $request->date_of_birth;
        $data['status'] = $request->status;
        $data['updated_at'] = now();
        $data['uuid'] = $request->uuid;
        $client = DB::table('clients')->where('id', $id)->update($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $client = Client::findOrFail($id);
        $client->delete(); // Soft delete (sets `deleted_at` timestamp)

        return response()->json([
            'message' => 'Client soft-deleted successfully',
            'client' => $client
        ]);
    }
}
