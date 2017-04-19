/********************************
            头部搜索
********************************/
$(function(){
    /********************************
                切换搜索频道
    ********************************/
    //切换频道 － 点击事件
    var env_suffix = headerParameters.env === 'production' ? 'com' : headerParameters.env === 'integration' ? 'org' : 'net';
    $(".search-tab .check").click(function(){
        $(".search-tab ul.tabs").css({//显示频道选项
            height: 'auto',
            overflow: 'auto',
            border: '1px solid rgb(204, 204, 204)',
            left: '-1px',
            top: '-1px',
            display: 'block', 
            background: 'rgb(255, 255, 255)'
        });
        $("#hot-sug, #hot-sug ul, #suggest-cont").css({
            "display" : "none"
        });
    });
    //切换频道 － 频道选项 － 点击事件
    $(".search-tab ul.tabs li label").click(function(){
        $("#channelChked").text($(this).text())
                           .attr("actData", $(this).attr("actData"))
                           .attr("formact", $(this).attr("formact")); //重置当前搜索频道
        $("#formSearch").prop("action", $(this).attr("formact"))
                        .attr("actData", $(this).attr("actData"));//重置form的action,actData
        if($(this).attr("tra") != undefined ){//重置form的target
            $("#formSearch").attr("target", $(this).attr("tra"));
        }
        else{
            $("#formSearch").removeAttr("target");
        }
        $("#keyword-box").attr("placeHolder", $(this).attr("tips"));//重置搜索框placeholder
        
        closeChangeTab();
        initSaveSearchByChannel();
    });
    //关闭频道切换tab 
    function closeChangeTab(){
        $(".search-tab ul.tabs").css({//关闭频道选项
            height: 'auto',
            overflow: 'auto',
            border: '1px solid rgb(204, 204, 204)',
            left: '-1px',
            top: '-1px',
            display: 'none',
            background: 'rgb(255, 255, 255)'
        });
    }
    //初始化频道对应的保存搜索
    function initSaveSearchByChannel(){
        $("#saveSearchTotal").hide();
        var channel = $("#channelChked").attr("actdata");  //搜索框对应的频道，要与页面所在的频道区分开
        initSaveSearch(channel);  //初始化已保存搜索链接和弹层，方法定义在list_getUserInfoCallback.js文件中
    }


    /********************************
               搜索关键字输入框
    ********************************/
    //搜索关键字输入框 － focus事件
    $("#keyword-box").focus(function(){
        closeChangeTab(); //关闭频道切换tab
        $("#saveSearchTotal").removeClass("open");

        buildHistory();//生成搜索历史
        
        //显示搜索历史/热门搜索 或 自动完成联想弹层
        var channel = $("#channelChked").attr("actData");
        $("#"+channel+" .js_hotList").css({"display": "none"});
        if($.trim($(this).val()) == ""){//关键字为空 － 显示搜索历史或热门搜索
            if(channel == "xinfang"){//新房，不记录搜索历史
                if($("#"+channel+" .js_hot .list li").length > 0) {
                    $("#"+channel+" .js_hot").css({"display": "block"});
                }
            }
            else{//非新房
                if($("#"+channel+" .js_history .list li").length == 0){//无搜索历史，显示热门搜索
                    if($("#"+channel+" .js_hot .list li").length > 0){
                        $("#"+channel+" .js_hot").css({"display" : "block"});
                    }
                }
                else{//有搜索历史，显示搜索历史
                    $("#"+channel+" .js_history").css({"display" : "block"});
                }
            }

            $("#suggest-cont").css({"display" : "none"});
            $("#hot-sug").css({"display" : "block"});
        }
        else{//关键字不为空 － 显示自动完成联想弹层
            $("#keyword-box").trigger("keyup");
        }

        if($("#"+channel+" .js_history .list li").length == 0 && $("#"+channel+" .js_hot .list li").length == 0){
            $("#"+channel).css({"display" : "none"});
        }else{
            $("#"+channel).css({"display" : "block"});
        }
    });

    //设置搜索历史（写入localstorange）
    function setHistory(item){
        var channel = $("#channelChked").attr("actData");
        if(channel == "xinfang") return false;//新房不记录历史

        if(window.localStorage){
            //读localStorage，取搜索历史数据（生成数组）
            var searchHistoryArray = getHistory(channel);
            if(searchHistoryArray == null){
                searchHistoryArray = [];
            }

            //去重（name相同则移除）
            var existIndex = null;
            $.each(searchHistoryArray, function(index, node){
                if(node.name == item.name){
                    existIndex = index;
                    return false;
                }
            });
            if(existIndex != null){
                searchHistoryArray.splice(existIndex, 1);
            }
            //添加历史
            searchHistoryArray.unshift(item);//头部插入新记录

            temp = $.grep(searchHistoryArray,function(item,i){
                return i < 10;
            });

            window.localStorage.setItem("search_history_" + headerParameters.cityCode + "_" + channel, JSON.stringify(temp));//写入localStorage
        }
    }

    //读取搜索历史（读取localstorange）
    function getHistory(channel){
        var searchHistoryArray = null;
        if(window.localStorage){
            if(window.localStorage.getItem("search_history_" + headerParameters.cityCode + "_" + channel)){
                searchHistoryArray = JSON.parse(window.localStorage.getItem("search_history_" + headerParameters.cityCode + "_" + channel));
            }
        }
        return searchHistoryArray;
    }

    //生成搜索历史列表
    function buildHistory(){
        var channel = $("#channelChked").attr("actData");

        var searchHistoryArray = getHistory(channel);
        if(searchHistoryArray != null){
            var list = $("#"+channel+" .js_history .list");
            list.empty();
            $.each(searchHistoryArray, function(index, node){
                if(searchHistoryArray.length-1 == index){//最后一条没分隔线
                    list.append('<li><a href="'+node.url+'">'+node.name+'</a></li>');
                }
                else{
                    list.append('<li><a href="'+node.url+'">'+node.name+'</a></li><li class="line"></li>');
                }
            });
        }
    }

    //清除搜索历史记录
    $(".lj_searchs .hot-sug li.hot-name .del").click(function(){
        //清空列表
        $(this).parents(".js_history").eq(0).find(".list").empty();
        //关闭弹层
        $("#hot-sug").css({"display" : "none"});

        //清除localStorage
        var channel = $("#channelChked").attr("actData");
        window.localStorage.removeItem("search_history_" + headerParameters.cityCode + "_" + channel);
    });
    //搜索按钮点击事件
    $("#btn_topSearch").click(function(){
        searchFormSubmit();
    });
    //搜索关键字输入框回车事件
    $("#keyword-box").keyup(function(e){
        if(e.keyCode == 13){
            var c = $("#suggestion").css("display") != "none" && $("#suggestion .ui-state-focus").length != 0;//是不是自动完成的状态
            if(!c){//关键字搜索
                searchFormSubmit();
            }
        }
    });
    //
    function searchFormSubmit(){
        var actData = $("#formSearch").attr("actData");

        var keywordData = $.trim($("#keyword-box").val()).replace(/[:./#%?\\]/g,'');
        if(actData !=  "xinfang"){
            //记录搜索历史
            if(keywordData!=""){
                var item = {
                    url : $("#channelChked").attr("formact")+keywordData,
                    name : keywordData
                }

                setHistory(item);
            }
        }

        //提交表单
        var formAction = $("#formSearch").attr("action");
        var url = formAction + keywordData;
        if(actData == "ershoufang" && formAction == "/ershoufang/rs"){
        	if(pagePrefix == "/ditiefang"){
        		url = "/ershoufang/rs" +  keywordData;
        	}else if(pagePrefix == "/chengjiao"){
        		//url = "/" + actData + "/rs" +  keywordData;    
        		url = pagePrefix + "/rs" +  keywordData;
        	}
        }
        if(actData ==  "xinfang"){//新房
            url += '?utm_source='+headerParameters.cityCode+'ershoufang&utm_medium=referral&utm_campaign=search';//GA埋点信息
        }
       window.location = url;
    }

    //热门搜索 － 选项点击事件
    $(".js_hot li").click(function(){
        var href = $(this).find("a");
        var item = {
            name : href.text(),
            url : href.attr("href")
        }
        setHistory(item);
    });

    //点击搜索历史，也要更新本地排序
    $('.js_history .list').on('click','li',function(){
        var href = $(this).find("a");
        var item = {
            name : href.text(),
            url : href.attr("href")
        }
        setHistory(item);
    });


    //body click event
    $("body").click(function(){
        $("#hot-sug, #formSearch .tabs").css({//头部搜索
            "display" : "none"
        });
        $("#saveSearchTotal").removeClass("open");
    });
    $("#hot-sug, #keyword-box, #channelChked").click(function(e){
        stopBubble(e);
    });

    //suggestion 初始化
    $('#keyword-box').suggestion({
        urlOrData: '/headerMind.json',
        dataKey: 'list',
        setRequestParams: function(requstParams){
            requstParams.keyword = $.trim($("#keyword-box").val()).replace(/[:./#%?\\]/g,'');
            requstParams.pageType = $('#channelChked').attr("actData");
            requstParams.cityCode = headerParameters.cityCode;
        },
        selectCallback: function(selectedItem){//选中选项， 执行回调
        	var formActData = $("#formSearch").attr("actData");
        	var actdata = $("#channelChked").attr("actdata");//actdata记录频道名称，如ershoufang,xiaoqu等
        	var url = "/" + actdata + selectedItem.url;
        	if( actdata == "ershoufang"){
        		if(pagePrefix == "/ditiefang"){
            		url = "/ershoufang" + selectedItem.url;
            	}else if(pagePrefix == "/chengjiao"){
            		url = pagePrefix + selectedItem.url;
            	}
        	}
            if(actdata == "xinfang"){//新房
                switch (selectedItem.type) {
                    case "block":
                    case "blockAlias":
                        url = "http://"+headerParameters.cityCode+".fang.lianjia."+ env_suffix +"/detail/"+selectedItem.url+'/';
                        break;
                    case "district":
                    case "bizcircle":
                        url = "http://"+headerParameters.cityCode+".fang.lianjia."+ env_suffix +"/loupan/" + selectedItem.url.toLowerCase() + '/';
                        break;
                    case "devName":
                    case "devSimpleName":
                        url = "http://"+headerParameters.cityCode+".fang.lianjia."+ env_suffix +"/loupan/brand" + selectedItem.url + '/';
                        break;
                };
                //GA埋点
                url += '?utm_source='+headerParameters.cityCode+'ershoufang&utm_medium=referral&utm_campaign=search';
            }
        	if(actdata == "zufang"){
        		if(pagePrefix == "/ditiezufang"){
            		url = "/zufang" + selectedItem.url;
            	}
        	}
        	//地铁线、地铁站跳转到地铁频道
        	if(selectedItem.type == "line" || selectedItem.type == "stop"){
        		if(actdata == "ershoufang"){
        			url = "/ditiefang" + selectedItem.url;	
        		}else if(actdata == "zufang"){
        			url = "/ditiezufang" + selectedItem.url;	
        		}
        	}

            var item = {
                name : selectedItem.showName,
                url : url
            };
            setHistory(item);//历史搜索
            window.location.href = url;//页面跳转
        },
        crossDomain : false
    });
});
