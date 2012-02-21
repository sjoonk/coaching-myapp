(function(a){function b(b,c){function w(a){if(!(g.ratio>=1)){o.now=Math.min(i[c.axis]-j[c.axis],Math.max(0,o.start+((k?a.pageX:a.pageY)-p.start)));n=o.now*h.ratio;g.obj.css(l,-n);j.obj.css(l,o.now)}return false}function v(b){a(document).unbind("mousemove",w);a(document).unbind("mouseup",v);j.obj.unbind("mouseup",v);document.ontouchmove=j.obj[0].ontouchend=document.ontouchend=null;return false}function u(b){if(!(g.ratio>=1)){var b=b||window.event;var d=b.wheelDelta?b.wheelDelta/120:-b.detail/3;n-=d*c.wheel;n=Math.min(g[c.axis]-f[c.axis],Math.max(0,n));j.obj.css(l,n/h.ratio);g.obj.css(l,-n);b=a.event.fix(b);b.preventDefault()}}function t(b){p.start=k?b.pageX:b.pageY;var c=parseInt(j.obj.css(l));o.start=c=="auto"?0:c;a(document).bind("mousemove",w);document.ontouchmove=function(b){a(document).unbind("mousemove");w(b.touches[0])};a(document).bind("mouseup",v);j.obj.bind("mouseup",v);j.obj[0].ontouchend=document.ontouchend=function(b){a(document).unbind("mouseup");j.obj.unbind("mouseup");v(b.touches[0])};return false}function s(){j.obj.bind("mousedown",t);j.obj[0].ontouchstart=function(a){a.preventDefault();j.obj.unbind("mousedown");t(a.touches[0]);return false};i.obj.bind("mouseup",w);if(c.scroll&&this.addEventListener){e[0].addEventListener("DOMMouseScroll",u,false);e[0].addEventListener("mousewheel",u,false)}else if(c.scroll){e[0].onmousewheel=u}}function r(){j.obj.css(l,n/h.ratio);g.obj.css(l,-n);p["start"]=j.obj.offset()[l];var a=m.toLowerCase();h.obj.css(a,i[c.axis]);i.obj.css(a,i[c.axis]);j.obj.css(a,j[c.axis])}function q(){d.update();s();return d}var d=this;var e=b;var f={obj:a(".viewport",b)};var g={obj:a(".inner",b)};var h={obj:a(".scrollbar",b)};var i={obj:a(".track",h.obj)};var j={obj:a(".thumb",h.obj)};var k=c.axis=="x",l=k?"left":"top",m=k?"Width":"Height";var n,o={start:0,now:0},p={};this.update=function(a){f[c.axis]=f.obj[0]["offset"+m];g[c.axis]=g.obj[0]["scroll"+m];g.ratio=f[c.axis]/g[c.axis];h.obj.toggleClass("disable",g.ratio>=1);i[c.axis]=c.size=="auto"?f[c.axis]:c.size;j[c.axis]=Math.min(i[c.axis],Math.max(0,c.sizethumb=="auto"?i[c.axis]*g.ratio:c.sizethumb));h.ratio=c.sizethumb=="auto"?g[c.axis]/i[c.axis]:(g[c.axis]-f[c.axis])/(i[c.axis]-j[c.axis]);n=a=="relative"&&g.ratio<=1?Math.min(g[c.axis]-f[c.axis],Math.max(0,n)):0;n=a=="bottom"&&g.ratio<=1?g[c.axis]-f[c.axis]:isNaN(parseInt(a))?n:parseInt(a);r()};return q()}a.tiny=a.tiny||{};a.tiny.scrollbar={options:{axis:"y",wheel:40,scroll:true,size:"auto",sizethumb:"auto"}};a.fn.tinyscrollbar=function(c){var c=a.extend({},a.tiny.scrollbar.options,c);this.each(function(){a(this).data("tsb",new b(a(this),c))});return this};a.fn.tinyscrollbar_update=function(b){return a(this).data("tsb").update(b)};})(jQuery)

// Original Author Lin.K.
// null @ klin.pe.kr
// 2012.Feb.

$(document).ready(function(){
	var docuheight = parseInt( $(document).height() ) - 25;
	//$(".wrapper").css({height: docuheight});
	//CSS Controler
	var faderHeight = parseInt($(document).height())+50;
	$(".fader").css({opacity:"0.5",height:faderHeight+"px"});
	$(".sdms_img .pannel").css({opacity:"0.7"});

	$(".btn_fade").hover(
		function() { $(this).stop().animate({opacity:"0.7"}, 500); },
		function() { $(this).stop().animate({opacity:"1"}, 500); }
	);

	//Action Controler
	// $(".top_quick .dep1").hover(
	// 	function() {
	// 		$(this).children(".dep2").stop(true, true).slideToggle("fast");
	// 	}
	// );
	
	$(".signup_list>li>a").click(function() { // index signup popup
		$("#sign_up").css({display:"block"});
		$(".fader").css({display:"block"});
	});

	$("#sign_up").next(".fader").click(function() {
		$("#sign_up").css({display:"none"});
		$(".fader").css({display:"none"});
	});

	$(".load_input").click(function() { // share new style popup
		$("#input_all").fadeIn('fast');
		$(".fader").css({display:"block"});
	});
	$("#input_all .bbtn>a").click(function() {
		$("#input_all .expannel").slideToggle(500);
		$(this).children("span").toggle();
	});
	$("#input_all .close_bar img").click(function() {
		$("#input_all").css({display:"none"});
		$(".fader").css({display:"none"});
	});

	$(".active_only1>li").click(function() {
		$(this).parent("ul").find("li").removeClass("active").end().end().addClass("active");
	});
	$(".multi_select>li").click(function() {
		$(this).toggleClass("active");
	});

	$("#search_all > .click_bar > img").click(function() {
		$("#search_all .expannel").slideToggle(500);
		$(this).parent(".click_bar").find("img").toggle();
	});

	$("textarea.dmytxt").focus(function() { //common - 클릭시 임시값 지우기
		$(this).text('').removeClass('dmytxt');
	});
	$("input.dmytxt").focus(function() {
		$(this).attr('value','').removeClass('dmytxt');
	});

	$(".left .profile li").click(function() {
		var tabs = $(this).parent("ul").children("li").index(this);
		var $this = $(this).parentsUntil(".left").find(".expannel:eq("+tabs+")");
		if ( $this.is(":not(.active)") ) { 
			$this.parentsUntil(".left").find(".expannel").slideUp('fast').removeClass("active");
			$(this).parent("ul").find(".panneltab").css('display','none');
		};
		$this.toggleClass("active").slideToggle(200);
		$(this).children(".panneltab").slideToggle(200);
	});

	//var innerHeight = $(".left_comment .inner").height();
	//var itemHeight = parseInt( $(".left_comment").find(".content_list:first").height() ) * 4;
	$(".left .expannel .more").click(function() {
		var itemWidth = parseInt( $(this).prev(".viewport").find(".content_list>div.fleft:first").width() );
		$(this).toggle().prev(".viewport").animate({height: "300px" }, 200).css('height','300')
		.find(".content_list>div.fleft").css('width', (itemWidth - 10) ).end()
		.parent(".expannel").tinyscrollbar();
	});

	$(".h_msg>textarea").focusin(function() { //timeline
		$(this).stop().animate({height:"100px"}, 200).next('.btns').css('display','block');
	});
	$(".h_msg>textarea").focusout(function() {
		var str = $(this).val().replace(/ /g, "").replace(/\n/g, "");
		var chkform = str.length;
		if ( chkform == 0 ) { $(this).stop().animate({height:"15px"}, 200).val(str).next('.btns').css('display','none'); }
	});

	$(".titlebar .setting>span").click(function() {
		$(this).parent('div').children('ul').stop(true, true).slideToggle('fast').end().toggleClass('active');
	});
	$(".titlebar .setting .hidethis").click(function() {
		$(this).parent('li').parent('ul').stop(true, true).slideToggle('fast').parent('div').toggleClass('active');
	});

	$(".detail .score li").click(function() {
		var tabs = $(this).parent("ul").children("li").index(this);
		var $this = $(this).parentsUntil(".msgbox").parent().find(".expannel:eq("+tabs+")");
		if ( $this.is(":not(.active)") ) { 
			$this.parentsUntil(".msgbox").parent().find(".expannel").css('display','none').removeClass("active");
			$(this).parent("ul").find(".panneltab").css('display','none');
		};
		$this.toggleClass("active").slideToggle(200);
		$(this).children(".panneltab").slideToggle(200);
	});

	$("#vote>.vstar>a").mouseover(function() { //vote
		var stars = '#vote>.vstar>a';
		var score = parseInt( $(stars).index(this) ) + 1;
		if ( score== '4' )
		{
			$(stars).removeClass();
		} else {
			$(stars+":lt("+score+")").addClass("twinkle");
			$(stars+":gt("+(score-1)+")").removeClass();
		};
		$("#vote_score").val( $(this).html() );
	});

	$(".box_list>ul>li").mouseenter(function() {
		var tabs = $(this).parent("ul").children("li").index(this);
		var $this = $(this).parentsUntil(".box_list").parent().find(".expannel:eq("+tabs+")");
		$this.css('marginLeft', (53 * tabs));
		if ( $this.is(":not(.active)") ) { 
			$(this).parentsUntil(".box_list").parent().find(".expannel").css('display','none').removeClass("active");
			$(this).parent("ul").find(".panneltab").css('display','none');
		};
		$this.addClass("active").slideDown(200);
		$(this).children(".panneltab").slideDown(200);
	});
	$(".sheet>.gauge").mouseenter(function() {
		var $this = $(this).parent().children(".expannel");
		if ( $this.is(":not(.active)") ) { 
			$(this).parentsUntil(".content").find(".expannel").css('display','none').removeClass("active");
			$(this).parentsUntil(".content").find(".panneltab").css('display','none');
		};
		$this.addClass("active").slideDown(200);
		$(this).children(".panneltab").slideDown(200);
	});
	$(".content div>.expannel").mouseleave(function() {
		$(this).css('display','none').removeClass("active")
			.parent("div").find(".panneltab").css('display','none');
	});

});