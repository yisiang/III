<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@page
import="com.dinero.model.OrderStatus"%>
  <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>dinero訂單管理</title>
    <link
      rel="apple-touch-icon"
      sizes="76x76"
      href="${pageContext.request.contextPath}/img/apple-icon.png"
    />
    <link
      rel="icon"
      type="image/png"
      href="${pageContext.request.contextPath}/img/favicon.png"
    />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta
      content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no"
      name="viewport"
    />
    <!--     Fonts and icons     -->
    <link
      href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
      integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
      crossorigin="anonymous"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
      rel="stylesheet"
    />
    <!-- CSS Files -->
    <link
      href="${pageContext.request.contextPath}/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="${pageContext.request.contextPath}/css/now-ui-dashboard.css?v=1.6.0"
      rel="stylesheet"
    />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link
      href="${pageContext.request.contextPath}/demo/demo.css"
      rel="stylesheet"
    />

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>

    <!-- date -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/gewei/jquery-ui.min.css"
    />

    <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>
    <script type="text/javascript">
      $(function () {
        var dateFormat = "yy-mm-dd",
          from = $("#from")
            .datepicker({
              dateFormat: dateFormat,
              defaultDate: "+1w",
              changeMonth: true,
              numberOfMonths: 3,
            })
            .on("change", function () {
              to.datepicker("option", "minDate", getDate(this));
            }),
          to = $("#to")
            .datepicker({
              dateFormat: dateFormat,
              defaultDate: "+1w",
              changeMonth: true,
              numberOfMonths: 3,
            })
            .on("change", function () {
              from.datepicker("option", "maxDate", getDate(this));
            });

        function getDate(element) {
          var date;
          try {
            date = $.datepicker.parseDate(dateFormat, element.value);
          } catch (error) {
            date = null;
          }

          return date;
        }

        $(".fontblacker").css({ color: "black" });

        $(".datetrimmer").each(function (index, element) {
          var dateText = $(this).text();
          var arr = dateText.split(".");
          $(this).text(arr[0]);
        });
      });
    </script>
    <style>
      .suwabtn {
        display: inline-block;
        margin-top: 2px;
        margin-bottom: 2px;
      }
      
      .background-image_container{
     	min-height: 100%;
     	width: 100%;
    	background-image: url(${pageContext.request.contextPath}/images/背景2.jpg);
    	background-position: center;    
	}
    </style>
  </head>
  <body class="sidebar-mini">
    <div class="wrapper">
          <div class="sidebar" data-color="orange">
    
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
      <div class="logo">
        <a href="/productform.controller" class="simple-text logo-mini">
          <i class="fa-solid fa-house"></i>          
        </a>
        <a href="/productform.controller" class="simple-text logo-normal">
          Home
        </a>
        <div class="navbar-minimize">
          <button id="minimizeSidebar" class="btn btn-outline-white btn-icon btn-round">
            <i class="now-ui-icons text_align-center visible-on-sidebar-regular"></i>
            <i class="now-ui-icons design_bullet-list-67 visible-on-sidebar-mini"></i>
          </button>
        </div>
      </div>
  <div class="sidebar-wrapper" id="sidebar-wrapper">
    <div class="user">
      <div class="photo">
<security:authorize access="isAuthenticated()">        
<img src=<security:authentication property="principal.photo" /> />
      </div>
      <div class="info">
        <a data-toggle="collapse" href="#collapseExample" class="collapsed">
          <span>
           <security:authentication property="principal.fullname" />
            <b class="caret"></b>
          </span>
        </a>
        </security:authorize>
            <div class="clearfix"></div>

          </div>
        </div>
        <ul class="nav">
          <li>
            <a href="${pageContext.request.contextPath}/users/findusers">
              <i class="fa-solid fa-user-tie"></i>
              <p>會員</p>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/productform.controller">
              <i class="fa-solid fa-dog"></i>
              <p>Product</p>
            </a>
          </li><li>
            <a href="${pageContext.request.contextPath}/cart"">
              <i class="fa-solid fa-cart-shopping"></i>
              <p>Cart</p>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/message">
              <i class="fa-solid fa-comments"></i>
              <p>留言板</p>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/activities/activity.info">
              <i class="fa-solid fa-list-check"></i>
              <p>活動</p>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/coupon">
             <i class="fa-solid fa-ticket"></i>
              <p>優惠券</p>
            </a>
          </li>
        </ul>
      </div>
    </div>

      <div class="main-panel" id="main-panel">
        <jsp:include page="../testNavBar.jsp"></jsp:include>

        <div class="panel-header">
        		<div class="background-image_container">
            </div>
        </div>
        <div class="content">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">訂單管理</h4>
                </div>

                <div class="container">
                  <a
                    href="${pageContext.request.contextPath}/cart/export/excelAll"
                    class="btn btn-round btn-success"
                    >匯出訂單excel</a
                  >
                  <a
                    href="${pageContext.request.contextPath}/cart/export/cartItemExcell"
                    class="btn btn-round btn-success"
                    >匯出明細excel</a
                  >
                  <%--搜尋 --%>
                  <button
                    class="btn btn-primary btn-round"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseExample"
                    aria-expanded="false"
                    aria-controls="collapseExample"
                  >
                    搜尋
                  </button>

                  <div class="collapse" id="collapseExample">
                    <div class="card card-body">
                      <form
                        action="${pageContext.request.contextPath}/cart/orderSelectBy"
                        method="get"
                        class="form-horizontal center"
                      >
                        <div class="form-group controll">
                          <label for=""> 搜尋方式</label><br />
                          <select name="selectBy" id="">
                            <option value="cartId">訂單編號</option>
                            <option value="custId">顧客編號</option>
                            <option value="cartTotal">訂單總額</option>
                            <option value="tradeDate">交易日期</option>
                            <option value="advanced">進階搜尋</option>
                          </select>
                        </div>
                        <hr />
                        <div class="form-group controll">
                          <label for="" class="fontblacker"
                            >訂單編號<br />
                            <input
                              type="text"
                              name="cartId"
                              class="form-control"
                            />
                          </label>
                        </div>
                        <hr />

                        <div class="form-group controll">
                          <label for="" class="fontblacker"
                            >顧客編號<br />
                            <input
                              type="text"
                              name="custId"
                              class="form-control"
                            />
                          </label>
                        </div>
                        <hr />

                        <div class="form-group controll">
                          <label for="" class="fontblacker">日期</label><br />
                          <label for="" class="fontblacker">
                            最早日期
                            <input
                              type="text"
                              name="minDate"
                              class="form-control"
                              id="from"
                              autocomplete="off"
                            /> </label
                          ><br />
                          <label for="" class="fontblacker">
                            最大日期
                            <input
                              type="text"
                              name="maxDate"
                              class="form-control"
                              id="to"
                              autocomplete="off"
                            />
                          </label>
                        </div>
                        <hr />
                        <div class="form-group controll">
                          <label class="fontblacker">金額</label>
                          <label class="fontblacker">
                            最小金額
                            <input
                              type="text"
                              name="minTotal"
                              class="form-control"
                            />
                          </label>
                          <label class="fontblacker">
                            最大金額
                            <input
                              type="text"
                              name="maxTotal"
                              class="form-control"
                            />
                          </label>
                        </div>
                        <hr />
                        <div class="form-group controll">
                          <input type="submit" value="送出查詢" />
                        </div>
                      </form>
                    </div>
                  </div>
                </div>

                <div class="card-body">
                  <div class="toolbar">
                    <!--        Here you can write extra buttons/actions for the toolbar              -->
                  </div>
                  <table
                    id="datatable"
                    class="table table-striped table-bordered"
                    cellspacing="0"
                    width="100%"
                  >
                    <thead>
                      <tr>
                        <th>訂單編號</th>
                        <th>顧客編號</th>
                        <th>顧客名稱</th>
                        <th>訂單總額</th>
                        <th>交易日期</th>
                        <th>訂單狀態</th>
                        <th>發貨日期</th>
                        <th class="disabled-sorting text-right">訂單明細</th>
                      </tr>
                    </thead>
                    <tfoot>
                      <tr>
                        <th>訂單編號</th>
                        <th>顧客編號</th>
                        <th>顧客名稱</th>
                        <th>訂單總額</th>
                        <th>交易日期</th>
                        <th>訂單狀態</th>
                        <th>發貨日期</th>
                        <th class="disabled-sorting text-right">訂單明細</th>
                      </tr>
                    </tfoot>
                    <tbody>
                      <c:forEach items="${requestScope.ords}" var="ord">
                        <tr>
                          <td>${ord.cartId}</td>
                          <td>${ord.custId}</td>
                          <td>${userService.findUserNameById(ord.custId)}</td>
                          <td>${ord.cartTotal}</td>
                          <td class="datetrimmer">${ord.tradeDate}</td>
                          <td class="ordersta">${ord.orderState}</td>
                          <td class="datetrimmer">${ord.shipmentDate}</td>
                          <td class="text-right">
                            <a
                              class="btn btn-round btn-info suwabtn"
                              href="${pageContext.request.contextPath}/cart/${ord.cartId}"
                              >明細</a
                            >
                            <!--發貨-->
                            <c:if
                              test="${ord.orderState == OrderStatus.Pending or ord.orderState == OrderStatus.Refused}"
                            >
                              <form
                                action="${pageContext.request.contextPath}/cart/ship"
                                method="post"
                              >
                                <input
                                  type="hidden"
                                  name="cartId"
                                  value="${ord.cartId}"
                                />
                                <button
                                  type="submit"
                                  class="btn btn-round btn-warning shipord suwabtn"
                                >
                                  發貨
                                </button>
                              </form>
                            </c:if>
                            <!--接受-->
                            <c:if
                              test="${ord.orderState == OrderStatus.Refunded}"
                            >
                              <form
                                action="${pageContext.request.contextPath}/cart/acceptrefund"
                                method="post"
                              >
                                <input
                                  type="hidden"
                                  name="cartId"
                                  value="${ord.cartId}"
                                />
                                <button
                                  type="submit"
                                  class="btn btn-round btn-success acceptRefund suwabtn"
                                >
                                  接受
                                </button>
                              </form>
                            </c:if>
                            <!-- 拒絕-->
                            <c:if
                              test="${ord.orderState == OrderStatus.Refunded}"
                            >
                              <form
                                action="${pageContext.request.contextPath}/cart/rejectrefund"
                                method="post"
                              >
                                <input
                                  type="hidden"
                                  name="cartId"
                                  value="${ord.cartId}"
                                />
                                <button
                                  type="submit"
                                  class="btn btn-round btn-danger rejectrefund suwabtn"
                                >
                                  拒絕
                                </button>
                              </form>
                            </c:if>
                            <!-- -->
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
                <!-- end content-->
              </div>
              <!--  end card  -->
            </div>
            <!-- end col-md-12 -->
          </div>
          <!-- end row -->
        </div>
      </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/core/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/core/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/core/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/moment.min.js"></script>
    <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
    <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-switch.js"></script>
    <!--  Plugin for Sweet Alert -->
    <script src="${pageContext.request.contextPath}/js/plugins/sweetalert2.min.js"></script>
    <!-- Forms Validations Plugin -->
    <script src="${pageContext.request.contextPath}/js/plugins/jquery.validate.min.js"></script>
    <!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
    <script src="${pageContext.request.contextPath}/js/plugins/jquery.bootstrap-wizard.js"></script>
    <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
    <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-selectpicker.js"></script>
    <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
    <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-datetimepicker.js"></script>
    <!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
    <script src="${pageContext.request.contextPath}/js/plugins/jquery.dataTables.min.js"></script>
    <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
    <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-tagsinput.js"></script>
    <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
    <script src="${pageContext.request.contextPath}/js/plugins/jasny-bootstrap.min.js"></script>
    <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
    <script src="${pageContext.request.contextPath}/js/plugins/fullcalendar.min.js"></script>
    <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
    <script src="${pageContext.request.contextPath}/js/plugins/jquery-jvectormap.js"></script>
    <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script src="${pageContext.request.contextPath}/js/plugins/nouislider.min.js"></script>
    <!--  Google Maps Plugin    -->
    <!-- Chart JS -->
    <script src="${pageContext.request.contextPath}/js/plugins/chartjs.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-notify.js"></script>
    <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
    <script
      src="${pageContext.request.contextPath}/js/now-ui-dashboard.min.js?v=1.6.0"
      type="text/javascript"
    ></script>
    <!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
    <script src="${pageContext.request.contextPath}/demo/demo.js"></script>
    <script>
      $(document).ready(function () {
        $("#datatable").DataTable({
          pagingType: "full_numbers",
          lengthMenu: [
            [10, 25, 50, -1],
            [10, 25, 50, "All"],
          ],
          responsive: true,
          language: {
            search: "_INPUT_",
            searchPlaceholder: "Search records",
          },
        });

        var table = $("#datatable").DataTable();

        // Edit record
        table.on("click", ".edit", function () {
          $tr = $(this).closest("tr");
          if ($($tr).hasClass("child")) {
            $tr = $tr.prev(".parent");
          }

          var data = table.row($tr).data();
          alert(
            "You press on Row: " +
              data[0] +
              " " +
              data[1] +
              " " +
              data[2] +
              "'s row."
          );
        });

        // Delete a record
        table.on("click", ".remove", function (e) {
          $tr = $(this).closest("tr");
          if ($($tr).hasClass("child")) {
            $tr = $tr.prev(".parent");
          }
          table.row($tr).remove().draw();
          e.preventDefault();
        });

        //Like record
        table.on("click", ".like", function () {
          alert("You clicked on Like button");
        });

        //
        $(".acceptrefund").click(function (e) {
          e.preventDefault();
          let formid = $(this).parent();

          Swal.fire({
            title: "是否同意退費?",
            text: "同意後無法更改!",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "取消",
            confirmButtonText: "同意",
          }).then((result) => {
            if (result.isConfirmed) {
              Swal.fire("完成", "退費已受理", "success").then(() => {
                $(formid).submit();
              });
            }
          });
        });

        //shipord

        $(".shipord").click(function (e) {
          e.preventDefault();
          let formid = $(this).parent();

          Swal.fire({
            title: "是否發貨?",
            text: "按下確認運送",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "取消",
            confirmButtonText: "同意",
          }).then((result) => {
            if (result.isConfirmed) {
              Swal.fire("完成", "已送出", "success").then(() => {
                $(formid).submit();
              });
            }
          });
        });

        $(".rejectrefund").click(function (e) {
          e.preventDefault();
          let formid = $(this).parent();

          Swal.fire({
            title: "是否拒絕退費?",
            text: "按下確認拒絕",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "取消",
            confirmButtonText: "同意",
          }).then((result) => {
            if (result.isConfirmed) {
              Swal.fire("完成", "退費不受理", "success").then(() => {
                $(formid).submit();
              });
            }
          });
        });

        $(".ordersta").each(function (index, element) {
          let content = $(this).text();

          if (content === "Pending") {
            $(this).text("待出貨");
          } else if (content === "Refunded") {
            $(this).text("退款申請中");
          } else if (content === "Refused") {
            $(this).text("退款不受理");
          } else if (content === "Shipped") {
            $(this).text("運送中");
          } else if (content === "Confirmed") {
            $(this).text("已完成");
          } else if (content === "Cancelled") {
            $(this).text("已取消");
          }
        });

        function orderStateChinese() {
          $(".ordersta").each(function (index, element) {
            let content = $(this).text();

            if (content === "Pending") {
              $(this).text("待出貨");
            } else if (content === "Refunded") {
              $(this).text("退款申請中");
            } else if (content === "Refused") {
              $(this).text("退款不受理");
            } else if (content === "Shipped") {
              $(this).text("運送中");
            } else if (content === "Confirmed") {
              $(this).text("已完成");
            } else if (content === "Cancelled") {
              $(this).text("已取消");
            }
          });
        }

        window.setInterval(orderStateChinese, 500);
      });

      //套版 css 調整
      $(".suwabtn").css({
        display: "inline-block",
        "margin-top": "3px",
        "margin-bottom": "3px",
      });
    </script>

    <script src="${pageContext.request.contextPath}/gewei/jquery-ui.min.js"></script>
  </body>
</html>
