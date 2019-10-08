<?php
class M_User extends CI_Model{

    function cek_user($username, $password){
        $this->db->where(['username'=>$username, 'password_hash'=>$password]);
        return $this->db->get('user');
    }

    function get_Alluser(){
        $this->db->select('*');
        $this->db->from('user');
        return $this->db->get();
    }
}