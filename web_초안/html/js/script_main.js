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
});


$(function(){
    $('.gnb > li > a').on('mouseenter focus', function(){ // 'ali'를 'li'로 수정
        var gnbindex = $('.gnb > li > a').index($(this));
        $('.gnb .inner').removeClass('on');
        $('.gnb .inner:eq('+ gnbindex +')').addClass('on');
    });
    $('header').on('mouseleave', function(){
        $('.gnb .inner').removeClass('on');
    });
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
function fixHeader(){
    if (scrollFix > 150){
        $('header').addClass('on');
    } else {
        $('header').removeClass('on');
    }
}



// $(document).on('click', 'a[href="#"]', function(e) {
//     e.preventDefault();
// });

// //1.approach영역
// $(window).on('scroll resize', function(){
//     var scrollPos = 0;
//     scrollPos = $(document).scrollTop();
//     fix();
//     fixList()
//     function fix(){
//         if(scrollPos > 1250) {$('.fix .text').addClass('on');}
//         else {$('.fix .text').removeClass('on');}
//         if(scrollPos > 2700) {$('.fix .text').removeClass('on');}
//     }

//     function fixList(){
//         $('section.approach .inner .list li a').removeClass('on');
//         if(scrollPos > 1250){
//             $('section.approach .inner .list li a').removeClass('on');
//             $('section.approach .inner .list li:eq(0) a').addClass('on');
//         }if(scrollPos > 1650){
//                 $('section.approach .inner .list li a').removeClass('on');
//                 $('section.approach .inner .list li:eq(1) a').addClass('on');
//         }if(scrollPos > 2050){
//             $('section.approach .inner .list li a').removeClass('on');
//             $('section.approach .inner .list li:eq(2) a').addClass('on');
//         }if(scrollPos > 2550){
//             $('section.approach .inner .list li a').removeClass('on');
//             $('section.approach .inner .list li:eq(3) a').addClass('on');
//         }if(scrollPos > 2900){
//             $('section.approach .inner .list li a').removeClass('on');
//         }

//         }
//     });

// // 2. 스크롤 이벤트
// $(function(){
//     $('.animate').scrolla({
//         mobile:true,
//         once:false
//     });
// });