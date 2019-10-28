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
            $data['jum_peminjaman'] = 10;
            $data['jum_disetujui']  = 10;
            $data['jum_ditolak']    = 10;
            $data['jum_pending']    = 10;

            $this->load->view('baak/header', $data);
            $this->load->view('baak/dashboard', $data);
            $this->load->view('baak/footer');
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

        $draw = intval($this->input->get("draw"));
        $start = intval($this->input->get("start"));
        $length = intval($this->input->get("length"));

        $get = $this->M_Peminjaman->get_All();

        $data   = array();
        $no     = 1;
        $url    = site_url('dashboard/modal');

        foreach($get->result() as $row){
            if($role == 1){
            $btn = "
                <button onclick='hapus{$row->id}()' class='btn btn-sm btn-danger'><i class='fas fa-trash'></i>&nbsp;Hapus</button>

                <script>
                function hapus{$row->id}(){
                    var id = {$row->id};
                    var jenis = 'delete';
                    $.ajax({
                    url: '{$url}',
                    type: 'post',
                    data: {id : id, jenis : jenis},
                    success: function(response){ 
                        $('#hapus').modal('show'); 
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
                "$row->mulai - $row->selesai",
                $row->kode,
                $row->keperluan,
                $row->keterangan,
                $row->kontak,
                $row->status,
                $btn
            ];
            }else{
                $data[] = [
                    $no++,
                    $row->username,
                    $row->tanggal,
                    "$row->mulai - $row->selesai",
                    $row->kode,
                    $row->keperluan,
                    $row->keterangan,
                    $row->kontak,
                    $row->status
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

    function modal(){
        $jenis = $this->input->post('jenis', TRUE);
        $id = $this->input->post('id', TRUE);
        $role = $this->session->userdata('role');

        if($jenis == "delete" && $role == 1){

        $peminjaman = $this->db->get_where('peminjaman_ruang', ['id'=>$id])->row();
        ?>
        <form>
        <div class="modal-content bg-gradient-danger">
            <div class="modal-header">
                <h6 class="modal-title" id="modal-title-notification">Hapus Peminjaman</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="py-3 text-center">
                    <i class="ni ni-bell-55 ni-3x"></i>
                    <p>Apakah Anda Yakin Menghapus Peminjaman ?</p>
                    <input type="hidden" id="id" name="id" value="<?= $id ?>">
                </div>  
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-link text-white ml-auto" data-dismiss="modal">Batal</button>
                <button type="button" class="btn hapus btn-sm btn-white" data-dismiss="modal">Hapus</button>
            </div>
        </div>
        </form>
        <script>
			$(document).ready(function(){
				$('.hapus').click(function(){
                var id = $('#id').val();
                var jenis = 'hapus';
				$.ajax({
					url: '<?= site_url('dashboard/action') ?>',
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
    }

    function action(){
        $role = $this->session->userdata('role');
        $jenis = $this->input->post('jenis', TRUE);
        $id = $this->input->post('id', TRUE);

        if($role == 1){
            $this->db->where('id', $id);
            $this->db->delete('peminjaman_ruang');

            if($this->db->affected_rows() > 0){
                echo "Peminjaman Berhasil Di Hapus";
            }else{
                echo "Peminjaman Gagal Di Hapus";
            }
        }
    }
}