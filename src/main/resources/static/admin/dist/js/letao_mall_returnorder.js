$(function () {
    $("#jqGrid").jqGrid({
        url: '/admin/returnOrders/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'returnId', index: 'returnId', width: 50, key: true, hidden: true},
            {label: '订单条码', name: 'orderSn', index: 'orderSn', width: 120},
            {label: '商品条码', name: 'productSn', index: 'productSn', width: 80},
            {label: '数量', name: 'returnCount', index: 'returnCount', width: 60},
            {label: '创建时间', name: 'createdTime', index: 'createdTime', width: 120},
            {label: '退货人姓名', name: 'returnName', index: 'returnName', width: 50, hidden: true},
            {label: '退货人电话', name: 'returnPhone', index: 'returnPhone', width: 50, hidden: true},
            {label: '退货原因', name: 'reason', index: 'reason', width: 50, hidden: true},
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
        return "<a href=\'##\' onclick=getReason(" + rowObject.rowId + ")>退货原因</a>" +
            "<br>" +
            "<a href=\'##\' onclick=getContactsInfo(" + rowObject.rowId + ")>退货人信息</a>";
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
 * 查看退货原因
 *@param rowId
 */
function getReason(rowId) {
    var rowData = $("#jqGrid").jqGrid("getRowData", rowId);
    $('.modal-title').html('退货原因');
    $('#reasonModal').modal('show');
    $("#reason").html(rowData.reason);
}

/**
 * 退货人信息
 * @param rowId
 */
function getContactsInfo(rowId) {
    var rowData = $("#jqGrid").jqGrid("getRowData", rowId);
    $('.modal-title').html('退货人信息');
    $('#contactsInfoModal').modal('show');
    $("#returnName").html(rowData.returnName);
    $("#returnPhone").html(rowData.returnPhone);
}


function acceptReturnOrder() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "确认弹框",
        text: "确认要接收退单吗?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/admin/returnOrders/accept",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("退单已接受", {
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



function closeReturnOrder() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "确认弹框",
        text: "确认要关闭退单吗?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/admin/returnOrder/close",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("退单已关闭", {
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