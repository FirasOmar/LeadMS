


$("#btnArabic").click(function () {
    $("#btnArabic").addClass("btn-primary").removeClass("btn-secondary");
    $("#btnHebrew").addClass("btn-secondary").removeClass("btn-primary");

});

$("#btnHebrew").click(function () {
    $("#btnHebrew").addClass("btn-primary").removeClass("btn-secondary");
    $("#btnArabic").addClass("btn-secondary").removeClass("btn-primary");

});


$("#btnArabicEdit").click(function () {
    $("#btnArabicEdit").addClass("btn-primary").removeClass("btn-secondary");
    $("#btnHebrewEdit").addClass("btn-secondary").removeClass("btn-primary");

});

$("#btnHebrewEdit").click(function () {
    $("#btnHebrewEdit").addClass("btn-primary").removeClass("btn-secondary");
    $("#btnArabicEdit").addClass("btn-secondary").removeClass("btn-primary");

});





$("#btnArabicDetails").click(function () {
    $("#btnArabicDetails").addClass("btn-primary").removeClass("btn-secondary");
    $("#btnHebrewDetails").addClass("btn-secondary").removeClass("btn-primary");

});

$("#btnHebrewDetails").click(function () {
    $("#btnHebrewDetails").addClass("btn-primary").removeClass("btn-secondary");
    $("#btnArabicDetails").addClass("btn-secondary").removeClass("btn-primary");

});


$("#btnArabicEditDetails").click(function () {
    $("#btnArabicEditDetails").addClass("btn-primary").removeClass("btn-secondary");
    $("#btnHebrewEditDetails").addClass("btn-secondary").removeClass("btn-primary");

});

$("#btnHebrewEditDetails").click(function () {
    $("#btnHebrewEditDetails").addClass("btn-primary").removeClass("btn-secondary");
    $("#btnArabicEditDetails").addClass("btn-secondary").removeClass("btn-primary");

});


$('li.has-ul').click(function () {
    $(this).children('.sub-ul').slideToggle(500);
    $(this).toggleClass('active');
});