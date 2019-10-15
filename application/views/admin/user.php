<!-- Header -->
<div class="header bg-gradient-default pb-8 pt-5 pt-md-8">
            <div class="container-fluid">
                <div class="header-body">
                </div>
            </div>
        </div>
        <!-- Page content -->
        <div class="container-fluid mt--8">
            <!-- Table -->
            <div class="row">
                <div class="col">
                    <div class="card shadow">
                        <div class="card-header bg-white border-0">
                            <div class="row align-items-center">
                                <div class="col-lg-7">
                                    <h3 class="mb-0">Data User</h3>
                                </div>

                                <div class="col-lg-3 text-right">
                                    <input type="text" id="myInput" placeholder="Cari User ..." class="form-control form-control-alternative form-control-sm">
                                </div>
                                <div class="col-lg-2">
                                    <button class="btn btn-sm btn-primary mt-sm-2" data-toggle="modal" data-target="#tambah">Tambah User</button>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table align-items-center table-flush">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">NIK</th>
                                        <th scope="col">NAMA LENGKAP</th>
                                        <th scope="col">ROLE</th>
                                        <th scope="col">STATUS</th>
                                        <th scope="col" class="text-center">ACTION</th>
                                    </tr>
                                </thead>
                                <tbody id="myTable">
                                    <?php 
                                    $no =1;
                                    foreach($list_user as $row){ ?>
                                    <tr>
                                        <td scope="row"><?= $no++ ?></td>
                                        <td scope="row"><?php if($row->role == "Admin"){echo "Admin";}else{echo $row->nik;} ?></td>
                                        <td scope="row"><?= $row->username ?></td>
                                        <td scope="row"><?= $row->role ?></td>
                                        <td scope="row"><?= $row->status ?></td>
                                        <td scope="row" class="text-center">
                                            <button type="button" class="btn btn-sm btn-secondary">Edit</button>
                                            <button type="button" class="btn btn-sm btn-danger">Hapus</button>
                                        </td>
                                    </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>