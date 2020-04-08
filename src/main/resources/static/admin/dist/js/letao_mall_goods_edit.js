//KindEditor变量
var editor;

$(function () {

     //详情编辑器
         editor = KindEditor.create('textarea[id="editor"]', {
             items: ['source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
                 'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                 'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                 'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
                 'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                 'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'multiimage',
                 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
                 'anchor', 'link', 'unlink'],
             uploadJson: '/admin/upload/file',
             filePostName: 'file'
         });

    new AjaxUpload('#uploadGoodsCoverImg', {
        action: '/admin/upload/file',
        name: 'file',
        autoSubmit: true,
        responseType: "json",
        onSubmit: function (file, extension) {
            if (!(extension && /^(jpg|jpeg|png|gif)$/.test(extension.toLowerCase()))) {
                alert('只支持jpg、png、gif格式的文件！');
                return false;
            }
        },
        onComplete: function (file, r) {
            if (r != null && r.resultCode == 200) {
                $("#goodsCoverImg").attr("src", r.data);
                $("#goodsCoverImg").attr("style", "width: 128px;height: 128px;display:block;");
                return false;
            } else {
                alert("error");
            }
        }
    });
});

$('#confirmButton').click(function () {
    var goodsName = $('#goodsName').val();
    var goodsPrice = $('#goodsPrice').val();
    //var goodsImageURL = $('#goodsImageURL').val();
    var goodsStock = $('#goodsStock').val();
    var goodsUnit = $('#goodsUnit').val();
    var goodsSN = $('#goodsSN').val();
    var goodsSaleAddress = $('#goodsSaleAddress').val();
    var goodsMakeAddress = $('#goodsMakeAddress').val();
    var goodsCategoryId = $('#levelThree option:selected').val();

        var goodsSubTitle = $('#goodsSubTitle').val();
        var goodsOriginalPrice = $('#goodsOriginalPrice').val();
        var goodsLowStock = $('#goodsLowStock').val();
        var goodsWeight = $('#goodsWeight').val();
       // var goodsKeyWords = $('#goodsKeyWords').val();
        var goodsNote = $('#goodsNote').val();



    var goodsSellStatus = $("input[name='goodsSellStatus']:checked").val();
    var goodsNewStatus = $("input[name='goodsNewStatus']:checked").val();
    var goodsRecommandStatus = $("input[name='goodsRecommandStatus']:checked").val();

    var goodsDescription = editor.html();
    var goodsDetailTitle = $('textarea[id="editor2"]').val();
    var goodsDetailDesc = $("textarea[id='editor3']").val();
    var goodsDetailHtml = $("textarea[id='editor4']").val();

    if (isNull(goodsDetailTitle)) {
        swal("请输入商品详情标题", {
            icon: "error",
        });
        return;
    }
    if (isNull(goodsDetailDesc)) {
        swal("请输入商品详情描述", {
            icon: "error",
        });
        return;
    }
    if (isNull(goodsDetailHtml)) {
        swal("请输入商品详情网页内容", {
            icon: "error",
        });
        return;
    }

    if (isNull(goodsWeight)) {
        swal("请输入商品重量", {
            icon: "error",
        });
        return;
    }

    if (isNull(goodsNote)) {
        swal("请输入商品备注", {
            icon: "error",
        });
        return;
    }
    if (isNull(goodsLowStock)) {
        swal("请输入商品库存预警值", {
            icon: "error",
        });
        return;
    }

    if (isNull(goodsOriginalPrice)) {
        swal("请输入商品市场价", {
            icon: "error",
        });
        return;
    }

    if (isNull(goodsSubTitle)) {
        swal("请输入商品副标题", {
            icon: "error",
        });
        return;
    }

    if (isNull(goodsName)) {
        swal("请输入商品名称", {
            icon: "error",
        });
        return;
    }
    if (isNull(goodsPrice)) {
        swal("请输入价格", {
            icon: "error",
        });
        return;
    }
    if (goodsPrice < 1) {
        swal("价格输入非法", {
            icon: "error",
        });
        return;
    }
    if (!validLength(goodsName, 200)) {
        swal("商品名称过长", {
            icon: "error",
        });
        return;
    }
    if (isNull(goodsStock)) {
        swal("请输入库存量", {
            icon: "error",
        });
        return;
    }
    if (isNull(goodsUnit)) {
        swal("请输入商品单位", {
            icon: "error",
        });
        return;
     }
     if (isNull(goodsSN)) {
         swal("请输入商品条码", {
             icon: "error",
         });
         return;
     }
     if (isNull(goodsSaleAddress)) {
         swal("请输入出货地址", {
             icon: "error",
         });
         return;
      }
     if (isNull(goodsMakeAddress)) {
         swal("请输入产地", {
             icon: "error",
         });
         return;
      }
     if (isNull(goodsCategoryId)) {
         swal("请选择分类", {
             icon: "error",
         });
         return;
      }

    if (isNull(goodsSellStatus)) {
        swal("请选择上架状态", {
            icon: "error",
        });
        return;
    }
    if (isNull(goodsNewStatus)) {
        swal("请选择新品状态", {
            icon: "error",
        });
        return;
    }
    if (isNull(goodsRecommandStatus)) {
        swal("请选择推荐状态", {
            icon: "error",
        });
        return;
    }

    if (isNull(goodsDescription)) {
        swal("请输入商品介绍", {
            icon: "error",
        });
        return;
    }
    if (!validLength(goodsDescription, 200)) {
        swal("商品介绍内容过长", {
            icon: "error",
        });
        return;
    }
    $('#goodsModal').modal('show');
});

$('#saveButton').click(function () {
        var goodsCommId = $('#commId').val();
        var goodsName = $('#goodsName').val();
        var goodsPrice = $('#goodsPrice').val();
        //var goodsImageURL = $('#goodsImageURL').val();
        var goodsStock = $('#goodsStock').val();
        var goodsUnit = $('#goodsUnit').val();
        var goodsSN = $('#goodsSN').val();
        var goodsSaleAddress = $('#goodsSaleAddress').val();
        var goodsMakeAddress = $('#goodsMakeAddress').val();
        var goodsCategoryId = $('#levelThree option:selected').val();
        var goodsSubTitle = $('#goodsSubTitle').val();
        var goodsOriginalPrice = $('#goodsOriginalPrice').val();
        var goodsLowStock = $('#goodsLowStock').val();
        var goodsWeight = $('#goodsWeight').val();
        //var goodsKeyWords = $('#goodsKeyWords').val();
        var goodsNote = $('#goodsNote').val();
        var goodsSellStatus = $("input[name='goodsSellStatus']:checked").val();
        var goodsNewStatus = $("input[name='goodsNewStatus']:checked").val();
        var goodsRecommandStatus = $("input[name='goodsRecommandStatus']:checked").val();
        var goodsDescription = editor.html();
        var goodsDetailTitle = $("textarea[id='editor2']").html();
        var goodsDetailDesc = $("textarea[id='editor3']").html();
        var goodsDetailHtml = $("textarea[id='editor4']").html();

        var goodsCoverImg = $('#goodsCoverImg')[0].src;
        if (isNull(goodsCoverImg) || goodsCoverImg.indexOf('img-upload') != -1) {
            swal("封面图片不能为空", {
                icon: "error",
            });
            return;
        }

        var url = '/admin/goods/save';
        var swlMessage = '保存成功';
        var data = {
            "name": goodsName,
            "price": goodsPrice,
            "stock": goodsStock,
            "unit": goodsUnit,
            "productSn": goodsSN,
            "saleAddress": goodsSaleAddress,
            "makeAddress": goodsMakeAddress,
            "commodityCategoryId": goodsCategoryId,
            "publishStatus": goodsSellStatus,
            "newStatus": goodsNewStatus,

            "recommandStatus": goodsRecommandStatus,
            "description": goodsDescription,
            "albumPics": goodsCoverImg,
            "subTitle":goodsSubTitle,
            "originalPrice":goodsOriginalPrice,

            "lowStock":goodsLowStock,
            "weight":goodsWeight,
            "keyWords":goodsKeyWords,
            "note":goodsNote,
            "detailTitle":goodsDetailTitle,
            "detailDesc":goodsDetailDesc,
            "detailHtml":goodsDetailHtml
            };
       /*新增商品ID默认设置了0，而修改商品则会把数据库中的ID获取出来*/
       if (goodsCommId > 0) {
         url = '/admin/goods/update';
         swlMessage = '修改成功';
         data = {
            "commId":goodsCommId,
            "name": goodsName,
            "price": goodsPrice,
            "stock": goodsStock,
            "unit": goodsUnit,
            "productSn": goodsSN,
            "saleAddress": goodsSaleAddress,
            "makeAddress": goodsMakeAddress,
            "commodityCategoryId": goodsCategoryId,
            "publishStatus": goodsSellStatus,
            "newStatus": goodsNewStatus,
            "recommandStatus": goodsRecommandStatus,
            "description": goodsDescription,
            "albumPics": goodsCoverImg,
            "subTitle":goodsSubTitle,
            "originalPrice":goodsOriginalPrice,
            "lowStock":goodsLowStock,
            "weight":goodsWeight,
            "keyWords":goodsKeyWords,
            "note":goodsNote,
            "detailTitle":goodsDetailTitle,
            "detailDesc":goodsDetailDesc,
            "detailHtml":goodsDetailHtml
        };
    }
    console.log(data);
    $.ajax({
        type: 'POST',//方法类型
        url: url,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (result) {
            if (result.resultCode == 200) {
                $('#goodsModal').modal('hide');
                swal({
                    title: swlMessage,
                    type: 'success',
                    showCancelButton: false,
                    confirmButtonColor: '#1baeae',
                    confirmButtonText: '返回商品列表',
                    confirmButtonClass: 'btn btn-success',
                    buttonsStyling: false
                }).then(function () {
                    window.location.href = "/admin/goods";
                })
            } else {
                $('#goodsModal').modal('hide');
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


$('#cancelButton').click(function () {
    window.location.href = "/admin/goods";
});

$('#levelOne').on('change', function () {
    $.ajax({
        url: '/admin/categories/listForSelect?categoryId=' + $(this).val(),
        type: 'GET',
        success: function (result) {
            if (result.resultCode == 200) {
                var levelTwoSelect = '';
                var secondLevelCategories = result.data.secondLevelCategories;
                var length2 = secondLevelCategories.length;
                for (var i = 0; i < length2; i++) {
                    levelTwoSelect += '<option value=\"' + secondLevelCategories[i].cid + '\">' + secondLevelCategories[i].cname + '</option>';
                }
                $('#levelTwo').html(levelTwoSelect);
                var levelThreeSelect = '';
                var thirdLevelCategories = result.data.thirdLevelCategories;
                var length3 = thirdLevelCategories.length;
                for (var i = 0; i < length3; i++) {
                    levelThreeSelect += '<option value=\"' + thirdLevelCategories[i].cid + '\">' + thirdLevelCategories[i].cname + '</option>';
                }
                $('#levelThree').html(levelThreeSelect);
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
});

$('#levelTwo').on('change', function () {
    $.ajax({
        url: '/admin/categories/listForSelect?categoryId=' + $(this).val(),
        type: 'GET',
        success: function (result) {
            if (result.resultCode == 200) {
                var levelThreeSelect = '';
                var thirdLevelCategories = result.data.thirdLevelCategories;
                var length = thirdLevelCategories.length;
                for (var i = 0; i < length; i++) {
                    levelThreeSelect += '<option value=\"' + thirdLevelCategories[i].cid + '\">' + thirdLevelCategories[i].cname + '</option>';
                }
                $('#levelThree').html(levelThreeSelect);
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
});
