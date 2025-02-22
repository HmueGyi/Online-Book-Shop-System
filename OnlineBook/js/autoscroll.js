let screenHeight= $(window).height();
let currentHeight=  $('.active').offset().top;
if(currentHeight>screenHeight*0.8){
    $(".sideBar").animate({
        scrollTop: currentHeight
    },1000)
}

