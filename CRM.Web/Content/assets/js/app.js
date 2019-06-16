$(document).ready(function(){
    $('.main-menu > li > a').click(function(){
        
        if($(this).parent('li').hasClass('is-active')) {
            $(this).parent('li').removeClass('is-active');
        } else {
            $(this).parent('li').addClass('is-active');
        }
        
    });

    $('.menu-toggle').click(function(){
        $('.main-menu').addClass('is-active');
        $('.menu-hide').addClass('is-active');
        $('.top-nav').removeClass('is-active');
    });

    $('.top-nav-toggle').click(function(){
        $('.top-nav').toggleClass('is-active');
    });

    $('.menu-hide').click(function(){
        $('.main-menu').removeClass('is-active');
        $('.menu-hide').removeClass('is-active');
    });

    $('.sidebar-toggle').click(function() {
       $('.sidebar').addClass('is-active');
       $('.sidebar-overlay').addClass('is-active');
    });

    $('.sidebar-close').click(function() {
        hideNav();
    });

    $('.sidebar-overlay').click(function() {
        hideNav();
    });

    function hideNav() {
        $('.sidebar').removeClass('is-active');
        $('.sidebar-overlay').removeClass('is-active');
    }

    // comment it bcz we have code in event page
//    var countdown = document.querySelector('.countdown');

//// Set Launch Date (ms)
//    var launchDate = new Date('Jan 1, 2019 13:00:00').getTime();

//// Update every second
//    var intvl = setInterval(function () {
//        // Get todays date and time (ms)
//        var now = new Date().getTime();

//        // Distance from now and the launch date (ms)
//        var distance = launchDate - now;

//        // Time calculation
//        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
//        var hours = Math.floor(
//            distance % (1000 * 60 * 60 * 24) / (1000 * 60 * 60));

//        var mins = Math.floor(distance % (1000 * 60 * 60) / (1000 * 60));
//        var seconds = Math.floor(distance % (1000 * 60) / 1000);

//        // Display result
//        countdown.innerHTML = '\n  <div>' +
//            days + '<span>أيام</span></div> \n  <div>' +
//            hours + '<span>ساعة</span></div>\n  <div>' +
//            mins + '<span>دقيقة</span></div>\n  <div>' +
//            seconds + '<span>ثانية</span></div>\n  ';


//        // If launch date is reached
//        if (distance < 0) {
//            // Stop countdown
//            clearInterval(intvl);
//            // Style and output text
//            countdown.style.color = '#17a2b8';
//            countdown.innerHTML = 'Launched!';
//        }
//    }, 1000);
});