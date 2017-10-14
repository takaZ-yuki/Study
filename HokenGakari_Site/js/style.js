xday = new Date()
xday.setDate(xday.getDate() - 7)
xday = xday.getFullYear() * 10000 + (xday.getMonth() + 1) * 100 + xday.getDate()


$(function(){
	// MOUSEOVER CHANGE IMAGE ALPHA
	$('a').each(function(){
		if (! $(this).parent().parent().parent().is('#ss'))
			$(this).hover(function(){
				$('img',this).stop().css('opacity', 0.7)
			},function(){
				$('img',this).fadeTo(500, 1)
			})
	})

	// ICON ROLLOVER (SHOW TEXT)
	$('#icon img').hover(function(){
		$('#icon-text').text($(this).attr('alt'))
	},function(){
		$('#icon-text').text('')
	})

	// SCROLL TO PAGE TOP
	$('#pagetop a').click(function(){
		$('body,html').animate({scrollTop:0}, 500)
		return false
	})

	// HOTTI NO SASAYAKI
	$('#sasayaki').click(function(){
		$('#form-sasayaki').submit()
		return false
	})
})


$.fn.accordion = function() {
	return this.css('cursor','pointer').hover(function(){
		$(this).addClass('o')
	},function(){
		$(this).removeClass('o')
	}).click(function(){
		$(this).next().toggle()
	})
}

$.fn.selectCategory = function(target) {
	return this.click(function(){
		var href = $(this).attr('href')
		$(this).parent().addClass('this').siblings().removeClass()
		$(target).hide().filter(href != '#' ? href : $(this).data('cat')).show()
		return false
	}).first().parent().addClass('this').end().end()
}

$.fn.addNewIcon = function() {
	return this.each(function(){
		var update = $(this).data('update')
		if (update == $(this).parent().data('update') && update >= xday) {
			$('h3', this).append('<span class="new">NEW!</span>')
		}
	})
}


$.fn.slideshow = function() {
	return this.each(function(){
		function slideshow(click) {
			if (click && ! $slideshow_li.eq(slideshow_i).is('.now')) {
				$slideshow_youtube.each(function(){
					$(this).html('<img src="13/img/yt-' + $(this).data('id') + '.jpg" alt="">')
				})
			}
			$slideshow_img.hide().eq(slideshow_i).show()
			$slideshow_li.removeClass().eq(slideshow_i).addClass('now')
			if (slideshow_i == 0 || click) {
				clearInterval(slideshow_timer)
			}
			slideshow_i++
			if (slideshow_i == img_num) {
				slideshow_i = 0
			}
		}
		$slideshow_img = $(this).find('p')
		$slideshow_youtube = $slideshow_img.filter('.youtube')
		
		// YouTube用
		$slideshow_youtube.click(function(){
			$(this).html('<iframe src="http://www.youtube.com/embed/' + $(this).data('id') + '?rel=0&showinfo=0&wmode=transparent&autoplay=1" width="920" height="460" frameborder="0"></iframe>')
			clearInterval(slideshow_timer)
		})
		
		img_num = i = $slideshow_img.length
		if (i > 1) {
			str = '<ul>'
			while (i--) {
				str += '<li>●'
			}
			$slideshow_li = $(this).append(str + '</ul>').find('li').click(function(){
				slideshow_i = $(this).index()
				slideshow(1)
			})
			$slideshow_li.first().addClass('now')
			slideshow_i = 1
			var slideshow_timer = setInterval(slideshow, 3000)
		}
	})
}

function corner(target, num) {
	$.getScript('http://cachedcommons.org/cache/jquery-corner/2.0.9/javascripts/jquery-corner.js',function(){
		$(target).corner('5px')
	})
}





(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-51871161-2', 'ikimonogakari.com');
ga('send', 'pageview');

$(function(){

    var ua = navigator.userAgent.toLowerCase()
    var device_name = ua.match(/iphone|ipod|android/i) && ua.match(/mobile/i) ? '[sp] ' : ua.match(/ipad|android/i) ? '[tb] ' : '[pc] '
    var body = $('body')

    body.on('click', 'a, b, area', function(){
        var category = $(this).attr('href') || this.tagName
        var tags = $(this).parents().map(function(){
            var id_name = $(this).attr('id')
            var tag_name = this.tagName.toLowerCase()
            if (tag_name != 'body' && tag_name != 'html' && id_name) {
                return '#' + id_name
            }
        }).get().reverse().join(' ')
        var action = device_name + tags
        var label = $(this).text() || $(this).attr('alt') || ''
        if (! label) {
            $(this).find('img').each(function(){
                label += $(this).attr('alt')
            })
        }
        ga('send', 'event', category, action, label)
    })
})
