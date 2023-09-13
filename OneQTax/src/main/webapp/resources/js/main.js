$(document).ready(function() {
    // Prevent default on anchor links
    $(document).on('click', 'a[href="#"]', function(e) {
        e.preventDefault();
    });

    // Approach section scrolling
    $(window).on('scroll resize', function() {
        var scrollPos = $(document).scrollTop();

        // Fix function
        if (scrollPos > 1250) {
            $('.fix .text').addClass('on');
        } else {
            $('.fix .text').removeClass('on');
        }

        if (scrollPos > 2700) {
            $('.fix .text').removeClass('on');
        }

        // Fix list function
        $('section.approach .inner .list li a').removeClass('on');
        if (scrollPos > 1250) {
            $('section.approach .inner .list li:eq(0) a').addClass('on');
        }
        if (scrollPos > 1650) {
            $('section.approach .inner .list li:eq(1) a').addClass('on');
        }
        if (scrollPos > 2050) {
            $('section.approach .inner .list li:eq(2) a').addClass('on');
        }
        if (scrollPos > 2550) {
            $('section.approach .inner .list li:eq(3) a').addClass('on');
        }
        if (scrollPos > 2900) {
            $('section.approach .inner .list li a').removeClass('on');
        }
    });

    // Scrolla initialization
    $('.animate').scrolla({
        mobile: true,
        once: false
    });

    $('.gnb > li > a').on('mouseenter focus', function() {
        var gnbindex = $('.gnb > li > a').index($(this));
        $('.gnb .inner').removeClass('on');
        $('.gnb .inner:eq(' + gnbindex + ')').addClass('on');
    });
    $('header').on('mouseleave', function() {
        $('.gnb .inner').removeClass('on');
    });

    //fixHeader
    var scrollFix = 0;
    scrollFix = $(document).scrollTop();
    fixHeader();

    // 윈도우창 조절시 이벤트
    $(window).on('scroll resize', function() {
        scrollFix = $(document).scrollTop();
        fixHeader();
    });

    // 고정헤더 함수
    function fixHeader() {
        if (scrollFix > 150) {
            $('header').addClass('on');
        } else {
            $('header').removeClass('on');
        }
    }

    // Slides function
    var slideIndex = 0;
    showSlides();

    function showSlides() {
        var slides = document.getElementsByClassName("mySlides");
        var container = document.querySelector('.Slidesbackground');

        if (container) {  // 만약 container가 존재한다면
            container.style.transform = `translateX(-${slideIndex * 1000}px)`;

            slideIndex++;

            if (slideIndex >= slides.length) {
                slideIndex = 0;
            }

            setTimeout(showSlides, 5000);
        }
    }
});
