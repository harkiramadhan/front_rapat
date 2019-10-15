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
            
            $this->session->set_userdata('masuk', TRUE);
            if($user['role'] == 1){
                $this->session->set_userdata('role', 1);
                $this->session->set_userdata('username', $data['username']);
                
                redirect('dashboard');
                
            }elseif($user['role'] == 2){
                $this->session->set_userdata('role', 2);
                $this->session->set_userdata('username', $data['username']);

                redirect('dashboard');
                
            }elseif($user['role'] == 3){
                $this->session->set_userdata('role', 3);
                $this->session->set_userdata('username', $data['username']);

                redirect('dashboard');
                
            }

        }else{
            $this->session->set_flashdata('msg',"Username Atau Password Salah");
            redirect('login');
        }
    }

    // Fungsi Autentikasi Login Mahasiswa
    function authmahasiswa(){
        $username   = $this->input->post('username', TRUE);
        $password   = md5($this->input->post('password', TRUE));

        echo $username;
        echo $password;
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