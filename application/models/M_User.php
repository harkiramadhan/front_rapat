<?php
class M_User extends CI_Model{

    // Cek User
    function cek_user($username, $password){
        $this->db->select('*');
        $this->db->from('user_peminjaman');
        $this->db->where(['username'=>$username, 'password'=>$password]);
        return $this->db->get();
    }

    // User Aplikasi
    function get_userPeminjaman(){
        $this->db->select('*');
        $this->db->from('user_peminjaman');
        $this->db->join('role', 'user_peminjaman.id_role = role.id');
        return $this->db->get();
    }

    // User General
    function get_Alluser(){
        $this->db->select('*');
        $this->db->from('user');
        return $this->db->get();
    }
}