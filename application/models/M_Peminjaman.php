<?php 
class M_Peminjaman extends CI_Model{
    function get_All(){
        $this->db->select('peminjaman_ruang.*, user.username, j1.mulai as mulai, j2.akhir as selesai, ruang.kode');
        $this->db->from('peminjaman_ruang');
        $this->db->join('user', 'peminjaman_ruang.peminjam = user.id');
        $this->db->join('jamke j1', 'peminjaman_ruang.jam_awal = j1.id');
        $this->db->join('jamke j2', 'peminjaman_ruang.jam_akhir = j2.id');
        $this->db->join('ruang', 'peminjaman_ruang.id_ruang = ruang.id');
        return $this->db->get();
    }

    function get_baaknoaction(){
        $this->db->select('peminjaman_ruang.*, user.username, j1.mulai as mulai, j2.akhir as selesai, ruang.kode');
        $this->db->from('peminjaman_ruang');
        $this->db->join('user', 'peminjaman_ruang.peminjam = user.id');
        $this->db->join('jamke j1', 'peminjaman_ruang.jam_awal = j1.id');
        $this->db->join('jamke j2', 'peminjaman_ruang.jam_akhir = j2.id');
        $this->db->join('ruang', 'peminjaman_ruang.id_ruang = ruang.id');
        $this->db->where(['peminjaman_ruang.status_baak'=>"pending", 'peminjaman_ruang.status'=>"accepted"]);
        return $this->db->get();
    }

    function get_baakhistory(){
        $this->db->select('peminjaman_ruang.*, user.username, j1.mulai as mulai, j2.akhir as selesai, ruang.kode');
        $this->db->from('peminjaman_ruang');
        $this->db->join('user', 'peminjaman_ruang.peminjam = user.id');
        $this->db->join('jamke j1', 'peminjaman_ruang.jam_awal = j1.id');
        $this->db->join('jamke j2', 'peminjaman_ruang.jam_akhir = j2.id');
        $this->db->join('ruang', 'peminjaman_ruang.id_ruang = ruang.id');
        $this->db->where(['peminjaman_ruang.status_baak !='=>"pending", 'peminjaman_ruang.status'=>"accepted"]);
        return $this->db->get();
    }

    function get_selected($id){
        $this->db->select('peminjaman_ruang.*, user.username, j1.mulai as mulai, j2.akhir as selesai, ruang.kode');
        $this->db->from('peminjaman_ruang');
        $this->db->join('user', 'peminjaman_ruang.peminjam = user.id');
        $this->db->join('jamke j1', 'peminjaman_ruang.jam_awal = j1.id');
        $this->db->join('jamke j2', 'peminjaman_ruang.jam_akhir = j2.id');
        $this->db->join('ruang', 'peminjaman_ruang.id_ruang = ruang.id');
        $this->db->where('peminjaman_ruang.id', $id);
        return $this->db->get();
    }
}