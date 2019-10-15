<?php
class M_User extends CI_Model{

    // Cek User
    function cek_user($username, $password){
        $this->db->where(['username'=>$username, 'password'=>$password]);
        return $this->db->get('user_peminjaman');
    }

    // User Aplikasi
    function get_userPeminjaman(){
        $this->db->select('*');
        $this->db->from('user_peminjaman');
        return $this->db->get();
    }

    // User Mahasiswa
    function get_userMhs(){
        $this->db->select('*');
        $this->db->from('user_mahasiswa');
        return $this->db->get();
    }

    // User General
    function get_Alluser(){
        $this->db->select('*');
        $this->db->from('user');
        return $this->db->get();
    }
}