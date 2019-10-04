<?php
class M_Jam extends CI_Model{
    function get_Alljam(){
        $this->db->select('*');
        $this->db->from('jamke');
        return $this->db->get();
    }
}