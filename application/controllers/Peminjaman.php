<?php
class Peminjaman extends CI_Controller{
    function __construct(){
        parent::__construct();
        $this->load->model('M_Peminjaman');
        $this->load->model('M_Jam');
        $this->load->model('M_Ruang');
        if($this->session->userdata('masuk') != TRUE){
            $url = base_url('');
            redirect($url);
        }
    }

    function index(){
        $role = $this->session->userdata('role');
        $data['username'] = $this->session->userdata('username');
        $data['jam'] = $this->M_Jam->get_Alljam()->result();
        $data['ruang'] = $this->M_Ruang->get_Allruang()->result();
        
        if($this->input->get('date', TRUE) == TRUE){
            $data['tanggal'] = $this->input->get('date', TRUE);
        }else{
            $data['tanggal'] = date('Y-m-d');
        }

        $data['awal'] = $this->db->get_where('peminjaman_ruang', ['tanggal'=>$data['tanggal']])->result();
        $data['akhir'] = $this->db->get_where('peminjaman_ruang', ['tanggal'=>$data['tanggal']])->result();

        // Jika BAAK
        if($role == 2){
            $this->load->view('baak/header', $data);
            $this->load->view('baak/peminjaman', $data);
            $this->load->view('baak/footer');
        }elseif($role == 3){
            $this->load->view('kms/header', $data);
            $this->load->view('kms/peminjaman', $data);
            $this->load->view('kms/footer');
        }elseif($role == 4){
            $this->load->view('upt/header', $data);
            $this->load->view('upt/peminjaman', $data);
            $this->load->view('upt/footer');
        }elseif($role == "mahasiswa"){
            $data['ruang'] = $this->M_Ruang->get_Allruang()->result();
            $data['jam'] = $this->M_Jam->get_Alljam()->result();
            $this->load->view('mhs/header', $data);
            $this->load->view('mhs/peminjaman', $data);
            $this->load->view('mhs/footer');
        }
    }

    function table(){
        $role = $this->session->userdata('role');

        $draw = intval($this->input->get("draw"));
        $start = intval($this->input->get("start"));
        $length = intval($this->input->get("length"));

        if($role == 2){
            $get = $this->M_Peminjaman->get_baaknoaction();
        }elseif($role == 3){
            $get = $this->M_Peminjaman->get_kmsnoaction();
        }elseif($role == 4){
            $get = $this->M_Peminjaman->get_uptnoaction();
        }

        $data = array();
        $no = 1;
        $url = site_url('peminjaman/modal');

        foreach($get->result() as $row){
                $btn = "
                <button onclick='decline{$row->id}()' class='btn btn-sm btn-danger'>Decline</button>
                <button onclick='acc{$row->id}()' class='btn btn-sm btn-primary'>Accept</button>
                
                <script>
                function decline{$row->id}(){
                    var id = {$row->id};
                    var jenis = 'decline';
                    $.ajax({
                    url: '{$url}',
                    type: 'post',
                    data: {id : id, jenis : jenis},
                    success: function(response){ 
                        $('#decline').modal('show'); 
                        $('.isi').html(response);
                    }
                    });
                }

                function acc{$row->id}(){
                    var id = {$row->id};
                    var jenis = 'acc';
                    $.ajax({
                    url: '{$url}',
                    type: 'post',
                    data: {id : id, jenis : jenis},
                    success: function(response){ 
                        $('#acc').modal('show'); 
                        $('.isi').html(response);
                    }
                    });
                }
                </script>
                ";
                $data[] = [
                    $no++,
                    $row->username,
                    $row->tanggal,
                    $row->kode,
                    "$row->mulai - $row->selesai",
                    $row->keperluan,
                    $row->kontak,
                    $row->status_baak,
                    $btn
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

    function modal(){
        $role = $this->session->userdata('role');
        $id = $this->input->post('id', TRUE);
        $jenis = $this->input->post('jenis', TRUE);
        $peminjaman = $this->M_Peminjaman->get_selected($id)->row();
            ?>
                <form>
                    <div class="modal-content <?php if($jenis == "decline"){echo "bg-gradient-danger";}else{echo "bg-gradient-success";} ?>">
                        <div class="modal-header">
                            <h4 class="modal-title" id="modal-title-notification"><?php if($jenis == "decline"){echo "Decline";}else{echo "Accept";} ?> Peminjaman</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="text-center">
                                <i class="ni ni-bell-55 ni-3x"></i>
                                <div class="col-xl-12">
                                    <tr>
                                        <th>Peminjaman Oleh</th>
                                        <th>: <?= $peminjaman->username ?></th>
                                    </tr><br>
                                    <tr>
                                        <th>Pada Tanggal</th>
                                        <th>: <?= $peminjaman->tanggal ?></th>
                                    </tr><br>
                                    <tr>
                                        <th>Ruang</th>
                                        <th>: <?= $peminjaman->kode ?></th>
                                    </tr><br>
                                    <tr>
                                        <th>Jam</th>
                                        <th>: <?= $peminjaman->mulai ?> - <?= $peminjaman->selesai ?></th>
                                    </tr><br>
                                    <tr>
                                        <th>Keperluan</th>
                                        <th>: <?= $peminjaman->keperluan ?></th>
                                    </tr>
                                </div>
                                <input type="hidden" id="id" name="id" value="<?= $id ?>">
                            </div>  
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-sm btn-link text-white ml-auto" data-dismiss="modal">Batal</button>
                            <button type="button" class="btn <?= $jenis ?> btn-sm btn-white" data-dismiss="modal"><?php if($jenis == "decline"){echo "Decline";}else{echo "Accept";} ?></button>
                        </div>
                    </div>
                </form>
                <script>
                    $(document).ready(function(){
                        $('.<?= $jenis ?>').click(function(){
                        var id = $('#id').val();
                        var jenis = '<?= $jenis ?>';
                        $.ajax({
                            url: '<?= site_url('peminjaman/action') ?>',
                            type: 'post',
                            data: {id : id, jenis : jenis},
                            success: function(data){ 
                                alert(data);
                                $('#table_peminjaman').DataTable().ajax.reload();
                            }
                        });
                        });
                    });
                </script>
            <?php
    }

    function action(){
        $role = $this->session->userdata('role');
        $id = $this->input->post('id', TRUE);
        $jenis = $this->input->post('jenis', TRUE);

        if($role == 2){
            if($jenis == "decline"){
                $data = [
                    'status_baak' => "decliled"
                ];
                $this->db->where('id', $id);
                $this->db->update('peminjaman_ruang', $data);

                if($this->db->affected_rows() > 0){
                    echo "Peminjaman Berhasil Di Decline";
                }else{
                    echo "Peminjaman Gagal Di Decline";
                }

            }elseif($jenis == "acc"){
                $data = [
                    'status_baak' => "accepted"
                ];
                $this->db->where('id', $id);
                $this->db->update('peminjaman_ruang', $data);

                if($this->db->affected_rows() > 0){
                    echo "Peminjaman Berhasil Di Accept";
                }else{
                    echo "Peminjaman Gagal Di Accept";
                }
            } 
        }elseif($role == 3 || $role == 4){
            if($jenis == "decline"){
                $data = [
                    'status' => "declined",
                    'status_baak' => "declined"
                ];

                $this->db->where('id', $id);
                $this->db->update('peminjaman_ruang', $data);

                if($this->db->affected_rows() > 0){
                    echo "Peminjaman Berhasil Di Decline";
                }else{
                    echo "Peminjaman Gagal Di Decline";
                }
            }else{
                $data = [
                    'status' => "accepted",
                    'status_baak' => "pending"
                ];

                $this->db->where('id', $id);
                $this->db->update('peminjaman_ruang', $data);

                if($this->db->affected_rows() > 0){
                    echo "Peminjaman Berhasil Di Accept";
                }else{
                    echo "Peminjaman Gagal Di Accept";
                }
            }
        }elseif($role == "mahasiswa"){
            if($jenis == "ajukan"){
                $idmhs = $this->session->userdata('idmhs');
                $idruang = explode("_", $this->input->post('id_ruang', TRUE));
                $ruang = $idruang[0];
                if($idruang[1] != "Lab Komputer"){
                    $keterangan = "kemahasiswaan";
                }else{
                    $keterangan = "upt";
                }

                $data = [
                    'peminjam' => $idmhs,
                    'tanggal' => $this->input->post('tanggal', TRUE),
                    'id_ruang' => $ruang,
                    'keterangan' => $keterangan,
                    'jam_awal'  => $this->input->post('jam_awal', TRUE),
                    'jam_akhir' => $this->input->post('jam_akhir', TRUE),
                    'kontak' => $this->input->post('kontak', TRUE),
                    'keperluan' => $this->input->post('keperluan', TRUE),
                    'status' => "pending",
                    'status_baak' => "pending"
                ];
                $this->db->insert('peminjaman_ruang', $data);
                redirect($_SERVER['HTTP_REFERER']);
            }
        }
    }
}