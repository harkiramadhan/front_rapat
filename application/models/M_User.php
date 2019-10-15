<?php
class M_User extends CI_Model{

    // Cek User
    function cek_user($username, $password){
        if($username == "admin"){
            $this->db->select('user_peminjaman.* , user.username');
            $this->db->from('user_peminjaman');
            $this->db->join('user', 'user_peminjaman.id_user = user.id');
            $this->db->where(['user.username'=>$username]);
            return $this->db->get();
        }else{
            $this->db->select('user.username , user_peminjaman.*, mahasiswa.nim , pegawai.nik');
            $this->db->from('user');
            $this->db->join('user_peminjaman', 'user_peminjaman.id_user = user.id', 'left');
            $this->db->join('pegawai', 'pegawai.user_id = user.id', 'left');
            $this->db->join('mahasiswa', 'mahasiswa.user_id = user.id', 'left');
            $this->db->where(['user.username'=>$username, 'pegawai.nik'=>$password]);
            $this->db->or_where(['user.username'=>$username,'mahasiswa.nim'=>$password]);
            return $this->db->get();
        }
    }

    // User Aplikasi
    function get_userPeminjaman(){
        $this->db->select('*');
        $this->db->from('user_peminjaman');
        $this->db->join('user', 'user_peminjaman.id_user = user.id');
        $this->db->join('role', 'user_peminjaman.id_role = role.id');
        $this->db->join('pegawai', 'pegawai.user_id = user.id', 'left');
        $this->db->join('mahasiswa', 'mahasiswa.user_id = user.id', 'left');
        return $this->db->get();
    }

    // User General
    function get_Alluser(){
        $this->db->select('*');
        $this->db->from('user');
        return $this->db->get();
    }
}