var validator;
$(document).ready(function () {
    $.validator.setDefaults({
        //debug: true
    });


    validator = $("#regForm").validate({
        rules: {
            username: {
                required: true
            },
            upassword: {
                required: true
            },
            repassword: {
                required: true,
                equalTo: "#upassword"
            },
            uemail:{
            	required:true
            },
            uphone:{
            	required:true
            }
        },
        messages: {
            username: {
                required: "必须填写用户名"
            },
            upassword: {
                required: "必须填写密码"
            },
            repassword: {
                required: "必须填写确认密码",
                equalTo: "两次输入的密码不一致"
            },
            uemail:{
            	required:"必须填写密码"
            },
            uphone:{
            	required:"必须填写电话"
            }
        }
    });
});
$(document).ready(function(){
    $("#submit").click(function(){
        $.ajax({
            type: "post",
            url: "User/register",
            data: {
                uusername:$("#uusername").val(),
                upassword:$("#upassword").val(),
                uemail:$("#uemail").val(),
                uphone:$("#uphone").val()
            },
            dataType: "text",
            success: function(result){
                if(result=='success'){
                   alert("注册成功，请登陆。");
                    window.location.href="login";
                }
                if(result=='false'){
                    alert("用户名已存在");
                }
               
            }
        });
    });
});