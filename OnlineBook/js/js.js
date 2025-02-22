new WOW().init();

$(document).ready(function(){
   $(window).scroll(function() {
    let windowHeight=$(window).height();
    let current_height=$(this).scrollTop();
    console.log(current_height);
    if (current_height> windowHeight-90) {
        console.log("hello");

        $(".navigation").addClass("desktopbar");
    }
    else{
        $(".navigation").removeClass("desktopbar");
        $(`.nav-link[href='#about']`).removeClass("createline");
        $(`.nav-link[href='#home']`).addClass("createline");
    }
   
   })
})