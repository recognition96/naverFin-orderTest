<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Item Edit</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
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
            <h1>Item Edit</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-6">
          <div class="card card-secondary">
            <div class="card-header">
              <h3 class="card-title">cpId / itemId</h3>
              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <form id="form-cpItem">
                <div class="form-row">
                  <div class="col-md-12">
                    <label for="inputCpId">cpId</label>
                  </div>
                  <div class="form-group col-md-6">
                    <select id="inputCpId" class="form-control custom-select">
                    </select>
                  </div>
                  <div class="form-group col-md-5">
                    <input type="text" class="form-control" id="createCpId" name="cpId" disabled>
                  </div>
                  <div class="form-group col-md-1">
                    <button id="delCpId" type="submit" class="btn">
                      <i class="fas fa-trash-alt" style='color:red'></i>
                    </button>
                  </div>
                </div>
                <div class="form-row">
                  <div class="col-md-12">
                    <label for="inputItemId">itemId</label>
                  </div>
                  <div class="form-group col-md-6">
                    <select id='inputItemId' class="form-control custom-select">
                    </select>
                  </div>
                  <div class="form-group col-md-5">
                    <input type="text" class="form-control" id="createItemId" name="itemId" disabled>
                  </div>
                  <div class="form-group col-md-1">
                    <button id="delItemId" type="submit" class="btn">
                      <i class="fas fa-trash-alt" style='color:red'></i>
                    </button>
                  </div>
                </div>
              </form>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <div class="col-md-6">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">Details</h3>
              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <form id="form-add">
                <div class="form-group">
                  <label for="inputName">Item Name</label>
                  <input type="text" id="inputName" class="form-control" name="name" required>
                </div>
                <label for="inputCategory">Category</label>
                <select id="inputCategory" class="form-control custom-select" name="category" required>
                  <option selected disabled hidden>:::::: 선택 ::::::</option>
                  <optgroup label="전자기기">
                    <option>생활가전</option>
                    <option>스마트폰</option>
                    <option>노트북</option>
                  </optgroup>
                  <optgroup label="의류">
                    <option>상의</option>
                    <option>하의</option>
                    <option>악세사리</option>
                  </optgroup>
                  <optgroup label="도서">
                    <option>소설</option>
                    <option>학습</option>
                    <option>잡지</option>
                  </optgroup>
                </select>
                <div class="form-group">
                  <label for="inputPrice">Price</label>
                  <input type="number" id="inputPrice" class="form-control" name="price" required>
                </div>
                <div class="form-group">
                  <label for="inputShortDescription">Short Description</label>
                  <textarea id="inputShortDescription" class="form-control" rows="3" name="shortDesc"></textarea>
                </div>
                <div class="form-group">
                  <label for="inputLongDescription">Long Description</label>
                  <textarea id="inputLongDescription" class="form-control" rows="6" name="longDesc"></textarea>
                </div>
              </form>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      </div>
      <div class="row">
        <div class="col-4"></div>
        <div class="col-4" style="display: flex; justify-content: space-between">
          <input id="inputConfirm" type="submit" form="form-add" value="Save" class="btn btn-lg btn-success">
          <a href="#" id="inputCancel" class="btn btn-lg btn-secondary" onclick="history.back()">Cancel</a>
          <input id="inputDelete" type="submit" form="form-add" value="Delete" class="btn btn-lg btn-danger">
        </div>
        <div class="col-4"></div>
      </div>
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
  $(function() {
    const urlParams = new URLSearchParams(window.location.search);
    const id = urlParams.get('id');
    let initItemId;

    $.ajax({
      method: 'GET',
      url: '/api/cpid',
      contentType: 'application/json',
      dataType: 'json'
    }).done(function(data) {
      const cpIdSet = new Set(data);
      const cpIdSelect = $('#inputCpId');
      cpIdSelect.append(
            "<option value='-1' selected disabled hidden>" + ":::::: 선택 ::::::" + "</option>" +
            "<option value='0'>" + "직접 입력" + "</option>");
      cpIdSet.forEach(function (cpId) {
        const option = "<option>" + cpId + "</option>";
        cpIdSelect.append(option);
      });
      initItemList(false);

      $.ajax({
          method: 'GET',
          url: '/api/item/' + id,
          dataType: 'json',
          success: function(data) {
            $('#inputCpId').val(data['cpId']);
            initItemId = data['itemId'];
            $('#inputName').val(data['name']);
            $('#inputCategory > optgroup').find(`option:contains(${r"${data.category}"})`).prop("selected", true);
            $('#inputPrice').val(data['price']);
            $('#inputShortDescription').val(data['shortDesc']);
            $('#inputLongDescription').val(data['longDesc']);
          },
          error: function (e){
            console.log(e.responseText);
          },
          complete: function () {
            $('#inputCpId').trigger('change');
          }
        });

    }).fail(function(error) {
      console.log(error.responseText);
    });

    $('#inputCpId').on('change', function(event) {
      const optionIdx = this.selectedIndex;
      initItemList(getItemList(this.value));
      if(initItemId !== null) {
        $('#inputItemId').val(initItemId);
        initItemId = null;
      }

      if(optionIdx === 1) {
        $('#createCpId').prop('disabled', false).focus();
      }
      else {
        $('#createCpId').val('').prop('disabled', true);
      }
    });

    $('#createCpId').on('focusout', function() {
      const newCpId = $('#createCpId').val();
      let isExist;
      if(newCpId) {
        isExist = getItemList(newCpId);
      }
      else {
        return;
      }

      initItemList(isExist);
      if(isExist) {
        $('#createItemId').val('').prop('disabled', true);
      }
      else {
        $('#inputItemId option:eq(1)').prop('selected', true);
        $('#createItemId').prop('disabled', false).focus();
      }
    });

    $('#inputItemId').on('change', function(event) {
      const optionIdx = this.selectedIndex;
      if(optionIdx === 1) {
        $('#createItemId').prop('disabled', false).focus();
      }
      else {
        $('#createItemId').val('');
        $('#createItemId').prop('disabled', true);
      }
    });

    $('#delCpId, #delItemId').on('click', function(event) {
      let cpItem = getCpItemValue();
      let itemIdUrl = '';
      let canDelete = false;

      if(this.id === 'delCpId') {
        if(cpItem[0] === undefined) {
          alert('삭제할 CpId를 입력해 주세요.');
        }
        else {
          canDelete = true;
        }
      }
      else if(this.id === 'delItemId') {
        if(cpItem[0] === undefined) {
          alert('삭제할 CpId를 입력해 주세요.');
        }
        if(cpItem[1] === undefined) {
          alert('삭제할 itemId를 입력해 주세요.');
        }
        else {
          itemIdUrl += `/itemid/${r"${cpItem[1]}"}`;
        }
        if(cpItem[0] && cpItem[1]) {
          canDelete = true;
        }
      }

      if(canDelete) {
        $.ajax({
          method: 'DELETE',
          url: '/api/cpid/' + cpItem[0] + itemIdUrl,
          contentType: "application/json;",
          dataType: 'json',
          success: function (data) {
            if(data === false) {
              alert('해당 cpId/itemId 를 사용 중인 상품이 있습니다.');
            }
            else {
              console.log(data);
            }
          },
          error: function (e) {
            console.log(e);
          }
        });
      }
      return false;
    });

    $('#inputConfirm').on('click', function(event) {
      let formData = $('#form-add').serializeObject();
      let cpItem = getCpItemValue();
      if(cpItem[0] === undefined) {
        alert('생성할 CpId를 입력해 주세요.');
      }
      if(cpItem[1] === undefined) {
        alert('생성할 CpId를 입력해 주세요.');
      }
      cpItem = {'cpId': cpItem[0], 'itemId': cpItem[1]};
      Object.assign(formData, cpItem);
      formData['id'] = id;

      if ($('#createCpId').val() !== "" || $('#createItemId').val() !== "") {
        let newCpItemData = JSON.stringify(cpItem);
        console.log(newCpItemData);
        $.ajax({
          method: 'POST',
          url: '/api/cp-item',
          contentType: "application/json;",
          data: newCpItemData,
          dataType: 'json',
          success: function (data) {
            console.log(data);
          },
          error: function (e) {
            console.log(e.responseText);
          }
        });
      }

      if(cpItem['cpId'] > 0 && cpItem['itemId'] > 0) {
        $.ajax({
          method: 'PUT',
          url: '/api/item/' + id,
          contentType: 'application/json',
          data: JSON.stringify(formData),
          dataType: 'json',
          success: function (data) {
            window.location.href = "/items";
          },
          error: function (e) {
            console.log(e.responseText);
          }
        });
      }
      else {
        alert('cpId/itemId 를 선택해 주세요.');
      }
      return false;
    });

    $('#inputDelete').on("click", function(event) {
      $.ajax({
        method: 'DELETE',
        url: '/api/item/' + id,
        dataType: 'json',
        success: function(data) {
          window.location.href = "/items";
        },
        error: function (e){
          console.log(e.responseText);
        }
      });
      return false;
    });

    function initItemList(isItemExist) {
      const itemIdSelect = $('#inputItemId');
      if(!isItemExist) {
        itemIdSelect.empty().append(
                "<option value='-1' selected disabled hidden>" + ":::::: 선택 ::::::" + "</option>" +
                "<option value='0'>" + "직접 입력" + "</option>");
      }
      $('#inputItemId option:eq(0)').prop('selected', true);
    }

    function getItemList(cpId) {
      let isCpIdExist = true;
      if(cpId <= 0) {
        isCpIdExist = false;
        return isCpIdExist;
      }
      $.ajax({
        method: 'GET',
        url: `/api/cpid/${r"${cpId}"}/itemid`,
        contentType: 'application/json',
        dataType: 'json',
        async: false,
        success: function (data) {
          const itemIdSelect = $('#inputItemId');
          initItemList(false);
          data.forEach(function (itemId) {
            const option = "<option>" + itemId + "</option>";
            itemIdSelect.append(option);
          });
          itemIdSelect.trigger('change');
          if(data.length === 0) {
            isCpIdExist = false;
          }
        },
        error: function (e) {
          console.log(e.responseText);
        }
      });
      return isCpIdExist;
    }

    function getCpItemValue(){
      const selectedCpId = $('#inputCpId option:selected');
      const selectedItemId = $('#inputItemId option:selected');
      const newCpId = $('#createCpId');
      const newItemId = $('#createItemId');

      let cpIdValue, itemIdValue;
      if (newCpId.prop('disabled')) {
        cpIdValue = selectedCpId.val();
        if (newItemId.val() === '') {
          itemIdValue = selectedItemId.val();
        }
        else {
          itemIdValue = newItemId.val();
        }
      }
      else if(newCpId.val() !== ''){
        cpIdValue =newCpId.val();
        if (newItemId.prop('disabled')) {
          itemIdValue = selectedItemId.val();
        }
        else if(newItemId.val() !== '') {
          itemIdValue = newItemId.val();
        }
      }
      return [cpIdValue, itemIdValue];
    }
  });
</script>
</body>
</html>
