function resizePage(){
    var height = ($('.video-container').width()*.335)+'px';
    $('.video-container').css('height', height);
    $('.video-container #player').css('height', height);
    $('.video-container #video_play_btn').css('left', ($('.video-container').width() / 2) - 75);
    var imgLeft = (($('.noslider').width() - $('.noslider img').width())/2.0)+'px';
    $('.noslider img').css('left', imgLeft);
    $('#mega-menu-tut li.dc-mega-li').each(function(e){
        var left = '-'+(document.getElementById('mega-menu-tut').offsetLeft)+'px',
            padLeft='0 '+($('div.wrapper').get(0).offsetLeft+1)+'px';
        $('div.sub-container.mega', this).css({'left':left,'width':$('div.wrapper').width(), 'margin-left':'0','padding': padLeft});
    });
}

function slideChange(args) {
    $('.sliderContainer .slideSelectors .item').removeClass('selected');
    $('.sliderContainer .slideSelectors .item:eq(' + (args.currentSlideNumber-1) + ')').addClass('selected');
            }

            function slideComplete(args) {
                $(args.sliderObject).find('.text1, .text2').attr('style', '');
                $(args.currentSlideObject).find('.text1').animate({
                    right: '100px',
                    opacity: '0.8'
                }, 400, 'easeOutQuint');
                $(args.currentSlideObject).find('.text2').delay(200).animate({
                    right: '50px',
                    opacity: '0.8'
                }, 400, 'easeOutQuint');
            }

            function sliderLoaded(args) {
                slideComplete(args);
                slideChange(args);
                resizePage();
            }

function showvalue(arg) {
    alert(arg);
    //arg.visible(false);
}

function mycarousel_initCallback(carousel)
{
    // Disable autoscrolling if the user clicks the prev or next button.
    carousel.buttonNext.bind('click', function() {
        carousel.startAuto(0);
    });

    carousel.buttonPrev.bind('click', function() {
        carousel.startAuto(0);
    });

    // Pause autoscrolling if the user moves with the cursor over the clip.
    carousel.clip.hover(function() {
        carousel.stopAuto();
    }, function() {
        carousel.startAuto();
    });
};

$(document).ready(function() {
    //slides the element with class "menu_body" when paragraph with class "menu_head" is clicked 
    $("#firstpane p.menu_head").click(function() {
        if($("#firstpane p").attr('alt')=="minus") {
            $("#firstpane p").attr('alt', '');
            $(this).css({backgroundImage:"url(/images/plus.png)"}).next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
            $(this).siblings().css({backgroundImage:"url(/images/plus.png)"});
        } else {
            $("#firstpane p").attr('alt', 'minus');
            $(this).css({backgroundImage:"url(/images/minus.png)"}).next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
            $(this).siblings().css({backgroundImage:"url(/images/minus.png)"});
        }
    });
    //slides the element with class "menu_body" when mouse is over the paragraph
    $("#secondpane p.menu_head").mouseover(function() {
        $(this).css({backgroundImage:"url(/images/minus.png)"}).next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
        $(this).siblings().css({backgroundImage:"url(/images/minus.png)"});
    });
    $('.iosSlider').iosSlider({
        desktopClickDrag: true,
        snapToChildren: true,
        infiniteSlider: true,
        navSlideSelector: '.sliderContainer .slideSelectors .item',
        onSlideComplete: slideComplete,
        onSliderLoaded: sliderLoaded,
        onSlideChange: slideChange,
        autoSlide: true,
        scrollbar: true,
        scrollbarContainer: '.sliderContainer .scrollbarContainer',
        scrollbarMargin: '0',
        scrollbarBorderRadius: '0',
        keyboardControls: true,
        autoSlideTimer: 4000,
        autoSlideTransTimer: 1000
    });
    $('.video-container').mouseover(function() {
        $('#btn_hover').show(0);
    }).mouseout( function(){
        $('#btn_hover').hide(0);
    });

    window.onresize = function (){
        resizePage();
    };
    resizePage();

    try {
        //$("body select").msDropDown();
        $("#websites1").msDropDown({useSprite:'sprite'})
            $("#ver").html($.msDropDown.version);
    } catch(e) {
        alert("Error: "+e.message);
    }

    jQuery('#mycarousel').jcarousel({
        auto: .01,
        easing: 'linear',
        wrap: 'circular',
        animation: 3500
    });

    if(Modernizr.touch) {
        $('li.top-level-link').show();
        $('#mega-menu-tut').dcMegaMenu({
            event: 'click',
            rowItems: '5',
            speed: 'fast'
        });
    } else {
        $('#mega-menu-tut').dcMegaMenu({
            rowItems: '5',
            speed: 'fast'
        });
    }
    $('.toggle-mobile-accordion-button').click(function() { $('.mobile-menu-accordion').toggleClass('show'); });
    $('.toggle-mobile-accordion').click(function(e) { $(e.target).siblings('div').toggle(); });
});
