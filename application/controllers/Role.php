<?php
class Role extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->load->model('M_Role');
        if($this->session->userdata('masuk') != TRUE){
            $url = base_url('');
            redirect($url);
        }
    }

    function index(){
        $role = $this->session->userdata('role');

        if($role == 1){
            $data['username']   = $this->session->userdata('username');
            $data['list_role']  = $this->M_Role->get_All()->result();     

            $this->load->view('admin/header', $data);
            $this->load->view('admin/role', $data);
            $this->load->view('admin/footer');
        }
    }
}