(function($){

    $.fn.zoomViewer = function(options){

        var settings = $.extend({
            mousewheel: true,
            theme: 'normal',
            currentIndex: 0,
            src: '',
            groupTitle: ''
        }, options);

        return this.each(function(){
            $('.js_zvWrapper').remove();

            var normalUI = '<header class="zv_header">\
                    <div class="zv_header_wrapper clearfix">\
                        <h1>'+ settings.groupTitle +'</h1>\
                        <div class="zv_control">\
                            <div class="zv_prev zv_btn js_prev"></div>\
                            <div class="zv_next zv_btn js_next"></div>\
                            <div class="zv_zoom_in zv_btn js_zoomIn"></div>\
                            <div class="zv_zoom_out zv_btn js_zoomOut"></div>\
                            <div class="zv_zoom_zero zv_btn js_zoomZero"></div>\
                            <div class="zv_zoom_fit zv_btn js_zoomFit"></div>\
                            <div class="zv_rotate_left zv_btn js_rotateLeft"></div>\
                            <div class="zv_rotate_right zv_btn js_rotateRight"></div>\
                        </div>\
                    </div>\
                </header>';

            var lightUI = '<div class="zvp_control">\
                            <a href="javascript:;" class="zvp_zoom_in zvp_btn in_block js_zoomIn" gahref="pics_detail_zoomin"></a>\
                            <a href="javascript:;" class="zvp_zoom_out zvp_btn in_block mt_5 js_zoomOut" gahref="pics_detail_zoomout"></a>\
            				<a href="javascript:;" class="zvp_rotate_left zvp_btn in_block mt_5 js_rotateLeft" gahref="pics_detail_levo"></a>\
            				<a href="javascript:;" class="zvp_rotate_right zvp_btn in_block mt_5 js_rotateRight" gahref="pics_detail_dextro"></a>\
                        </div>\
                        <a href="javascript:;" class="zvp_close js_lightClose" gahref="pics_detail_close"></a>';
            
            var commonUI = '<a href="javascript:;" class="zvp_nav zvp_prev js_prev" gahref="pics_detail_prev"></a>\
            					<a href="javascript:;" class="zvp_nav zvp_next js_next" gahref="pics_detail_next"></a>\
            					<div class="zvp_page_wrapper js_pageWrapper"><span class="js_currentIdx"></span> / <span class="js_totalCount"></span></div>';			

            if(settings.theme === 'normal'){
                var $wrapper = $('<div class="zv_wrapper js_zvWrapper"></div>');
                var $zoombox = $('<div class="zv_viewer"></div>');
                var control_ui = normalUI;
            }else if(settings.theme === 'poplayer'){
                var $wrapper = $('<div class="zvp_wrapper js_zvWrapper"></div>');
                var $zoombox = $('<div class="zvp_viewer"></div>');
                var control_ui = lightUI;

                var $mask = $('<div class="zvp_mask"></div>');
            }

            $('body').append($wrapper);
            $wrapper.append(control_ui + commonUI);
            $wrapper.append($zoombox);
            $wrapper.prepend($mask);

            var $image = $('<img class="js_zv_img">').css({position: "absolute", top: "0px", left: "0px", display:"none", cursor:"-webkit-grab"});
            $loading = $('<img class="zv_loading" src="'+headerParameters.publichost+'/public/js/jquery/zoom-viewer/img/spinner.gif">');

            $('body').append($loading);

            var $pageWrapper = $wrapper.find('.zvp_page_wrapper'),
            	$prev = $wrapper.find('.zvp_prev'),
            	$next = $wrapper.find('.zvp_next');
            if(typeof settings.src == 'object' && settings.src.length > 0){
                $image.attr({'src':settings.src[settings.currentIndex].src, 'title':settings.src[settings.currentIndex].title, 'onerror':'this.src="'+headerParameters.statichost+'/static/img/new-version/default_block.png"'});
                
                if(settings.src.length > 1){
	                $pageWrapper.css('left', (($wrapper.width() - $pageWrapper.width())/2) + 'px').show();
	                $pageWrapper.find('.js_currentIdx').text(settings.currentIndex + 1);
	                $pageWrapper.find('.js_totalCount').text(settings.src.length || 0);
	                
	                $prev.css('top', (($wrapper.height() - $prev.height())/2) + 'px').show();
	                $next.css('top', (($wrapper.height() - $next.height())/2) + 'px').show();
                }
            }else if(typeof settings.src == 'string'){
                $image.attr({'src': settings.src});
            }else{
                return;
            }

            $zoombox.html($image);
            
            
            /* 图片缩放 */
            var conatainerW = $zoombox.width(),
            	conatainerH = $zoombox.height(),
            	originImageW = 0,
            	originImageH = 0, 
            	changedImageW = 0,
            	changedImageH = 0,
            	imageOffsetX = 0, 
            	imageOffsetY = 0,
            	zoomPercent = 0,
            	angle = 0;
            //图片加载
            $image.one('load',function(){
                $loading.hide();
                originImageW = $image.width();
                originImageH = $image.height();
                // 初始化图片
                $image.css({position: "absolute", width:'', height:'', '-webkit-transform':'rotate(0deg)', 'display': 'block'});
                
                zoomFit();
            }).error(function(){
                //alert('该图片无大图');
                //destroy();
            }).each(function(){//ie 或者firefox 已经缓存的图片会不再执行load方法，所以做下判断
                if(this.complete){
                    $(this).load();
                }
            });

            //原始大小
            function zoomOriginal(){
            	changedImageW = originImageW;
            	changedImageH = originImageH;
            	
            	imageOffsetX = (conatainerW - originImageW)/2;
            	imageOffsetY = (conatainerH - originImageH)/2;
            	
                setZoom();
                zoomPercent = $image.width()/originImageW; 
            }
            
            //最适合的大小
            function zoomFit(){
            	if(conatainerW/conatainerH > originImageW/originImageH){
            		changedImageH = conatainerH <= originImageH ? conatainerH : originImageH;
            		changedImageW = changedImageH * originImageW / originImageH;
                }else{
                    changedImageW = conatainerW <= originImageW ? conatainerW : originImageW;
                    changedImageH = changedImageW * originImageH / originImageW;
                }
            	
            	imageOffsetX = (conatainerW - changedImageW)/2;
                imageOffsetY = (conatainerH - changedImageH)/2;
                
                setZoom();
                zoomPercent = $image.width()/originImageW; 
            }
            
            //手动（点放大或缩小）缩放图片
            function zoomImg (percent) {
            	if( (zoomPercent + percent) <= 0){
                    return;
                }
            	zoomPercent += percent;
            	
            	changedImageW = originImageW * zoomPercent;
            	changedImageH = originImageH * zoomPercent;
                imageOffsetX -= (originImageW * zoomPercent - $image.width()) / 2;
                imageOffsetY -= (originImageH * zoomPercent - $image.height()) / 2;

                setZoom();
            }
            
            //设置图片缩放
            function setZoom(){
            	$image.css({
                    'width': changedImageW,
                    'height': changedImageH,
                    'left': imageOffsetX,
                    'top': imageOffsetY
                });
            }
            
            //鼠标滚动事件
            //$zoombox.bind('mousewheel', function(event){
            //    event.preventDefault();
            //    event.wheelDelta > 0 ? zoomImg(0.1) : zoomImg(-0.1);
            //});
            
            /* 图片旋转  */
            function rotate(ang){
            	angle += ang;
            	$image.css('-webkit-transform', 'rotate('+angle+'deg)');
            }
            
            function destroy(){
            	$wrapper.remove();
                $loading.remove();
            }

            // Drag Move Event
            //$image.bind('mousedown', function(e){
            //    e.preventDefault();
            //    $image.css('cursor', '-webkit-grabbing');
            //    var last = e;
            //    function drag(e) {
            //        e.preventDefault();
            //        imageOffsetX += (e.pageX - last.pageX);
            //        imageOffsetY += (e.pageY - last.pageY);
            //        last = e;
            //
            //        $image.css({'left':imageOffsetX, 'top':imageOffsetY});
            //    }
            //
            //    $(document)
            //    .bind('mousemove', drag)
            //    .one('mouseup', function () {
            //        $image.css('cursor', '-webkit-grab');
            //        $(document).unbind('mousemove', drag);
            //    });
            //});

            // Button Click Control
            $wrapper.find('.js_zoomIn').click(function(){
                zoomImg(0.2);
            });
            $wrapper.find('.js_zoomOut').click(function(){
            	zoomImg(-0.2);
            });
            $wrapper.find('.js_zoomZero').click(function(){
                zoomOriginal();
            });
            $wrapper.find('.js_zoomFit').click(function(){
                zoomFit();
            });
            $wrapper.find('.js_rotateLeft').click(function(){
                rotate(-90);
            });
            $wrapper.find('.js_rotateRight').click(function(){
            	rotate(90);
            }); 
            $wrapper.find('.js_next').click(function(){
            	settings.currentIndex = (settings.currentIndex >= (settings.src.length - 1)) ? 0 : settings.currentIndex + 1;
                $image.attr({'src': settings.src[settings.currentIndex].src, 'title': settings.src[settings.currentIndex].title});
                $('.zvp_page_wrapper').find('.js_currentIdx').text(settings.currentIndex + 1);
            });
            $wrapper.find('.js_prev').click(function(){
            	settings.currentIndex = (settings.currentIndex <= 0) ? settings.src.length -1 : settings.currentIndex - 1;
                $image.attr({'src': settings.src[settings.currentIndex].src, 'title': settings.src[settings.currentIndex].title});
                $('.zvp_page_wrapper').find('.js_currentIdx').text(settings.currentIndex + 1);
            }); 
            $wrapper.find('.js_lightClose').click(function(){
            	destroy();
            });           
        })
    }
})(jQuery);