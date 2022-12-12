(function($) {
    var ie6 = $.browser.msie && ($.browser.version < 8);
    var innerH = window.innerHeight;

    $.smartPop = {
        isInstall : false,
        opts : {},
        open : function(options) {
            this.opts = $.extend({}, $.smartPop.defaults, options);

            if($('#'+this.opts.id).size() == 0){
                this.isInstall = false;
            }

            this.install();

            if( this.opts.method == 'POST') {
                if(this.opts.url != ''){
                    var form = $("<form />").attr({
                        "id" : this.opts.id+'_form',
                        "method" : this.opts.method,
                        "target" : this.opts.id+"_frame",
                        "action" : this.opts.url
                    }).css({
                        "display" : "none"
                    });

                    $.each(this.opts.param, function(key, value) {
                        var inputObj = $("<input />").attr({
                            "name" : key,
                            "value" : value
                        });

                        form.append(inputObj);
                    });

                    //form.appendTo("#"+this.opts.id).end().submit().remove();
                    $("#"+this.opts.id).append(form);
                    form.submit();
                }
            }

            this.resize();

            $('html').css({
                marginRight : '15px'
                , display : 'block'
                //, overflow : 'hidden'
                //, overflowY : 'hidden'
            });

            $('#'+this.opts.id).show();

            if(this.opts.url == ''){
                $('#'+this.opts.id+'_content').html(this.opts.html);
            }

            if (this.opts.log)
                $('#'+this.opts.id+'_log').show();
        },
        resize : function() {
            this.log(this.opts.width + ' x ' + this.opts.height);
            this.log('revise : ' + this.opts.revise);
            this.log('background : ' + this.opts.background);
            this.log('opacity : ' + this.opts.opacity);
            this.log('');

            $('#'+this.opts.id+'_container').width(this.opts.width);
            this.resizeHeight(this.opts.height);
        },
        resizeHeight : function(h) {
            this.log('resizeHeight : ' + h);
            if (ie6) {
                $('body').attr({
                    scroll : 'auto'
                }); // ie7에서 overflow 적용안됨
                innerH = document.documentElement.clientHeight;
            }

            // 위치설정
            if (this.opts.position == 'center') {
                var smartPopLayer = $("#" + this.opts.id);
                var optHeight = this.opts.height;
                var optWidth = this.opts.width;

                var top = 0;
                if($(window).height() > optHeight){
                    top = ($(window).height() - optHeight) / 2;
                }else{
                    top = (optHeight - $(window).height()) / 2;
                }

                var left = 0;
                if($(window).width() > optWidth){
                    left = ($(window).width() - optWidth) / 2;
                }else{
                    left = (optWidth - $(window).width()) / 2;
                }

                //포지션 지정
                smartPopLayer.css({
                    "top" : Math.floor(top) + "px"
                    , "left" : Math.floor(left) + "px"
                });

                //윈도우 크기 변경 이벤트 주입
                $(window).on("resize." + this.opts.id, function (){
                    //팝업 창 포지션 재조정
                    var top = 0;
                    if($(window).height() > optHeight){
                        top = ($(window).height() - optHeight) / 2;
                    }else{
                        top = (optHeight - $(window).height()) / 2;
                    }

                    var left = 0;
                    if($(window).width() > optWidth){
                        left = ($(window).width() - optWidth) / 2;
                    }else{
                        left = (optWidth - $(window).width()) / 2;
                    }

                    smartPopLayer.css({
                        "top" : Math.floor(top) + "px"
                        , "left" : Math.floor(left) + "px"
                    });
                });
            } else {
                $('#'+this.opts.id+'_container').css({
                    marginLeft : this.opts.left,
                    marginTop : this.opts.top
                });
            }

            // 높이설정

            h = parseInt(h) + parseInt(this.opts.revise);

            $('#'+this.opts.id+'_container').height(h);

            h = h - parseInt($('#'+this.opts.id+'_top').height());
            this.log(this.opts.id+'_top - : ' + h);
            $('#'+this.opts.id+'_bottom').height(h);

            var margin = parseInt($('#'+this.opts.id+'_bottom_content').css(
                    'paddingTop'))
                + parseInt($('#'+this.opts.id+'_bottom_content').css(
                    'paddingBottom'));
            h = h - margin;
            this.log('margin - : ' + h);
            $('#'+this.opts.id+'_bottom_content').height(h);
            if (this.opts.url == '') {
                $('#'+this.opts.id+'_content').height(h).show();
                $('#'+this.opts.id+'_frame').hide();
            } else {
                $('#'+this.opts.id+'_content').hide();
                $('#'+this.opts.id+'_frame').height(h).show();
            }
            $('#'+this.opts.id+'_loading').hide();
            this.log('');
        },
        install : function() {
            if (this.isInstall == false) {
                var body = $('body');

                var obj = this;
                var smartPop_overlay = $('<div />').attr('id',this.opts.id+'_overlay').css({
                    opacity : this.opts.opacity,
                    background : this.opts.background
                }).addClass("smartPop_overlay");
                var smartPop = $('<div />').attr('id', this.opts.id).addClass("smartPop");
                var smartPop_container = $('<div />').attr('id',
                    this.opts.id+'_container').addClass("smartPop_container");
                var smartPop_top = $('<div />').attr('id', this.opts.id+'_top').addClass("smartPop_top");
                var smartPop_top_content = $('<div />').attr('id',
                    this.opts.id+'_top_content').addClass("smartPop_top_content");
                var smartPop_bottom = $('<div />')
                    .attr('id', this.opts.id+'_bottom').addClass("smartPop_bottom");
                var smartPop_bottom_content = $('<div />').attr('id',
                    this.opts.id+'_bottom_content').addClass("smartPop_bottom_content");
                var smartPop_content = $('<div />').attr('id', this.opts.id+'_content').addClass("smartPop_content");
                if(this.opts.scroll){
                    smartPop_content.css("overflow-y","auto");
                }
                var smartPop_close = $('<div />').attr('id', this.opts.id+'_close').attr('orgId', this.opts.id).data("callback", this.opts.callback).addClass("smartPop_close").on('click', function() {
                    if( $.isFunction(obj.opts.close ) ) {
                        obj.opts.close();
                    }else{
                        $.smartPop.close($(this).attr('orgId'), null, $(this).data('callback'));
                    }
                });
                var smartPop_loading = $('<div />').attr('id',
                    this.opts.id+'_loading').addClass("smartPop_loading");
                var smartPop_frame = $(
                    '<iframe id="'+this.opts.id+'_frame" name="'+this.opts.id+'_frame" />')
                    .attr({
                        frameBorder : 0,
                        scrolling : this.opts.scroll ? 'auto' : 'no'
                    }).addClass("smartPop_frame");
                // var smartPop_frame = $('<iframe />').attr({ id:
                // 'smartPop_frame', name: 'smartPop_frame', frameBorder: 0,
                // scrolling: 'no' });

                smartPop.append($('<div />').attr('id', this.opts.id+'_log').addClass("smartPop_log"));
                smartPop_bottom_content.append(smartPop_content).append(
                    smartPop_frame);
                smartPop_bottom.append(smartPop_close).append(smartPop_bottom_content).appendTo(
                    smartPop_container);
                smartPop_container.append(smartPop_loading).appendTo(smartPop);

                body.append(smartPop_overlay).append(smartPop);

                this.isInstall = true;
            } else {

                if (this.opts.title != '') {
                    $("#"+this.opts.id+"_top_content").empty().append(
                        $("<h4 />").text(this.opts.title));
                }
                var _callBack = this.opts.callback;

                if( this.opts.method == 'GET') {
                    $('#'+this.opts.id+'_frame').attr( "src", this.opts.url );
                }

                $('#'+this.opts.id+'_frame').load(function() {
                    if ($.isFunction(_callBack)) {
                        $(this).get(0).contentWindow.CALLBACK = _callBack;
                    } else {
                        $(this).get(0).contentWindow.CALLBACK = function() {
                        };
                    }
                    // 닫기
                    $(this).get(0).contentWindow.CLOSE = $.smartPop.close;

                    //$(this).get(0).contentWindow.focus();

                });

                $('#'+this.opts.id).show();
                $('#'+this.opts.id+'_overlay').show();
                return;
            }

            if (this.opts.url != '') {
                $.smartPop.resizeHeight(400); // 사이즈 보정 - 새로고침할 경우 크기 늘어나는거 방지

                var _callBack = this.opts.callback;

                if( this.opts.method == 'GET')
                    $('#'+this.opts.id+'_frame').attr( "src", this.opts.url );


                var popReSize = this.opts.resize;

                $('#'+this.opts.id+'_frame').load(function() {

                    // CALL BACK
                    if ($.isFunction(_callBack)) {
                        $(this).get(0).contentWindow.CALLBACK = _callBack;
                    } else {
                        $(this).get(0).contentWindow.CALLBACK = function() {
                        };
                    }

                    // 닫기
                    $(this).get(0).contentWindow.CLOSE = $.smartPop.close;

                    var h = $(this).contents().height() - 2;
                    if(popReSize){
                        $.smartPop.resizeHeight(h + 50);
                    }

                    //$(this).get(0).contentWindow.focus();

                });
            }

            if (this.opts.bodyClose) {
                $('body').bind('click', function(event) {
                    if (!event) event = window.event;
                    var target = (event.target) ? event.target :
                        event.srcElement;
                    event.stopPropagation(); // 이벤트 버블링 전파를 막음
                    if(target.id == 'smartPop') {
                        $.smartPop.close();
                    }
                });
            }

        },
        close : function(_id, data, fucc) {

            var obj = $.smartPop;


            /*         if (ie6) {
                        $('body').attr({
                           scroll : 'yes'
                        });
                     }
            */
            $('html').css({
                marginRight : 0,
                display : '',
                overflowY : 'auto'
            });

            if(obj.opts.html != "" && obj.opts.url == ""){
                if(fucc != undefined && $.isFunction(fucc) ){
                    fucc();
                }else{
                    if(_id == undefined){
                        if(obj.opts.callback){
                            obj.opts.callback.call(obj, data);
                        }
                    }else{
                        var callbackFucc = $("#" +_id + "_close").data("callback");
                        if(callbackFucc){
                            callbackFucc(data);
                        }
                    }

                }
            }

            if(_id == undefined){
                if($('#'+ obj.opts.id ).find(":input").poshytip){
                    $('#'+ obj.opts.id ).find(":input").poshytip("destroy");
                }
                $('#'+ obj.opts.id ).remove();
                $('#'+ obj.opts.id + '_overlay').remove();
                $('#'+ obj.opts.id + '_form').remove();
            }else{
                if($('#'+ _id ).find(":input").poshytip){
                    $('#'+ _id ).find(":input").poshytip("destroy");
                }
                $('#'+ _id ).remove();
                $('#'+ _id + '_overlay').remove();
                $('#'+ _id + '_form').remove();
            }



            //$("body :input[type=text]").eq(0)focus();

            //$("body").focus();

        },
        log : function(msg) {
            var log = $('#'+this.opts.id+'_log').html();
            $('#'+this.opts.id+'_log').html(log + '<br />' + msg);
        }
    };

    $.smartPop.defaults = {
        position : 'center',
        left : '310px',
        top : '10px',
        bodyClose : false,
        resize : true,
        id : "smartPop",
        title : 'smartPop',
        background : '#282828',
        opacity : .7,
        width : '720px',
        height : '500px',
        scroll : false,
        html : '',
        url : '',
        revise : 0,
        method : "GET",
        param : {},
        log : false,
        callback : ''
    };
})(jQuery);