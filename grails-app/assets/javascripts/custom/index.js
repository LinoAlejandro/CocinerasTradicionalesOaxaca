function resizeMobile() {
    if($('.nav-item').hasClass('mr-3')) {
        $('.nav-item').removeClass('mr-3');
        $('.nav-item').css('outline-width', '0px');
        $('.row').addClass('justify-content-center');
        $('#calendarDiv').addClass('mt-4');
    }
}

function resizeTablet() {
    if(!$('.nav-item').hasClass('mr-3')) {
        $('.nav-item').addClass('mr-3');
        $('.nav-item').css('outline-width', '5px');
        $('#calendarDiv').removeClass('mt-4');
    }
}

$(window).resize(function() {
    window.innerWidth < 992 ? resizeMobile() : resizeTablet()
    window.innerWidth < 768 ? $('#navbarBrand').css("display", "none") : $('#navbarBrand').css("display", "inline");
});

$(document).ready(function() {
    window.innerWidth < 992 ? resizeMobile() : resizeTablet()
});
