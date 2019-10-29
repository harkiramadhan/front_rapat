<?php
class History extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->load->model('M_Peminjaman');
        if($this->session->userdata('masuk') != TRUE){
            $url = base_url();
            redirect($url);
        }
    }

    function index(){
        $role = $this->session->userdata('role');
        $data['username'] = $this->session->userdata('username');

        // Cek Role BAAK 
        if($role == 2){
            $this->load->view('baak/header', $data);
            $this->load->view('baak/history', $data);
            $this->load->view('baak/footer');
        }elseif($role == 3){
            $this->load->view('kms/header', $data);
            $this->load->view('kms/history', $data);
            $this->load->view('kms/footer');
        }elseif($role == 4){
            $this->load->view('upt/header', $data);
            $this->load->view('upt/history', $data);
            $this->load->view('upt/footer');
        }
    }

    function table(){
        $role = $this->session->userdata('role');

        $draw = intval($this->input->get("draw"));
        $start = intval($this->input->get("start"));
        $length = intval($this->input->get("length"));

        if($role == 2){
            $get = $this->M_Peminjaman->get_baakhistory();
        }elseif($role == 3){
            $get = $this->M_Peminjaman->get_kmshistory();
        }elseif($role == 4){
            $get = $this->M_Peminjaman->get_upthistory();
        }elseif($role == "mahasiswa"){
            $idmhs = $this->session->userdata('idmhs');
            $get = $this->M_Peminjaman->get_peminjamanmahasiswa($idmhs);
        }
        

        $data = array();
        $no = 1;

        foreach($get->result() as $row){

            if($role == 2){
                if($row->status_baak == "accepted"){
                    $status = "<span class='badge badge-dot mr-4'>
                                    <i class='bg-success'></i>
                                    <span class='status'>Accepted</span>
                                </span>";
                }else{
                    $status = "<span class='badge badge-dot mr-4'>
                                    <i class='bg-danger'></i>
                                    <span class='status'>Declined</span>
                                </span>";
                }
            }elseif($role == 3){
                if($row->status == "accepted"){
                    $status = "<span class='badge badge-dot mr-4'>
                                    <i class='bg-success'></i>
                                    <span class='status'>Accepted</span>
                                </span>";
                }else{
                    $status = "<span class='badge badge-dot mr-4'>
                                    <i class='bg-danger'></i>
                                    <span class='status'>Declined</span>
                                </span>";
                }
            }elseif($role == 4){
                if($row->status == "accepted"){
                    $status = "<span class='badge badge-dot mr-4'>
                                    <i class='bg-success'></i>
                                    <span class='status'>Accepted</span>
                                </span>";
                }else{
                    $status = "<span class='badge badge-dot mr-4'>
                                    <i class='bg-danger'></i>
                                    <span class='status'>Declined</span>
                                </span>";
                }
            }elseif($role == "mahasiswa"){
                if($row->status == "accepted"){
                    $status = "<span class='badge badge-dot mr-4'>
                                    <i class='bg-success'></i>
                                    <span class='status text-capitalize'>Accepted $row->keterangan</span>
                                </span>";
                }elseif($row->status == "declined"){
                    $status = "<span class='badge badge-dot mr-4'>
                                    <i class='bg-danger'></i>
                                    <span class='status text-capitalize'>Declined $row->keterangan</span>
                                </span>";
                }elseif($row->status == "pending"){
                    $status = "<span class='badge badge-dot mr-4'>
                                    <i class='bg-primary'></i>
                                    <span class='status text-capitalize'>Pending $row->keterangan</span>
                                </span>";
                }

                if($row->status_baak == "accepted"){
                    $status_baak = "<span class='badge badge-dot mr-4'>
                                    <i class='bg-success'></i>
                                    <span class='status'>Accepted</span>
                                </span>";
                }elseif($row->status_baak == "declined"){
                    $status_baak = "<span class='badge badge-dot mr-4'>
                                    <i class='bg-danger'></i>
                                    <span class='status'>Declined</span>
                                </span>";
                }elseif($row->status_baak == "pending"){
                    $status_baak = "<span class='badge badge-dot mr-4'>
                                    <i class='bg-primary'></i>
                                    <span class='status text-capitalize'>Pending</span>
                                </span>";
                }
            }
            
            if($role != "mahasiswa"){
                $data[] = [
                    $no++,
                    $row->username,
                    $row->tanggal,
                    $row->kode,
                    "$row->mulai - $row->selesai",
                    $row->keperluan,
                    $row->kontak,
                    $status
                ];
            }else{
                $data[] = [
                    $no++,
                    $row->tanggal,
                    $row->kode,
                    "$row->mulai - $row->selesai",
                    $row->keperluan,
                    $status,
                    $status_baak
                ];
            }
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