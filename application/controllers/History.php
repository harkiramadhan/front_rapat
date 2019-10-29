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
        }
    }

    function table(){
        $role = $this->session->userdata('role');

        $draw = intval($this->input->get("draw"));
        $start = intval($this->input->get("start"));
        $length = intval($this->input->get("length"));

        $get = $this->M_Peminjaman->get_baakhistory();

        $data = array();
        $no = 1;

        foreach($get->result() as $row){
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