<?php
class M_Ruang extends CI_Model{
    function get_Alljenisruang(){
        $this->db->select('*');
        $this->db->from('jenis_ruang');
        return $this->db->get();
    }

    function get_Allruang(){
        $this->db->select('ruang.*, jenis_ruang.nama');
        $this->db->from('ruang');
        $this->db->join('jenis_ruang', 'ruang.jenis_ruang_id = jenis_ruang.id');
        return $this->db->get();
    }
}