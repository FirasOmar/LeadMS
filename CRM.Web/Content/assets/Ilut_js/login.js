jQuery(document).ready(function() {
    
	$("#newAccount").on("click",function(){
 		$(".login-content").css("margin-top","5%");
		$("#login-form").addClass("hide");
		$("#reg-form").removeClass("hide");
	});
	
	$("#haveOne").on("click",function(){
		$("#login-form").removeClass("hide");
		$("#reg-form").addClass("hide");
 		$(".login-content").css("margin-top","30%");
	});
	
	$("#forget-password").on("click",function(){
		$("#forget-form").removeClass("hide");
		$("#reg-form").addClass("hide");
		$("#login-form").addClass("hide");
 		$(".login-content").css("margin-top","30%");
	});
	
	$("#back-btn").on("click",function(){
		$("#forget-form").addClass("hide");
		$("#reg-form").addClass("hide");
		$("#login-form").removeClass("hide");
	 		$(".login-content").css("margin-top","30%");
	});
	
 });


