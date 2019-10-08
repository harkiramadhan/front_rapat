<?php
class M_Jam extends CI_Model{
    function get_Alljam(){
        $this->db->select('*');
        $this->db->from('jamke');
        return $this->db->get();
    }

    function get_Hari(){
        $this->db->select('*');
        $this->db->from('hari');
        return $this->db->get();
    }
}