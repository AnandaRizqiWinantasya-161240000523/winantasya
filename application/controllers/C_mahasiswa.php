<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
class C_mahasiswa extends CI_Controller
{
	
	public function index ()
	{
		$data['mahasiswa'] = $this->M_mhs->ambilmhs();
		$this->load->view('V_mhs',$data);
	}

	public function tambahmhs()
	{
		$this->load->view('tambah_mhs');

	}

	public function editmhs($id)
	{
		$data['mahasiswa'] = $this->M_mhs->editambilmhs($id);
		$this->load->view('edit_mhs',$data);	

	}
}
