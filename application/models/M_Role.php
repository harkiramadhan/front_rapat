<?php
class M_Role extends CI_Model{

    // Get All Role Dari DB
    function get_All(){
        $this->db->select('*');
        $this->db->from('role');
        return $this->db->get();
    }
}