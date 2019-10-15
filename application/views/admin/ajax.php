<?php if($this->uri->segment(1) == "dashboard"): ?>
<script>
    $(document).ready(function(){
        $('#table_peminjaman').dataTable({
            ajax:           '<?php echo site_url('dashboard/table_peminjaman') ?>',
            scrollY:        400,
            deferRender:    true,
            scroller:       true,
            searching:      true,
            info:           false,
        });
    });
</script>
<?php endif; ?>