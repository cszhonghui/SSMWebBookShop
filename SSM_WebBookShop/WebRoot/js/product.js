$(function(){
    $("#submit").click(function(){
        var number = $("#number").val();
        var bid = $("#bid").val();
        /* addGoodsInCart?bid=${book.bid}&number=" */
        $.get("Cart/addItem",{"cbnum":number,"book.bid":bid},function(result){       	
        	if(result=="success"){
        		   alert("成功添加入购物车");	
        	}
        	else if(result="usernull"){
        		 alert("仅限登录");
        		 window.location.href="login";
        	}
        	else{
        		   alert("加入购物车失败");	        		
        	}
        });
    })
})
$(function(){
    $("#buy").click(function(){
        var bnum = $("#number").val();
        var bid = $("#bid").val();
        var odprice=$("#odprice").text();
        var oamount=bnum*odprice;
        $.post("Order/buy",{"book.bid":bid,"bnum":bnum,"odprice":odprice,"oamount":oamount},function(result){
        	
        	if(result=="usernull"){
        		alert("仅限登录");
        		window.location.href="login";
        	}
        	else{
        		console.log('111');
        		window.location.href=("Order/settleOrder?onumber="+result);
        	
        	}
        
        });
    })
})
