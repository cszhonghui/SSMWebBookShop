var validator;
$(document).ready(function() {
	// $.validator.setDefaults({
		//     //debug: true
		// });

		validator = $("#loginForm").validate( {
			rules : {
				uusername : {
					required : true
				},
				upassword : {
					required : true
				}
			},
			messages : {
				uusername : {
					required : "必须填写用户名"
				},
				upassword : {
					required : "必须填写密码"

				}
			}
		});
	});

// $(document).ready(function(){
//     $("#submit").click(function(){
//         $.post("User/login",{
//                 uusername:$("#uusername").val(),
//                 upassword:$("#upassword").val()
//             },
//             function(data){
//                 if(data=='success'){
//                     window.location.href="Page/index";
//                 }
//                 if(data=='false'){
//                     alert("账号或密码不正确");
//                 }
//                 if(data=='nameEmpty'){
//                     alert("账号不能为空");
//                 }
//                 if(data=='pwdEmpty'){
//                     alert("密码不能为空");
//                 }
//                  
//             });
//        
//        // window.location.href="Page/index";
//     });
// });
$(document).ready(function() {
	$("#submit").click(function() {
		$('#myModal').modal('show');
	});
});