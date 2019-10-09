//$(document).ready(function() {
//	$("#submit").click(function(){
//		
//		$.ajax({
//            type: "post",
//            url: "Administrator/login",
//            data: {
//                ausername:$("#username").val(),
//                apassword:$("#password").val()              
//            },
//            dataType: "text",
//            success : function(result) {
//            			alert('hh');
//						if (result == 'win') {
//							
//							window.location.href = "Page/managerIndex";
//						}
//						if (result == 'success') {
//							alert(result);
//							window.location.href = "Page/managerIndex";
//						}
//						
//						if (result == 'false') {
//
//							alert("账号或密码不正确");
//							window.location.href = "Page/managerLogin";
//						}
//						if (result == 'nameEmpty') {
//
//							alert("账号不能为空");
//							window.location.href = "Page/managerLogin";
//						}
//						if (result == 'pwdEmpty') {
//
//							alert("密码不能为空1111");
//							window.location.href = "Page/managerLogin";
//						}
//					},
//					error : function() {
//
//						alert("登陆失败");
//						window.location.href = "Page/managerLogin";
//					}
//        });
//		
//		
//	});
//	
//});