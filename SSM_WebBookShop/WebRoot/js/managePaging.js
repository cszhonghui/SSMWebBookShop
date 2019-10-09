$(document).ready(function(){
	$("#modalUser").click(function(){
		$("#addUser").modal('show')
	});
	$("#submitUser").click(function(){
		$.ajax({
            type: "post",
            url: "User/register",
            data: {
                uusername:$("#uusername").val(),
                uemail:$("#uemail").val(),
                uphone:$("#uphone").val(),
                upassword:$("#upassword").val()
               
            },
            dataType: "text",
            success: function(result){
                if(result=='success'){
                	alert("新增普通用户成功");
                   window.location.href="User/paging";
                }
                else{
                	alert("增加失败");
                	window.location.href="User/paging";
                }
            },
            error: function() {
                alert("系统崩溃");
            }
        });
	});
	
	
	
	
	
	$("#modalMana").click(function(){
		$("#addMana").modal('show')
	});
	$("#submitMana").click(function(){
		$.ajax({
            type: "post",
            url: "Administrator/register",
            data: {
                ausername:$("#ausername").val(),
                apassword:$("#apassword").val()
            },
            dataType: "text",
            success: function(result){
                if(result=='success'){
                	alert("新增管理员成功");
                   window.location.href="User/paging";
                }
                else{
                	alert("增加失败");
                	window.location.href="User/paging";
                }
            },
            error: function() {
                alert("系统崩溃");
            }
        });
	})
});