<!-- Header -->
<div class="header bg-gradient-default pb-8 pt-5 pt-md-8">
            <div class="container-fluid">
                <div class="header-body">
                </div>
            </div>
        </div>
        <!-- Page content -->
        <div class="container-fluid mt--7">
            <div class="row">
                <div class="col-xl-12 order-xl-1">
                    <!-- Card stats -->
                    <div class="row">
                        <div class="col-xl-3 col-lg-6">
                            <div class="card shadow card-stats mb-4">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase text-muted mb-5">Jumlah <br> Peminjaman Ruang</h5>
                                    <span class="h3 font-weight-bold mb-0"><?= $jum_peminjaman ?> Peminjaman</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6">
                            <div class="card shadow card-stats mb-4">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase text-muted mb-5">Jumlah <br> Peminjaman Disetujui</h5>
                                    <span class="h3 font-weight-bold mb-0"><?= $jum_disetujui ?> Peminjaman</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6">
                            <div class="card shadow card-stats mb-4">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase text-muted mb-5">Jumlah <br> Peminjaman Ditolak</h5>
                                    <span class="h3 font-weight-bold mb-0"><?= $jum_ditolak ?> Peminjaman</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-6">
                            <div class="card shadow card-stats mb-4">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase text-muted mb-5">Jumlah <br> Peminjaman Pending</h5>
                                    <span class="h3 font-weight-bold mb-0"><?= $jum_pending ?> Peminjaman</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-12">
                            <div class="card shadow card-stats mb-5">
                                <div class="table-responsive rounded mt-2" style="max-height: 500px">
                                    <table class="table table-flush" id="table_peminjaman">
                                        <thead class="bg-default text-white">
                                            <tr>
                                                <th width="5px">No</th>
                                                <th class="text-left">Nama Peminjam</th>
                                                <th>Tanggal</th>
                                                <th>Jam</th>
                                                <th>Ruang</th>
                                                <th>Keperluan</th>
                                                <th>Kontak</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="hapus" tabindex="-1" role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
            <div class="modal-dialog modal-danger modal-dialog-centered modal-" role="document">
                <div class="isi">
                
                </div>
            </div>
        </div>