<?php
class M_User extends CI_Model{

    // Cek User
    function cek_user($username, $password){
        $this->db->where(['username'=>$username, 'password'=>$password]);
        return $this->db->get('user_peminjaman');
    }

    // User General
    function get_Alluser(){
        $this->db->select('*');
        $this->db->from('user');
        return $this->db->get();
    }
}