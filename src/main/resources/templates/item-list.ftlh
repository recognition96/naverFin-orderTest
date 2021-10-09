<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Item list</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/css/adminlte.min.css">
    <!-- Custom style -->
    <link rel="stylesheet" type="text/css" href="/css/custom.css">
</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="/" class="nav-link">Home</a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="/" class="brand-link">
            <img src="/img/AdminLTELogo.png" alt="NAVER Logo" class="brand-image img-circle elevation-3"
                 style="opacity: .8">
            <span class="brand-text font-weight-light" style="color: #51cf66">NAVER FINANCIAL</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3">
                <div class="up_wrapper">
                    <div class="image">
                        <i class="fas fa-address-card fa-2x"></i>
                    </div>
                    <div class="info">
                        <a href="#" class="brand-text">TEST ADMIN</a>
                    </div>
                </div>

                <ul class="row-list">
                    <li>
                        <a href="#" class="info brand-text">
                            Login
                        </a>
                    </li>
                    <li>
                        <a href="#" class="info brand-text">
                            Register
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item">
                        <a href="/" class="nav-link">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Dashboard
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/items" class="nav-link">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                Item list
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>
    <!-- /.main-sidebar-container -->

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Item list</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <table id="projectTable" class="table dataTable projects">
                                    <thead>
                                    <tr>
                                        <th> ID</th>
                                        <th> Image</th>
                                        <th> Name</th>
                                        <th> Category</th>
                                        <th> Price</th>
                                        <th> regDate</th>
                                    </tr>
                                    </thead>
                                    <tbody id="items-tbd">

                                    <!-- Items will be here-->

                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-4"></div>
                                <a class="btn btn-success btn-lg p-1 col-4" href="/item/add">
                                    <i class="fas fa-plus-square" style="margin: 1px"></i> Add item
                                </a>
                                <div class="col-4"></div>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <div class="float-right d-none d-sm-block">
            <b>Version</b> 3.1.0
        </div>
        <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights
        reserved.
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="/js/adminlte.min.js"></script>
<!-- Page specific script -->
<script>
    $(function () {
        const detailUrl = "/item/detail?id="
        $('#projectTable').DataTable({
            "responsive": true,
            "lengthChange": false,
            "autoWidth": false,
            "paging": true,
            "searching": false,
            "ordering": true,
            "info": true,
            "ajax": {
                method: 'GET',
                url: '/api/item-table',
                dataSrc: ''
            },
            "columns": [
                {"data": "id"},
                {"data": "imgURL"},
                {"data": "name"},
                {"data": "category"},
                {"data": "price"},
                {"data": "regDate"},
            ],
            columnDefs: [
                {
                    targets: 1,
                    render: function (targetData, type, row) {
                        return `<a href="${r'${detailUrl}'}${r'${row.id}'}">` +
                            `<img src="${r'${targetData}'}" class="elevation-2" alt="item-image" ` +
                            `style="width: 150px; height: 150px"></a>`
                    }
                },
                {
                    targets: 2,
                    render: function (targetData, type, row) {
                        return `<a href="${r'${detailUrl}'}${r'${row.id}'}"> ${r'${targetData}'} </a>`
                    }
                },
                {
                    targets: 4,
                    render: function (targetData) {
                        return targetData.toLocaleString() + " 원"
                    }
                }
            ]
        });
    });
</script>
</body>
</html>
