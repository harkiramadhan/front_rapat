<div class="header bg-gradient-default pb-8 pt-5 pt-md-8">
    <div class="container-fluid">
        <div class="header-body">
            </div>
    </div>
</div>
<div class="container-fluid mt--8">
    <!-- Table -->
    <div class="row">
        <div class="col">
            <div class="card shadow">
                <div class="card-header bg-white border-0">
                    <div class="row align-items-center">
                        <div class="col-lg-10">
                            <h3 class="mb-0">Data Peminjaman</h3>
                        </div>
                        <div class="col-lg-2">
                            <button class="btn btn-sm btn-success btn-block" data-toggle="modal" data-target="#tambah">Ajukan Peminjaman</button>
                        </div> 
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table align-items-center table-sm table-flush" id="table_peminjaman">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col">No</th>
                                <th scope="col">Tanggal</th>
                                <th scope="col">Ruangan</th>
                                <th scope="col">Jam</th>
                                <th scope="col">Keperluan</th>
                                <th scope="col">Status</th>
                                <th scope="col">Status BAAK</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="tambah" tabindex="-1" role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-secondary">
                <h3 class="modal-title" id="exampleModalLabel">Tambah Peminjaman</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?= site_url('peminjaman/action') ?>" method="post">
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label>Nama Ruang</label>
                            <select class="form-control form-control-alternative form-control-sm" name="id_ruang">
                                <option value="">- Pilih Ruang -</option>
                                <?php foreach($ruang as $r){ ?>
                                    <option value="<?= $r->id ."_". $r->nama ?>"><?= $r->kode ."&nbsp; - &nbsp;". $r->nama ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Tanggal</label>
                            <input type="date" class="form-control-sm form-control-alternative form-control" name="tanggal" >
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Jam Mulai</label>
                                    <select class="form-control form-control-alternative form-control-sm" name="jam_awal">
                                        <option value="">- Pilih Jam Mulai -</option>
                                        <?php foreach($jam as $jm){ ?>
                                            <option value="<?= $jm->id ?>"><?= $jm->mulai ." - ". $jm->akhir?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label>Jam Selesai</label>
                                    <select class="form-control form-control-alternative form-control-sm" name="jam_akhir">
                                        <option value="">- Pilih Jam Selesai -</option>
                                        <?php foreach($jam as $j){ ?>
                                            <option value="<?= $j->id ?>"><?= $j->mulai ." - ". $j->akhir?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label>Keperluan</label>
                            <textarea name="keperluan" id="" cols="10" rows="5" class="form-control form-control-alternative form-control-sm"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Kontak</label>
                            <input type="text" class="form-control form-control-alternative form-control-sm" name="kontak">
                        </div>
                    </div>
                </div>
                <input type="hidden" name="jenis" value="ajukan">
            </div>
            <div class="modal-footer bg-secondary">
                <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Batal</button>
                <button type="submit" class="btn btn-sm btn-primary">Simpan</button>
            </div>
            </form>
        </div>
    </div>
</div>