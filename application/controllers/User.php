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
            $id = $this->input->post('id', TRUE);

            if($jenis == "create"){
                $create = $this->M_User->create();

                if($create){
                    $this->session->set_flashdata('sukses','User Berhasil Di Buat');
                    redirect($_SERVER['HTTP_REFERER']);
                }else{
                    $this->session->set_flashdata('error','User Gagal Di Buat');
                    redirect($_SERVER['HTTP_REFERER']);
                }

            }elseif($jenis == "delete"){
                $delete = $this->M_User->delete($id);
                if($delete){
                    $this->session->set_flashdata('sukses','User Berhasil Di Hapus');
                    redirect($_SERVER['HTTP_REFERER']);
                }else{
                    $this->session->set_flashdata('error','User Gagal Di Hapus');
                    redirect($_SERVER['HTTP_REFERER']);
                }
            }elseif($jenis == "edit"){
                $edit = $this->M_User->edit($id);
                if($edit){
                    $this->session->set_flashdata('sukses','User Berhasil Di Edit');
                    redirect($_SERVER['HTTP_REFERER']);
                }else{
                    $this->session->set_flashdata('error','User Gagal Di Edit');
                    redirect($_SERVER['HTTP_REFERER']);
                }
            }

        }
    }
}