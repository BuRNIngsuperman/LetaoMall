$(function () {
    $("#jqGrid").jqGrid({
        url: '/admin/orders/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'orderId', index: 'orderId', width: 50, key: true, hidden: true},
            {label: '订单号', name: 'orderSn', index: 'orderSn', width: 120},
            {label: '订单总价', name: 'totalAmount', index: 'totalAmount', width: 60},
            {label: '订单状态', name: 'status', index: 'status', width: 80, formatter: orderStatusFormatter},
            {label: '支付方式', name: 'payType', index: 'payType', width: 80,formatter:payTypeFormatter},
            {label: '收件人地址', name: 'address', index: 'address', width: 10, hidden: true},
            {label: '创建时间', name: 'createdTime', index: 'createdTime', width: 120},
            {label: '操作', name: 'createdTime', index: 'createdTime', width: 120, formatter: operateFormatter}
        ],
        height: 760,
        rowNum: 20,
        rowList: [20, 50, 80],
        styleUI: 'Bootstrap',
        loadtext: '信息读取中...',
        rownumbers: false,
        rownumWidth: 20,
        autowidth: true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader: {
            root: "data.list",
            page: "data.currPage",
            total: "data.totalPage",
            records: "data.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order",
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });

    $(window).resize(function () {
        $("#jqGrid").setGridWidth($(".card-body").width());
    });

    function operateFormatter(cellvalue, rowObject) {
        return "<a href=\'##\' onclick=openOrderItems(" + rowObject.rowId + ")>查看订单信息</a>" +
            "<br>" +
            "<a href=\'##\' onclick=openExpressInfo(" + rowObject.rowId + ")>查看收件地址</a>";
    }

    function orderStatusFormatter(cellvalue) {
        //原订单状态:0.待支付 1.已支付 2.配货完成 3:出库成功 4.交易成功 -1.手动关闭 -2.超时关闭 -3.商家关闭
        //现在：0.待付款 1.待发货 2.已发货 3.以完成 4.以关闭 5.无效订单
        if (cellvalue == 0) {
            return "待付款";
        }
        if (cellvalue == 1) {
            return "待发货";
        }
//        if (cellvalue == 2) {
//            return "已发货";
//        }
//        if (cellvalue == 3) {
//            return "交易完成完成";
//        }
//        if (cellvalue == 4) {
//            return "已关闭";
//        }
//        if (cellvalue == 5) {
//            return "无效订单";
//        }
    }

    function payTypeFormatter(cellvalue) {
        //支付类型:0.无 1.支付宝支付 2.微信支付
        if (cellvalue == 0) {
            return "未支付";
        }
        if (cellvalue == 1) {
            return "支付宝支付";
        }
        if (cellvalue == 2) {
            return "微信支付";
        }
    }

    $(window).resize(function () {
        $("#jqGrid").setGridWidth($(".card-body").width());
    });

});

/**
 * jqGrid重新加载
 */
function reload() {
    initFlatPickr();
    var page = $("#jqGrid").jqGrid('getGridParam', 'page');
    $("#jqGrid").jqGrid('setGridParam', {
        page: page
    }).trigger("reloadGrid");
}

/**
 * 查看订单项信息
 * @param orderId
 */
function openOrderItems(orderId) {
    $('.modal-title').html('订单详情');
    $.ajax({
        type: 'GET',//方法类型
        url: '/admin/order-items/' + orderId,
        contentType: 'application/json',
        success: function (result) {
            if (result.resultCode == 200) {
                $('#orderItemModal').modal('show');
                var itemString = '';
                for (i = 0; i < result.data.length; i++) {
                    itemString += " "+result.data[i].goodsName + ' x ' + result.data[i].goodsCount + ' 产品号: ' + result.data[i].goodsSN + ";<br>";
                }
                $("#orderItemString").html(itemString);
            } else {
                swal(result.message, {
                    icon: "error",
                });
            }
            ;
        },
        error: function () {
            swal("操作失败", {
                icon: "error",
            });
        }
    });
}

/**
 * 查看收件人信息
 * @param orderId
 */
function openExpressInfo(orderId) {
    var rowData = $("#jqGrid").jqGrid("getRowData", orderId);
    $('.modal-title').html('收件信息');
    $('#expressInfoModal').modal('show');
    $("#userAddressInfo").html(rowData.address);
}

/**
 * 订单编辑
 */
function orderEdit() {
    reset();
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    var rowData = $("#jqGrid").jqGrid("getRowData", id);
    $('.modal-title').html('订单编辑');
    $('#orderInfoModal').modal('show');
    $("#orderId").val(id);
    $("#userAddress").val(rowData.address);
    $("#totalPrice").val(rowData.totalAmount);
}


//绑定modal上的保存按钮
$('#saveButton').click(function () {
    var totalPrice = $("#totalPrice").val();
//    var userName = $("#userName").val();
//    var userPhone = $("#userPhone").val();
    var userAddress = $("#userAddress").val();
    var id = getSelectedRowWithoutAlert();
    var url = '/admin/orders/update';
    var data = {
        "orderId": id,
        "totalAmount": totalPrice,
//        "userName": userName,
//        "userPhone": userPhone,
        "address": userAddress
    };
    $.ajax({
        type: 'POST',//方法类型
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (result) {
            if (result.resultCode == 200) {
                $('#orderInfoModal').modal('hide');
                swal("保存成功", {
                    icon: "success",
                });
                $("#jqGrid").trigger("reloadGrid");
            } else {
                $('#orderInfoModal').modal('hide');
                swal(result.message, {
                    icon: "error",
                });
            }
            ;
        },
        error: function () {
            swal("操作失败", {
                icon: "error",
            });
        }
    });
});

/**
 * 订单出库
 */
function orderCheckOut() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    var orderNos = '';
    for (i = 0; i < ids.length; i++) {
        var rowData = $("#jqGrid").jqGrid("getRowData", ids[i]);
        if (rowData.status != '待发货') {
            orderNos += rowData.orderSn + " ";
        }
    }
    if (orderNos.length > 0 & orderNos.length < 100) {
        swal(orderNos + "订单的状态不是支付成功或配货完成无法执行出库操作", {
            icon: "error",
        });
    }
        return;
    if (orderNos.length >= 100) {
        swal("你选择了太多状态不是支付成功或配货完成的订单，无法执行出库操作", {
            icon: "error",
        });
        return;
    }
    swal({
        title: "确认弹框",
        text: "确认要执行出库操作吗?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/admin/orders/checkOut",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("出库成功", {
                                icon: "success",
                            });
                            $("#jqGrid").trigger("reloadGrid");
                        } else {
                            swal(r.message, {
                                icon: "error",
                            });
                        }
                    }
                });
            }
        }
    )
    ;
}

function closeOrder() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "确认弹框",
        text: "确认要关闭订单吗?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/admin/orders/close",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("关闭成功", {
                                icon: "success",
                            });
                            $("#jqGrid").trigger("reloadGrid");
                        } else {
                            swal(r.message, {
                                icon: "error",
                            });
                        }
                    }
                });
            }
        }
    )
    ;
}


function reset() {
    $("#totalPrice").val(0);
    $("#userAddress").val('');
    $('#edit-error-msg').css("display", "none");
}