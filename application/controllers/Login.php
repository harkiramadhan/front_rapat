<?php 
class Login extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->load->model('M_User');
    }

    function index(){
        $this->load->view('login');
    }

    // Fungsi Autentikasi Login Admin / UPT / KMS 
    function auth(){
        $username   = $this->input->post('username', TRUE);
        $password   = md5($this->input->post('password', TRUE));

        $cek        = $this->M_User->cek_user($username, $password);
        
        if($cek->num_rows() > 0){
            $user = $cek->row_array();
            if($user['status'] == "active"){
                    
                $this->session->set_userdata('masuk', TRUE);
                $this->session->set_userdata('role', $user['id_role']);
                $this->session->set_userdata('username', $user['username']);
                redirect('dashboard');

            }else{
                $this->session->set_flashdata('msg',"User Tidak Aktif");
                redirect('login');
            }
        }else{
            $this->session->set_flashdata('msg',"User Tidak Terdaftar");
            redirect('login');
        }
    }

    // Fungsi Logout
    function logout(){
        $this->session->sess_destroy();
        $url=base_url('');
        redirect($url);
    }

    // Fungsi Autentikasi Login Mahasiswa
    function authmahasiswa(){
        $username   = $this->input->post('username', TRUE);
        $password   = $this->input->post('password', TRUE);

        $cek = $this->M_User->cek_usermhs($username, $password);

        if($cek->num_rows() > 0){
            $user = $cek->row_array();
            $this->session->set_userdata('masuk', TRUE);
            $this->session->set_userdata('username', $user['username']);
            $this->session->set_userdata('idmhs', $user['mhsid']);
            $this->session->set_userdata('role','mahasiswa');
            redirect('dashboard');
        }else{
            $this->session->set_flashdata('msg',"Mahasiswa Tidak Terdaftar");
            redirect('login');
        }
    }

    // Fungsi Index Register Mahasiswa
    function register(){
        $this->load->view('register');
    }

    // Fungsi Register Mahasiswa
    function regmahasiswa(){
        $username   = $this->input->post('username', TRUE);
        $password   = md5($this->input->post('password', TRUE));
        $email      = $this->input->post('email', TRUE);
    }
}