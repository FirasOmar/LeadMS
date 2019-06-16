var numofqus =10;
var current=0;
var qus = [];
var ans = [];
var rc = [];
var corr =0;


$(function(){
    
    Access.init();
    
});


var Access={
    fontsize:0,
    maxfont:0,
    minfont:0,
    ofontsize:0,
    init:function(){
        
        this.fontsizes=this.ofontsize=parseInt($('body').css('fontSize'));
        
        $('#accessBtn').click(function(){$(this).parent().toggleClass('active');return false;});
        $('.small-letter').click(function(){Access.fontsizer(-2)});
        $('.big-letter').click(function(){Access.fontsizer(2)});
        $('.acp-font-reset').click(function(){Access.fontsizer(0)});
        $('.acp-dark-btn').click(function(){$('#wrapper').toggleClass('accessContrast'),$(this).toggleClass('active');});
        $('.acp-grayscale').click(function(){$('#wrapper').toggleClass('accessGray'),$(this).toggleClass('active');});
        $(".acp-toggle-underline").click(Access.links);
        
    },
    links:function(){
            $('html').toggleClass('linkUnderline');
    }
    ,
    fontsizer:function(add){
  if((this.fontsizes + add)<16){
add=0;
}else if((this.fontsizes + add)>36){
add=0;

}else{
        this.fontsizes+=add;
		
$( "#wrapper h1" ).each(function( index ) {
        this.fontsize=this.ofontsize=parseInt($(this).css('fontSize'));
		if(add==0){
			  $(this).removeAttr('style');	
		}else{
		$(this).css('fontSize',this.fontsize+add);
		}
});

$( "#wrapper  h2" ).each(function( index ) {
        this.fontsize=this.ofontsize=parseInt($(this).css('fontSize'));
		if(add==0){
			  $(this).removeAttr('style');	
		}else{
		$(this).css('fontSize',this.fontsize+add);
		}
});
$( "#wrapper h3" ).each(function( index ) {
        this.fontsize=this.ofontsize=parseInt($(this).css('fontSize'));
	if(add==0){
			  $(this).removeAttr('style');	
		}else{
		$(this).css('fontSize',this.fontsize+add);
		}
});
$( "#wrapper a" ).each(function( index ) {
        this.fontsize=this.ofontsize=parseInt($(this).css('fontSize'));
	if(add==0){
			  $(this).removeAttr('style');	
		}else{
		$(this).css('fontSize',this.fontsize+add);
		}
});
$( "#wrapper span" ).each(function( index ) {
        this.fontsize=this.ofontsize=parseInt($(this).css('fontSize'));
	if(add==0){
			  $(this).removeAttr('style');	
		}else{
		$(this).css('fontSize',this.fontsize+add);
		}
});
$( "#wrapper div" ).each(function( index ) {
        this.fontsize=this.ofontsize=parseInt($(this).css('fontSize'));
	if(add==0){
			  $(this).removeAttr('style');	
		}else{
		$(this).css('fontSize',this.fontsize+add);
		}
});
}
     },
    darktheme:function(){
        $('html').attr('data-contrast','high');
        $('p,h1,h2,strong,span,a,li').css('color','black');
        $('#linker').css('background','white');
    },
    grayscale:function(){
        
    }
}