function submit() {
    document.getElementById("searchInput").submit();
}
function changePage(page){
    var oid = $("#oid").val();
    var oname = $("#oname").val();
    window.location.href="/BookOrder.do?pageNum="+page+"&oid="+oid+"&oname="+oname;
}
// $(function() {
//     function changePage(page){
//         $.ajax({
//             type:"get",
//             contentType : "application/json",
//             url:"BookOrder.do",
//             data:{pageNum:page, oid:$("#oid").val(), oname:$("#oname").val(),
//                 success: function(data){
//                     $("#main").html(data);
//                 },
//                 error : function() {
//                     alert("error!");
//                 }
//             }
//
//         });
//     }
// });
/* $(function(){
		$("#submit").click(function(){
		var uid = $("#uid").val();
		var oname = $("#oname").val();
		var oaddress = $("#oaddress").val();
		/* addGoodsInCart?bid=${book.bid}&number="
		$.post("addBookOrder.do",{"uid":uid,"oname":oname,"oaddress":oaddress},function(){
			window.location.href="shoppingResult.do";
				});
			})
		}) */

function confirmOrder(){
	//选取收货地址id
	var rid=parseInt($("#rid").val());
	var oid=parseInt($("#orderid").val());
	var onumber=$("#onumber").val();
	$.get("Order/confirmOrder",{"oid":oid,"ostatus":2,"rid":rid,"onumber":onumber},function(data){
		if (data == 'success') {
			alert("提交成功")
        	window.location.href = "Order/queryByUidPage";
        } else {
            alert(data);
        }
	});
}
