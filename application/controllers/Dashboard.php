<?php 
class Dashboard extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->load->model('M_User');
        if($this->session->userdata('masuk') != TRUE){
            $url = base_url();
            redirect($url);
        }
    }

    function index(){
        $role = $this->session->userdata('role');
        $data['username'] = $this->session->userdata('username');
        
        // Cek User Role Admin
        if($role == 1){
            $data['jum_user']       = $this->M_User->get_userPeminjaman()->num_rows();
            $data['jum_usermhs']    = $this->M_User->get_userMhs()->num_rows();

            $this->load->view('admin/header', $data);
            $this->load->view('admin/dashboard', $data);
            $this->load->view('admin/footer');
        }
        // Cek User Role BAAK
        elseif($role == 2){

        }
        // Cek User Role Kemahasiswaan
        elseif($role == 3){

        }
        // Cek User Role UPT
        elseif($role == 4){
            
        }
    }
}