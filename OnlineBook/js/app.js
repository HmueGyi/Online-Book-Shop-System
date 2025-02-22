// $(".startbtn").click(function(){
//     console.log("Hello");
//    
//        $(".menu-icon").toggleClass("fa-bars fa-times");
// })
// let menuOpen=false;
// $(".startBtn").click(function () { 
//     // e.preventDefault();
//     if(!menuOpen){
//         $(".startBtn").addClass("open");
//         menuOpen=true;
//     }
//     else{
//         $(".startBtn").remove("open");
//         menuOpen=false;

//     }
// });
$(".startBtn").click(()=>{
    $(".startBtn").toggleClass("open");
    $(".contentBox").toggleClass("show")
})