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
                                        <th scope="col" width="5px">No</th>
                                        <th scope="col">Username</th>
                                        <th scope="col">Role</th>
                                        <th scope="col">Status</th>
                                        <th scope="col" class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="myTable">
                                    <?php 
                                    $no =1;
                                    foreach($list_user as $row){ ?>
                                    <tr>
                                        <td scope="row" width="5px"><?= $no++ ?></td>
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

        <div class="modal fade" id="tambah" tabindex="-1" role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <div class="col-xl-12 text-center">
                        <h3 class="modal-title" id="modal-title-notification"><strong>Tambah User</strong></h3>
                    </div>
                </div>
                <form action="<?= site_url('user/action') ?>" method="post">
                <div class="modal-body bg-secondary">
                    <div class="row">
                        <div class="col-xl-6">
                            <div class="form-group">
                                <label>Username</label>
                                <input class="form-control form-control-sm form-control-alternative" name="username" placeholder="Username" type="text" required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input class="form-control form-control-sm form-control-alternative" name="password" type="password" required>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="form-group">
                                <label>Role</label>
                                <select class="form-control-alternative form-control form-control-sm" name="id_role" required>
                                    <option value="" selected>- Pilih Role -</option>
                                    <option value="" disabled></option>
                                    <?php foreach($role as $r){ ?>
                                        <option value="<?= $r->id ?>"><?= $r->role ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select class="form-control-alternative form-control form-control-sm" name="status">
                                    <option value="" selected>- Pilih Status -</option>
                                    <option value="" disabled></option>
                                    <option value="active">Aktif</option>
                                    <option value="">Non Aktif</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="jenis" value="create">
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-warning" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-sm btn-success">Simpan</button>
                </div>
                </div>
                </form>
            </div>
        </div>