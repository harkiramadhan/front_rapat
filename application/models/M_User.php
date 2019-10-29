<?php
class M_User extends CI_Model{

    // Cek User
    function cek_user($username, $password){
        $this->db->select('*');
        $this->db->from('user_peminjaman');
        $this->db->where(['username'=>$username, 'password'=>$password]);
        return $this->db->get();
    }

    // Cek User Mahasiswa
    function cek_usermhs($username, $password){
        $this->db->select('user.username, mahasiswa.nim, mahasiswa.mhsid');
        $this->db->from('mahasiswa');
        $this->db->join('user', 'mahasiswa.user_id = user.id');
        $this->db->where(['mahasiswa.nim'=>$password, 'user.username'=>$username]);
        return $this->db->get();
    }

    // User Aplikasi
    function get_userPeminjaman(){
        $this->db->select('user_peminjaman.*, role.role');
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

    // Create User
    function create(){
        $data = [
            'username'  => $this->input->post('username', TRUE),
            'password'  => md5($this->input->post('password', TRUE)),
            'id_role'   => $this->input->post('id_role', TRUE),
            'status'    => $this->input->post('status', TRUE),
        ];
        return $this->db->insert('user_peminjaman', $data);
    }

    function edit($id){
        if($this->input->post('password') == TRUE){
            $data = [
                'username'  => $this->input->post('username', TRUE),
                'password'  => md5($this->input->post('password', TRUE)),
                'id_role'   => $this->input->post('id_role', TRUE),
                'status'    => $this->input->post('status', TRUE),
            ];
        }else{
            $data = [
                'username'  => $this->input->post('username', TRUE),
                'id_role'   => $this->input->post('id_role', TRUE),
                'status'    => $this->input->post('status', TRUE),
            ];
        }
        $this->db->where('id', $id);
        return $this->db->update('user_peminjaman', $data);
    }

    // Hapus User 
    function delete($id){
        $this->db->where('id', $id);
        return $this->db->delete('user_peminjaman');
    }
}