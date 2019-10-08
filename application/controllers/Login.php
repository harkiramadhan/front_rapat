<?php 
class Login extends CI_Controller{
    function __construct(){
        parent::__construct();
    }

    function index(){
        $this->load->view('login');
    }

    // Fungsi Autentikasi Login Admin / UPT / KMS 
    function auth(){
        $username   = $this->input->post('username', TRUE);
        $password   = md5($this->input->post('password', TRUE));

        echo $username;
        echo $password;
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