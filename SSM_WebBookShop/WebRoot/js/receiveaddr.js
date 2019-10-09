$(document).ready(function(){
	$("#modal").click(function(){
		$("#addAddr").modal('show')
	});
	$("#submitaddr").click(function(){
		$.ajax({
            type: "post",
            url: "Receive/addReceive",
            data: {
                uid:$("#uid").val(),
                rmailaddr:$("#nrmailaddr").val(),
                rphone:$("#nrphone").val(),
                rtargetname:$("#nrtargetname").val()
               
            },
            dataType: "text",
            success: function(result){
            	
                if(result=='success'){
                	alert("新增地址成功");
                   window.location.href="Receive/queryByUid?uid="+$('#uid').val();
                }
                else{
                	alert("增加地址失败失败");
                	window.location.href="Receive/queryByUid?uid="+$('#uid').val();
                }
            },
            error: function() {
                alert("系统崩溃");
            }
        });
	})
});