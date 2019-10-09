var validator;
$(document).ready(function () {
    $.validator.setDefaults({
    });

    validator = $("#Form").validate({
        rules: {
            uname: {
                required: true
            },
            uphone: {
                required: true,
                minlength: 11,
                maxlength: 11
            },
            uemail: {
                required: true,
                email:true
            }
        },
        messages: {
            uname: {
                required: "必须填写用户名"
            },
            uphone: {
                required: "必须填写电话",
                minlength: "电话号码长度不正确",
                maxlength: "电话号码长度不正确"
            },
            uemail: {
                required: "必须填写邮箱",
                email:"邮箱格式有误"
            }
        }
    });

});

$("#ubirthdate").change(function(){
    $("#ubirthdate").attr("value",$(this).val()); //赋值
});
$(document).ready(function(){
    $("#submit").click(function(){
        $.ajax({
            type: "post",
            url: "User/modifyinfo",
            data: {
                uusername:$("#uusername").val(),
                ugender:$('input[type=radio][name=ugender]:checked').val(),
                uemail:$("#uemail").val(),
                uphone:$("#uphone").val(),
                ubirthdate:$("#ubirthdate").val()
               
            },
            dataType: "text",
            success: function(result){
                if(result=='success'){
                	alert("修改个人信息成功！");
                   window.location.href="index";
                }
                else{
                	alert("修改信息失败");
                }
            },
            error: function() {
                alert("系统崩溃");
            }
        });
    });
});