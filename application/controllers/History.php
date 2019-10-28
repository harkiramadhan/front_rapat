<?php
class History extends CI_Controller{
    function __construct(){
        parent::__construct();
        if($this->session->userdata('masuk') != TRUE){
            $url = base_url();
            redirect($url);
        }
    }

    function index(){
        $role = $this->session->userdata('role');
        $data['username'] = $this->session->userdata('username');

        // Cek Role BAAK 
        if($role == 2){

            $this->load->view('baak/header', $data);
            $this->load->view('baak/history', $data);
            $this->load->view('baak/footer');
        }
    }

    function table_peminjaman(){
        
    }
}