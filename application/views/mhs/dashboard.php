<div class="header bg-gradient-default pb-8 pt-5 pt-md-8">
    <div class="container-fluid">
        <div class="header-body">
            </div>
    </div>
</div>
<!-- Page content -->
<div class="container-fluid mt--9">
    <div class="row">
        <div class="col">
            <div class="card shadow">
                <div class="card-header bg-secondary border-0">
                    <div class="row align-items-center">
                        <div class="col-lg-8 mt-sm-3 mt-lg-0">
                            <h3 class="mb-0">Peminjaman Ruang &nbsp;<?= longdate_indo($tanggal) ?></h3>
                        </div>
                        <div class="col-lg-2 mt-sm-3 mt-lg-0">
                            <form action="" method="get">
                                <input type="date" class="form-control-alternative form-control form-control-sm" name="date" value="<?= $this->input->get('date', TRUE) ?>">
                        </div>
                        <div class="col-lg-1 mt-sm-3 mt-lg-0 text-right pr-0 pl-2">
                                <button type="submit" class="btn btn-sm btn-default btn-block">Cari</button>
                            </form>
                        </div>
                        <div class="col-lg-1 mt-sm-3 mt-lg-0 text-right pr-0 pl-2">
                            <form action="" method="get">
                                <button type="submit" class="btn btn-sm btn-success btn-block">Reset</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table align-items-center table-sm table-flush table-hover">
                            <thead>
                                <tr class="bg-default text-white">
                                    <th>Ruang</th>
                                    <?php foreach($jam as $j){ ?>
                                        <th><?= $j->mulai ?> - <?= $j->akhir ?></th>
                                    <?php } ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                foreach($ruang as $r){   
                                ?>
                                <tr>
                                    <th><?= $r->kode ?></th>
                                    <?php foreach($jam as $jm){ ?>
                                        <?php 
                                            $get = $this->db->get_where('peminjaman_ruang', ['jam_awal'=>$jm->id, 'id_ruang'=>$r->id, 'tanggal'=>$tanggal]);
                                            $geta = $this->db->get_where('peminjaman_ruang', ['jam_akhir'=>$jm->id, 'id_ruang'=>$r->id, 'tanggal'=>$tanggal]);
                                        ?>
                                        <?php if($get->num_rows() > 0): ?>
                                        <?php
                                            $awal = $get->row()->jam_awal;
                                            $akhir = $get->row()->jam_akhir;
                                            $span = $akhir - $awal + 1;
                                        ?>
                                            <td colspan="<?= $span ?>" class="text-center"><a class="btn btn-sm btn-block <?php 
                                                if($get->row()->keterangan == "kemahasiswaan"){
                                                    echo "btn-warning ";
                                                }elseif($get->row()->keterangan == "upt"){
                                                    echo "btn-primary ";} ?> text-white"><?= $get->row()->keterangan ?></a>
                                            </td>
                                        <?php else: ?>
                                            <td class="text-center">-</td>
                                        <?php endif; ?>
                                    <?php } ?>
                                </tr>
                                <?php } ?>
                            </tbody>
                            <tfoot>
                                <tr class="bg-default text-white">
                                    <th>Ruang</th>
                                    <?php foreach($jam as $j){ ?>
                                        <th><?= $j->mulai ?> - <?= $j->akhir ?></th>
                                    <?php } ?>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>