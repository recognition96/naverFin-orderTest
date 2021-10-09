<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Order page</title>

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
                        <h1>Order/Payment</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="callout callout-info">
                            <table id="projectTable" class="table projects">
                                <thead>
                                <tr>
                                    <th class="item-info"> Item info.</th>
                                    <th> Seller</th>
                                    <th> Shipping cost</th>
                                    <th> Qty</th>
                                    <th> Discount</th>
                                    <th> Price</th>
                                </tr>
                                </thead>

                                <tbody id="items-tbd">
                                <tr>
                                    <td>
                                        <div hidden>
                                            <p class="itemInfo" id="id"> ${ orderData.id } </p>
                                            <p class="itemInfo" id="cpId"> ${ orderData.cpId } </p>
                                            <p class="itemInfo" id="itemId"> ${ orderData.itemId } </p>
                                        </div>
                                        <div>
                                            <div class="div-inline">
                                                <a href="#" style="text-align: center">
                                                    <img src="${ orderData.imgURL }" alt="item-image"
                                                         class="elevation-2" style="width: 120px; height: 120px">
                                                </a>
                                            </div>
                                            <div class="div-inline item-desc" style="display: inline-block">
                                                <h5 class="itemInfo" id=title> ${ orderData.name } </h5>
                                                <small class="itemInfo" id="option1_value"> ${ orderData.option1_value } </small> /
                                                <small class="itemInfo" id="option2_value"> ${ orderData.option2_value } </small>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="itemInfo" id="seller"> NAVER FINANCIAL</td>
                                    <td class="itemInfo" id="ship-price"> ${ orderData.shippingCost } </td>
                                    <td class="itemInfo" id="qty"> ${ orderData.qty } </td>
                                    <td class="itemInfo" id="discount">0</td>
                                    <td class="itemInfo" id="amount"> ${ orderData.qty * orderData.price } </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>


                        <!-- Main content -->
                        <div class="invoice p-3 mb-3">
                            <!-- title row -->
                            <div class="row">
                                <div class="col-12">
                                    <h4>
                                        <i class="fas fa-globe">&nbsp</i>Delivery Info.
                                    </h4>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- info row -->
                            <div class="row delivery-info">
                                <div class="col-sm-2 invoice-col">
                                    <label for="receiver" class="deliver-wrapper"> 수령인 </label>
                                    <label for="phone" class="deliver-wrapper"> 연락처 </label>
                                    <label for="address" class="deliver-wrapper"> 배송지 주소 </label>
                                    <label for="address" class="deliver-wrapper"> 배송메모 </label>

                                </div>
                                <div class="col-sm-5 invoice-col">
                                    <form id="form-deli-info">
                                        <input type="text" class="deliver-wrapper" id="receiver" name="receiver"
                                               required>
                                        <input type="tel" class="deliver-wrapper" id="phone" name="phone"
                                               pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
                                               required>
                                        <input type="text" class="deliver-wrapper" id="address" name="address" required>
                                        <input type="text" class="deliver-wrapper" id="memo" name="memo"
                                               placeholder="부재시 경비실에 맡겨주세요.">

                                    </form>
                                </div>

                                <div class="col-sm-4">
                                    <div class="orderer-info">
                                        <strong class="customer-title">주문자 정보</strong>
                                        <p>Name</p>
                                        <p>Phone</p>
                                        <p>sample@naver.com</p>
                                    </div>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                            <hr>
                            <div class="row">
                                <!-- accepted payment column -->
                                <div class="col-6">
                                    <h4>Payment Methods:</h4>
                                    <form id="form-pay-type">
                                        <div class="pay-method-radio div-inline">
                                            <input type="radio" name="pay-method" id="pay-by-account" value="OBANK"/>
                                            <label for="pay-by-account" class="pay-method-label">계좌 간편결제</label>
                                        </div>
                                        <div class="pay-method-radio div-inline">
                                            <input type="radio" name="pay-method" id="pay-by-card" value="OCREDIT"/>
                                            <label for="pay-by-card" class="pay-method-label">카드 간편결제</label>
                                        </div>
                                    </form>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->

                            <!-- Table row -->
                            <div class="row">
                                <div class="col-12 table">
                                    <table class="table" id="table-accounts">
                                        <thead>
                                        <tr>
                                            <th>Bank Name</th>
                                            <th>Account Number</th>
                                            <th>Nick Name</th>
                                        </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                    <table class="table" id="table-cards">
                                        <thead>
                                        <tr>
                                            <th>Card Image</th>
                                            <th>Card Info.</th>
                                            <th></th>
                                            <th>할부 선택</th>
                                        </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                    <div id="unavailable-simplePay"></div>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-12">
                                    <button type="button" class="btn btn-success float-right" id="submitPay">
                                        <i class="far fa-credit-card"></i> Submit Payment
                                    </button>
                                </div>
                                <div id="paymentResult" class="col-12">

                                </div>
                            </div>
                        </div>
                        <!-- /.invoice -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
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
        <#-- 계좌 정보 요청 -->
        $.ajax({
            method: 'GET',
            url: '/api/proxy/accounts?userKey=000000000',
            dataType: 'json',
            success: function (data) {
                console.log("Account", data);
                const response = data['response'];
                if (response['resultCode'] === "1000") {
                    const $frag = $(document.createDocumentFragment());
                    response['acctList'].forEach(function (acct) {
                        if (acct.nickNM === undefined) {
                            acct.nickNM = "( 미정 )"
                        }
                        $frag.append(
                            `<tr>` +
                            `<td id="bnkNm">${r"${acct.bnkNm}"}</td>` +
                            `<td id="maskAcctNo">${r"${acct.maskAcctNo}"}</td>` +
                            `<td id="nickNM">${r"${acct.nickNM}"}</td>` +
                            `<td id="accountKey" style="display:none">${r"${acct.acctKey}"}</td>` +
                            `<td id="bankCode" style="display:none">${r"${acct.bnkCd}"}</td>` +
                            `</tr>`);
                    });
                    $('#table-accounts').append($frag);
                } else if (response['resultCode'] === "3001") {
                    $('#table-accounts').append("<h3> 등록된 계좌가 없습니다. </h3>");
                }
            }
        });

        <#-- 카드 정보 요청 -->
        $.ajax({
            method: 'POST',
            url: '/api/proxy/cards',
            contentType: 'application/json',
            data: JSON.stringify({'userKey': '00000000'}),
            dataType: 'json',
            success: function (data) {
                console.log("Card", data);
                if (data['code'] === "1000") {
                    const response = data['result']
                    const cardTypeMap = {"crd": "신용", "chk": "체크", "pre": "선불"}
                    const $frag = $(document.createDocumentFragment());
                    response['cardList'].forEach(function (card) {
                        $frag.append(
                            `<tr>` +
                            `<td id="cardImg" style="width:30%"><img src="${r'${card.cardImageUrl}'}" style="width:80%"></td>` +
                            `<td id="bnkNm">${r"${card.cardCompanyName}"}</td>` +
                            `<td>` +
                            `<span id="cardName">${r"${card.cardName}"}</span>` +
                            `<span id="maskCardNo">(` + card['maskedCardNumber'].slice(-4) + `)</span>` +
                            `<span id="cardType" style="opacity:.5"> | ` + cardTypeMap[card['cardType']] + `</span>` +
                            `</td>` +
                            `<td><select id="installmentMonth"><option selected>일시불</option></select></td>` +
                            `<td id="cardCompanyCode" style="display:none">${r"${card.billingCardCode}"}</td>` +
                            `<td id="cardKey" style="display:none">${r"${card.cid}"}</td>` +
                            `</tr>`);
                    });
                    $('#table-cards').append($frag);
                } else if (data['code'] === "3001") {
                    $('#table-cards').append("<h3> 등록된 카드가 없습니다. </h3>");
                }
            }
        });

        <#-- 아이템 정보 집계 -->
        let totalAmount = 0;
        let items = [];
        const itemList = $('#items-tbd').children();
        itemList.each(function (i) {
            const itemInfos = itemList.eq(i).find(".itemInfo");
            let itemInfo = {};
            itemInfos.each(function (j) {
                const key = itemInfos.eq(j).attr('id');
                let value = itemInfos.eq(j).text().trim();
                if ($.isNumeric(Number(value.replace(",", "")))) {
                    value = Number(value.replace(",", ""));
                }
                if (key === "amount") {
                    totalAmount += value;
                }
                itemInfo[key] = value;
            });
            items.push(itemInfo);
        });

        <#-- 결제 수단 요청 -->
        let paymentData = new Map();
        let paymentBaseData = new Map();
        let amountRange = {};
        $.ajax({
            method: 'POST',
            url: 'api/proxy/payments/method',
            contentType: 'application/json',
            data: JSON.stringify({'userId': 'sample@naver.com', 'userKey': '000000000'}),
            dataType: 'json',
            success: function (data) {
                console.log("Method", data);
                switch (data['resultCode']) {
                    case "100":
                        const pgInfos = data['pgInfos']
                        Object.keys(pgInfos).forEach(function (key) {
                            paymentBaseData[key] = {};
                            paymentBaseData[key]['userId'] = 'sample@naver.com';
                            paymentBaseData[key]['userKey'] = '000000000';
                            paymentBaseData[key]['pgId'] = pgInfos[key]['pgId'];
                            paymentBaseData[key]['totalAmount'] = totalAmount;
                        });
                        break;
                    case "101":
                        console.log('Error: /payments/method\n' + data);
                        break;
                    default :
                        alert(data['resultMessage']);
                        break;
                }
                const pgInfos = Object.entries(data['pgInfos']);
                for (let i = 0; i < pgInfos.length; i++) {
                    const pg = pgInfos[i];
                    amountRange[pg[0]] = [pg[1]['minimumAmount'], pg[1]['maximumAmount']];
                }
            }
        });

        <#-- 계좌/카드 목록 조회 -->
        let selectedMethod, selectedSpec
        let methodTable = $('#table-cards');
        $('#table-accounts').hide();
        $('#table-cards').hide();
        $('input[name=pay-method]').on('click', function () {
            selectedMethod = this.value;
            if (amountRange[selectedMethod] === undefined) {
                alert('Error: payment methods request failed.\nunable to determine if you can pay this way.')
                return false;
            }
            const minimumAmount = amountRange[selectedMethod][0];
            const maximumAmount = amountRange[selectedMethod][1];
            let method, isExceed = false;
            methodTable.hide();
            if (this.value === "OBANK") {
                methodTable = $('#table-accounts');
                method = "계좌";
            } else if (this.value === "OCREDIT") {
                methodTable = $('#table-cards');
                method = "카드";
            }
            selectedSpec = methodTable.find("tr.selected")[0];

            let canSimplePay;
            if (minimumAmount < totalAmount) {
                if (maximumAmount === 0 || totalAmount < maximumAmount) {
                    canSimplePay = true;
                } else {
                    canSimplePay = false;
                    isExceed = true;
                }
            } else {
                canSimplePay = false;
                isExceed = false;
            }

            let limitCost, type = [];
            if (canSimplePay) {
                $('#unavailable-simplePay').hide();
                methodTable.show();
            } else {
                $('#table-accounts').hide();
                $('#table-cards').hide();
                if (isExceed) {
                    limitCost = maximumAmount;
                    type[0] = "최대";
                    type[1] = "을 초과했습니다.";
                } else {
                    limitCost = minimumAmount;
                    type[0] = "최소";
                    type[1] = "미만입니다.";
                }
                $('#unavailable-simplePay')
                    .text(`${r"${method}"} 간편 결제를 이용하실 수 없습니다. 총 결제 금액 (${r"${totalAmount}"} 원) 이 ` +
                        `${r"${method}"} 간편 결제 가능 ${r"${type[0]}"} 금액 (${r"${limitCost}"} 원) ${r"${type[1]}"}`)
                    .show();
            }
        });

        <#-- 계좌/카드 선택 -->
        paymentData = paymentBaseData;
        $('#table-accounts, #table-cards').on('click', 'tr', function () {
            $(this).toggleClass("selected")
                .siblings(".selected")
                .removeClass("selected");
            selectedMethod = $('input[name=pay-method]:checked').val();
            if(selectedSpec === this) {
                selectedSpec = undefined;
            }
            else {
                selectedSpec = this;
            }

            const pgList = $(this).children();
            pgList.each(function (i) {
                if (pgList.eq(i).css('display') === 'none') {
                    const key = pgList.eq(i).attr('id');
                    paymentData[selectedMethod][key] = pgList.eq(i).text();
                }
            });
            // console.log(paymentData);
        });

        <#-- 결제 요청 -->
        $('#submitPay').on('click', function () {
            if (selectedMethod === undefined || selectedSpec === undefined) {
                alert("결제를 원하는 계좌/카드를 선택해주세요.");
                return false;
            }
            const submitData = paymentData[selectedMethod];
            submitData['method'] = selectedMethod;
            submitData['amount'] = totalAmount;
            submitData['items'] = items;

            console.log(submitData)
            $.ajax({
                method: 'POST',
                url: `/api/proxy/payments`,
                contentType: 'application/json',
                data: JSON.stringify(submitData),
                dataType: 'json',
                success: function (data) {
                    let resultMsg = `<pre>${r"${JSON.stringify(data, null, 2)}"}</pre>`;
                    switch(data['resultCode']) {
                        case '100':
                            resultMsg =
                                `<strong>${r"${selectedMethod}"} 결제가 정상적으로 완료되었습니다.</strong>` + resultMsg;
                            break;
                        default:
                            resultMsg =
                                `<strong>${r"${selectedMethod}"} 결제에 오류가 발생했습니다.</strong>` + resultMsg;
                            // alert(data['resultMessage']);
                            break;
                    }
                    $('#paymentResult').html("").append(resultMsg);
                },
                error: function (e) {
                    console.log(e.responseText);
                }
            });
        });
    });
</script>
</body>
</html>
