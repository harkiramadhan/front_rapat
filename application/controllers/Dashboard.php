<?php 
class Dashboard extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->load->model('M_User');
        $this->load->model('M_Peminjaman');
        if($this->session->userdata('masuk') != TRUE){
            $url = base_url();
            redirect($url);
        }
    }

    function index(){
        $role = $this->session->userdata('role');
        $data['username'] = $this->session->userdata('username');
        
        // Cek User Role Admin
        if($role == 1){
            $data['jum_user']       = $this->M_User->get_userPeminjaman()->num_rows();
            $data['jum_peminjaman'] = 10;
            $data['jum_disetujui']  = 10;
            $data['jum_ditolak']    = 10;
            $data['jum_pending']    = 10;

            $this->load->view('admin/header', $data);
            $this->load->view('admin/dashboard', $data);
            $this->load->view('admin/footer');
        }
        // Cek User Role BAAK
        elseif($role == 2){

        }
        // Cek User Role Kemahasiswaan
        elseif($role == 3){

        }
        // Cek User Role UPT
        elseif($role == 4){
            
        }
    }

    function table_peminjaman(){
        $role = $this->session->userdata('role');
        if($role == 1){
            $draw = intval($this->input->get("draw"));
            $start = intval($this->input->get("start"));
            $length = intval($this->input->get("length"));

            $get = $this->M_Peminjaman->get_All();

            $data   = array();
            $no     = 1;

            foreach($get->result() as $row){
                $data[] = [
                    $no++,
                    $row->username,
                    $row->tanggal,
                    "$row->mulai - $row->selesai",
                    $row->kode,
                    $row->keperluan,
                    $row->kontak,
                    $row->status
                ];
            }

            $output = [
                "draw"              => $draw,
                "recordsTotal"      => $get->num_rows(),
                "recordsFiltered"   => $get->num_rows(),
                "data"              => $data
            ];

            echo json_encode($output);
            exit();
        }
    }
}