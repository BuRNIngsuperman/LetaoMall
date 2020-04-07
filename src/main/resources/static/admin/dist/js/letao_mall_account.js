$(function () {
    $("#jqGrid").jqGrid({
        url: '/admin/accounts/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'accoId',index: 'accoId',width: 50, key: true, hidden: true},
            {label: '管理员名称', name: 'username', index: 'username', width: 150},
            {label: '账户权限类型', name: 'type', index: 'type', width: 120},
            {label: '身份状态', name: 'stop', index: 'stop', width: 60, formatter: lockedFormatter},
            {label: '注册时间', name: 'createTime', index: 'createTime', width: 120}
        ],
        height: 500,
        rowNum: 10,
        rowList: [10, 20, 50],
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
            records: "data.totalCount",
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

    function lockedFormatter(cellvalue) {
        if (cellvalue == "no") {
            return "<button type=\"button\" class=\"btn btn-block btn-secondary btn-sm\" style=\"width: 50%;\">禁用中</button>";
        } else if (cellvalue == "yes") {
            return "<button type=\"button\" class=\"btn btn-block btn-success btn-sm\" style=\"width: 50%;\">正常</button>";
        }
    }
});

/**
 * jqGrid重新加载
 */
function reload() {
    var page = $("#jqGrid").jqGrid('getGridParam', 'page');
    $("#jqGrid").jqGrid('setGridParam', {
        page: page
    }).trigger("reloadGrid");
}

/**
 * 账户锁定
 */
function lockAccount(lockStatus) {
    const ids = getSelectedRows();
    let stopStatus = "yes";
    if (ids == null) {
        return;
    }
    if (lockStatus != 0 && lockStatus != 1) {
        swal('非法操作', {
            icon: "error",
        });
    }
    if(lockStatus == 0){
        stopStatus = "yes";
    }else if(lockStatus == 1) {
        stopStatus = "no";
    }
    swal({
        title: "确认弹框",
        text: "确认要修改账号身份状态吗?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/admin/accounts/lock/" + stopStatus,
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("操作成功", {
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
    );
}


function assignRole() {
    const ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    const role = "admin";
    swal({
        title: "确认弹框",
        text: "确认要修改账号权限为admin吗?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/admin/accounts/role/" + role,
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("操作成功", {
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