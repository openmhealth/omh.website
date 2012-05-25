$(document).ready(function(){
    if(('.carousel').length < 1)return
    carousel = {}
    carousel.x = localStorage.getItem('footerCarouselX')
    if(!carousel.x) carousel.x = 0 
    else carousel.x = parseInt(carousel.x)
    
    carousel.width = $('.carousel-inner .item').length * 320
    carousel.minX = carousel.width * -1  //2240
    carousel.minX = carousel.minX + 3*320
   
    if(carousel.x > 0) carousel.x = 0
    if(carousel.x < carousel.minX) carousel.x = carousel.minX
    $('.carousel-inner').css('margin-left', carousel.x)
   
    carousel.prev = function(){
        if(carousel.x <= carousel.minX) return
        carousel.x -= 320;
        $('.carousel-inner').css('position','relative')
        .animate({
            marginLeft:carousel.x
        }, 500,carousel.end)
      
    }
    
    carousel.next = function(){
        if(carousel.x == 0) 0
        carousel.x += 320;
        $('.carousel-inner').css('position','relative')
        .animate({
            marginLeft:carousel.x
        }, 500,carousel.end)
        carousel.end()  
    }
    
    carousel.end = function(){
        if(carousel.x == 0) $(".next").hide()
        else $(".next").show()
      
        if(carousel.x <= carousel.minX) $(".prev").hide()
        else $(".prev").show()
       
    //console.log('carousel.x '+carousel.x)
    //console.log('carousel.width '+carousel.width)
    }
    
    carousel.funk = carousel.prev
    
    carousel.go = function(){
        //console.log('carousel.go')
        localStorage.setItem('footerCarouselX', carousel.x)
        if(carousel.x == 0) carousel.funk = carousel.prev
        else if(carousel.x == carousel.minX) carousel.funk = carousel.next
        carousel.funk()
        carousel.timeout = setTimeout(carousel.go,5000)
    }
    
    $(".next").click(function(){
        carousel.next();
        clearTimeout(carousel.timeout)
    })
    $(".prev").click(function(){
        carousel.prev();
        clearTimeout(carousel.timeout)
    })
    carousel.timeout = setTimeout(carousel.go,5000)
})