(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
// Hide Header on on scroll down
var didScroll;
var lastScrollTop = 0;
var delta = 5;
var navbarHeight = $('header').outerHeight();

$(window).scroll(function(event){
    didScroll = true;
});

setInterval(function() {
    if (didScroll) {
        hasScrolled();
        didScroll = false;
    }
}, 250);

function hasScrolled() {
    var st = $(this).scrollTop();
    
    // Make sure they scroll more than delta
    if(Math.abs(lastScrollTop - st) <= delta)
        return;
    
    // If they scrolled down and are past the navbar, add class .nav-up.
    // This is necessary so you never see what is "behind" the navbar.
    if (st > lastScrollTop && st > navbarHeight){
        // Scroll Down
        $('header nav').removeClass('navbar-fixed-top');
    } else {
        // Scroll Up
        if(navbarHeight > lastScrollTop) {
            $('header nav').removeClass('navbar-fixed-top');
        }else if(st + $(window).height() < $(document).height()) {
            $('header nav').addClass('navbar-fixed-top');
        }
    }
    
    lastScrollTop = st;
}

//Slider
$('#myCarousel').carousel({
	interval: 4000
}); 
},{}]},{},[1])
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyaWZ5L25vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCJzcmMvanMvbWFpbiJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQTtBQ0FBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSIsImZpbGUiOiJnZW5lcmF0ZWQuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlc0NvbnRlbnQiOlsiKGZ1bmN0aW9uIGUodCxuLHIpe2Z1bmN0aW9uIHMobyx1KXtpZighbltvXSl7aWYoIXRbb10pe3ZhciBhPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7aWYoIXUmJmEpcmV0dXJuIGEobywhMCk7aWYoaSlyZXR1cm4gaShvLCEwKTt2YXIgZj1uZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK28rXCInXCIpO3Rocm93IGYuY29kZT1cIk1PRFVMRV9OT1RfRk9VTkRcIixmfXZhciBsPW5bb109e2V4cG9ydHM6e319O3Rbb11bMF0uY2FsbChsLmV4cG9ydHMsZnVuY3Rpb24oZSl7dmFyIG49dFtvXVsxXVtlXTtyZXR1cm4gcyhuP246ZSl9LGwsbC5leHBvcnRzLGUsdCxuLHIpfXJldHVybiBuW29dLmV4cG9ydHN9dmFyIGk9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtmb3IodmFyIG89MDtvPHIubGVuZ3RoO28rKylzKHJbb10pO3JldHVybiBzfSkiLCIvLyBIaWRlIEhlYWRlciBvbiBvbiBzY3JvbGwgZG93blxudmFyIGRpZFNjcm9sbDtcbnZhciBsYXN0U2Nyb2xsVG9wID0gMDtcbnZhciBkZWx0YSA9IDU7XG52YXIgbmF2YmFySGVpZ2h0ID0gJCgnaGVhZGVyJykub3V0ZXJIZWlnaHQoKTtcblxuJCh3aW5kb3cpLnNjcm9sbChmdW5jdGlvbihldmVudCl7XG4gICAgZGlkU2Nyb2xsID0gdHJ1ZTtcbn0pO1xuXG5zZXRJbnRlcnZhbChmdW5jdGlvbigpIHtcbiAgICBpZiAoZGlkU2Nyb2xsKSB7XG4gICAgICAgIGhhc1Njcm9sbGVkKCk7XG4gICAgICAgIGRpZFNjcm9sbCA9IGZhbHNlO1xuICAgIH1cbn0sIDI1MCk7XG5cbmZ1bmN0aW9uIGhhc1Njcm9sbGVkKCkge1xuICAgIHZhciBzdCA9ICQodGhpcykuc2Nyb2xsVG9wKCk7XG4gICAgXG4gICAgLy8gTWFrZSBzdXJlIHRoZXkgc2Nyb2xsIG1vcmUgdGhhbiBkZWx0YVxuICAgIGlmKE1hdGguYWJzKGxhc3RTY3JvbGxUb3AgLSBzdCkgPD0gZGVsdGEpXG4gICAgICAgIHJldHVybjtcbiAgICBcbiAgICAvLyBJZiB0aGV5IHNjcm9sbGVkIGRvd24gYW5kIGFyZSBwYXN0IHRoZSBuYXZiYXIsIGFkZCBjbGFzcyAubmF2LXVwLlxuICAgIC8vIFRoaXMgaXMgbmVjZXNzYXJ5IHNvIHlvdSBuZXZlciBzZWUgd2hhdCBpcyBcImJlaGluZFwiIHRoZSBuYXZiYXIuXG4gICAgaWYgKHN0ID4gbGFzdFNjcm9sbFRvcCAmJiBzdCA+IG5hdmJhckhlaWdodCl7XG4gICAgICAgIC8vIFNjcm9sbCBEb3duXG4gICAgICAgICQoJ2hlYWRlciBuYXYnKS5yZW1vdmVDbGFzcygnbmF2YmFyLWZpeGVkLXRvcCcpO1xuICAgIH0gZWxzZSB7XG4gICAgICAgIC8vIFNjcm9sbCBVcFxuICAgICAgICBpZihuYXZiYXJIZWlnaHQgPiBsYXN0U2Nyb2xsVG9wKSB7XG4gICAgICAgICAgICAkKCdoZWFkZXIgbmF2JykucmVtb3ZlQ2xhc3MoJ25hdmJhci1maXhlZC10b3AnKTtcbiAgICAgICAgfWVsc2UgaWYoc3QgKyAkKHdpbmRvdykuaGVpZ2h0KCkgPCAkKGRvY3VtZW50KS5oZWlnaHQoKSkge1xuICAgICAgICAgICAgJCgnaGVhZGVyIG5hdicpLmFkZENsYXNzKCduYXZiYXItZml4ZWQtdG9wJyk7XG4gICAgICAgIH1cbiAgICB9XG4gICAgXG4gICAgbGFzdFNjcm9sbFRvcCA9IHN0O1xufVxuXG4vL1NsaWRlclxuJCgnI215Q2Fyb3VzZWwnKS5jYXJvdXNlbCh7XG5cdGludGVydmFsOiA0MDAwXG59KTsgIl19
