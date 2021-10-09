<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Item Detail</title>

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
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Item Detail</h1>
                    </div>
                    <div class="col-sm-6">
                        <a class="btn btn-outline-info btn-sm float-right" href="#" id="btn-edit">
                            <i class="fas fa-pencil-alt"></i>
                            Edit
                        </a>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="card card-solid">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 col-sm-6">
                            <div class="col-12">
                                <img src="" id="itemImage" alt="Product Image" style="width: 80%;">
                            </div>
                        </div>
                        <div class="col-12 col-sm-6">
                            <h3 class="my-3" id="itemName"> 상품 이름 </h3>
                            <h6 id="itemCategory" style="opacity: .4"> 상품 카테고리 </h6>
                            <br>
                            <pre id="itemShortDesc"> 상품 소개 요약 </pre>
                            <hr>
                            <select class="form-control itemOption" required>
                                <option value=null selected hidden>color</option>
                                <option>RED</option>
                                <option>BLUE</option>
                                <option>GREEN</option>
                                <option>YELLOW</option>
                                <option>PINK</option>
                                <option>BALCK</option>
                                <option>NAVY</option>
                                <option>GRAY</option>
                                </optgroup>
                            </select>
                            <select class="form-control itemOption" required>
                                <option value=null selected hidden>size</option>
                                <option>S</option>
                                <option>M</option>
                                <option>L</option>
                                <option>XL</option>
                                <option>XXL</option>
                            </select>
                            <hr>
                            <label for="itemQty">수량 : </label>
                            <input type="number" id="itemQty" value="1" min="0" style="width: 50px">

                            <div class="bg-gray py-2 px-3 mt-4">
                                <h2 class="mb-0" id="itemPrice"> </h2>
                                <h6 class="mt-0">
                                    배송료: <small id="itemShippingCost">0</small> (원)
                                </h6>
                            </div>

                            <div class="mt-4">
                                <a class="btn btn-primary btn-lg btn-flat" id="btn-buyNow">
                                    <i class="fas fa-money-bill fa-lg mr-2"></i>
                                    Buy Now
                                </a>
                            </div>

                        </div>
                    </div>
                    <div class="row mt-4">
                        <nav class="w-100">
                            <div class="nav nav-tabs" id="product-tab" role="tablist">
                                <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab"
                                   href="#itemLongDesc" role="tab" aria-controls="product-desc" aria-selected="true">Description</a>
                            </div>
                        </nav>
                        <div class="tab-content p-3" id="nav-tabContent">
                            <pre class="tab-pane fade show active" id="itemLongDesc" role="tabpanel"
                                 aria-labelledby="product-desc-tab"> 상품 소개 메인
                            </pre>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <div class="float-right d-none d-sm-block">
            <b>Version</b> 3.1.0
        </div>
        <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
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
<!-- Bootstrap -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE -->
<script src="/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/js/demo.js"></script>
<!-- Custom js -->
<script src="/js/custom.js"></script>
<script>
    $(function () {
        const urlParams = new URLSearchParams(window.location.search);
        const id = urlParams.get('id');
        let itemPrice;
        let orderData;
        $.ajax({
            method: 'GET',
            url: '/api/item/' + id,
            dataType: 'json',
            success: function (data) {
                orderData = data
                $('#itemImage').attr('src',data['imgURL']);
                $('#itemName').text(data['name']);
                $('#itemCategory').text(data['category']);
                $('#itemShortDesc').text(data['shortDesc']);
                $('#itemLongDesc').text(data['longDesc']);
                $('#itemPrice').text(data['price'].toLocaleString() + "원");
                itemPrice = data['price'];
            },
            error: function (e) {
                console.log(e.responseText);
            }
        });
        $('#btn-edit').attr("href", '/item/edit?id=' + id);

        $('#btn-buyNow').on('click', function() {
            let selectObjsIdx = 0;
            $('.itemOption').each(function(idx, obj) {
                orderData['option' + (idx+1).toString() + '_value'] = obj.options[obj.selectedIndex].value;
                selectObjsIdx++;
            });
            orderData['qty'] = $('#itemQty').val();
            orderData['shippingCost'] = $('#itemShippingCost').text();
            console.log(orderData);

            let $form = $('<form></form>');
            $form.attr('method', 'POST');
            $form.attr('action', '/orderSheet');
            for(const key in orderData) {
                let field = $('<input>');
                field.attr('type', 'hidden');
                field.attr('name', key);
                field.attr('value', orderData[key])
                $form.append(field);
            }
            $form.appendTo('body').submit();
        });

        $('#itemQty').on('change', function(event) {
            $('#itemPrice').text((itemPrice * this.value).toLocaleString() + "원");
        });
    });
</script>
</body>
</html>