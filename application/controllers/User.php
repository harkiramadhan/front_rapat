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
            $data['role']       = $this->db->get('role')->result();

            $this->load->view('admin/header', $data);
            $this->load->view('admin/user');
            $this->load->view('admin/footer');
        }else{
            redirect('login');
        }
    }

    function action(){
        $role = $this->session->userdata('role');

        if($role == 1){
            $jenis = $this->input->post('jenis', TRUE);

            if($jenis == "create"){
                $data = [
                    'username'  => $this->input->post('username', TRUE),
                    'password'  => md5($this->input->post('password', TRUE)),
                    'id_role'   => $this->input->post('id_role', TRUE),
                    'status'    => $this->input->post('status', TRUE),
                ];
                $this->db->insert('user_peminjaman', $data);

                redirect($_SERVER['HTTP_REFERER']);
            }

        }
    }
}