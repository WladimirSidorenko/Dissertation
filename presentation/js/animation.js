function animate_right(obj, image_lr, image_rl, doc_width, doc_height, fly_time) {
    obj.attr('src', image_lr);
    var rotate = 'rotate(' + 45 + 'deg)';
    obj.css({
	position: 'absolute',
	top: (Math.random() * 100) + 'px',
        '-webkit-transform': rotate,
        '-moz-transform': rotate,
        '-o-transform': rotate,
        '-ms-transform': rotate,
        transform: rotate
    });
    obj.show();

    obj.animate(
	{
            left: doc_width + 'px',
            top: doc_height + 'px',
	}, fly_time,
	function() {
	    obj.hide();
	    obj.delay(5000 * Math.random());
	    animate_left(obj, image_lr, image_rl,
			 doc_width, doc_height, fly_time);
	}
    );
}

function animate_left(obj, image_lr, image_rl, doc_width, doc_height, fly_time) {
    obj.attr('src', image_rl);
    var rotate = 'rotate(' + -45 + 'deg)';
    obj.css({
	position: 'absolute',
	top: (Math.random() * 100) + 'px',
        '-webkit-transform': rotate,
        '-moz-transform': rotate,
        '-o-transform': rotate,
        '-ms-transform': rotate,
        transform: rotate
    });
    obj.show();

    obj.animate(
	{
            left: -doc_width + 'px',
            top: doc_height + 'px',
	}, fly_time,
	function() {
	    obj.hide();
	    obj.delay(5000 * Math.random());
	    animate_right(obj, image_lr, image_rl,
			  doc_width, doc_height, fly_time);
	}
    );
}

function fly_twit(image_lr, image_rl, speed=95, frequency=1, amplitude=100) {
    // generate document variables
    var doc_width = $(window).width() + 60;
    var doc_height = Math.random() * 10;
    var fly_time = doc_width/(speed/1000);

    // create image in document
    var img = $('<img class="twit_fly_img">');
    img.css({
	height: '35px',
	width: '35px',
	left: '-80px',
	'z-index': '10001',
    });
    $(".animate").each(
	function () {
	    $(this).parent().prepend(img.clone());
	}
    );
    // hide image & set it up to fly
    $("img.twit_fly_img").hide();
    animate_right(
	$(".reveal img.twit_fly_img"), image_lr, image_rl,
	doc_width, Math.random() * 10, fly_time
    );
}

$(document).ready(
    function(){
	fly_twit("img/twitter-logo-left-to-right.gif",
		 "img/twitter-logo-right-to-left.gif");
    });
