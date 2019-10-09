var validator;
$(document).ready(function () {
    $.validator.setDefaults({
        //debug: true
    });

    validator = $("#Form").validate({
        rules: {
            upassword: {
                required: true,
            },
            unewpassword: {
                required: true,
            },
            repassword: {
                required: true,
                equalTo: "#unewpassword"
            }
        },
        messages: {
            upassword: {
                required: "必须填写旧密码",
            },
            unewpassword: {
                required: "必须填写密码",
            },
            repassword: {
                required: "必须填写确认密码",
                equalTo: "两次输入的密码不一致"
            }
        }
    });
});
$(document).ready(function(){
    $("#submit").click(function(){
        $.post("User/resetPwd",{
                uid:$("#uid").val(),
                upassword:$("#upassword").val(),
                unewpassword:$("#unewpassword").val(),
                uusername:$("#uusername").val()
            },
            function(data){
                if(data=='success'){
                    alert("修改密码成功");
                    window.location.href="index";
                }
                if(data=='false'){
                    alert("旧密码输入有误");
                     window.location.href="resetPwd";
                }
                if(data=='pwdEmpty'){
                    alert("密码不能为空");
                     window.location.href="resetPwd";
                }
                if(data=='newEmpty'){
                    alert("确认密码不能为空");
                     window.location.href="resetPwd";
                }
            });
    });
});