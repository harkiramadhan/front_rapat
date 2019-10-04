<?php
class M_Ruang extends CI_Model{
    function get_Alljenisruang(){
        $this->db->select('*');
        $this->db->from('jenis_ruang');
        return $this->db->get();
    }
}