<?php
class User extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->load->model('M_User');
        if($this->session->userdata('masuk') != TRUE){
            $url = base_url('');
            redirect($url);
        }
    }

    function index(){
        $role = $this->session->userdata('role');

        if($role == 1){
            $data['username']   = $this->session->userdata('username');
            $data['list_user']  = $this->M_User->get_userPeminjaman()->result();

            $this->load->view('admin/header', $data);
            $this->load->view('admin/user');
            $this->load->view('admin/footer');
        }else{
            redirect('login');
        }
    }
}