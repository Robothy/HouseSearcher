/**************************
        地图 － 周边配套
***************************/
$(function () {
    var mapRenderData = {
        keyword : null,  //关键字
        distance : null,  //半径距离（米）
        longitude : $("#zoneMap").attr("longitude"), //经
        latitude : $("#zoneMap").attr("latitude"),  //纬
        cateList : ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"], //不同关键字对应的分类标记（百度地图搜索最多只支持10个关键字）
        searchResultList : null, //存储搜索结果集
        isSearching : false //记录一次搜索是否正在进行中
    }
    var map = null, myIcon=null;

    //切换tab(周边设施类型，半径距离)
    function selectKeywordTab(currentTab) {
        if(mapRenderData.isSearching){
            return false;
        }

        $("#map-keyword a").removeClass("on");
        currentTab.addClass('on');
        $("#env-list").html('<div class="loading">努力加载中</div>');

        mapRenderData.keyword = currentTab.attr('data-keyword');
        renderMap();
    }
    function selectDistanceTab(currentTab) {
        if(mapRenderData.isSearching){
            return false;
        }

        $("#map-distance a").removeClass("on");
        currentTab.addClass('on');
        $("#env-list").html('<div class="loading">努力加载中</div>');

        mapRenderData.distance = currentTab.attr('data-distance')*1 || 500;
        renderMap();
    }

    $("#map-keyword").on('click', "a", function (e) {
        selectKeywordTab($(this));
    });
    $("#map-distance").on('click', "a", function (e) {
        selectDistanceTab($(this));
    });

    //默认值初始化
    mapRenderData.keyword = $("#map-keyword a.on").attr('data-keyword');
    mapRenderData.distance = $("#map-distance a.on").attr('data-distance')*1 || 500;
    renderMap();

    //初始化地图
    function renderMap() {
        mapRenderData.isSearching = true;

        //搜索关键字
        var keyword = mapRenderData.keyword.split('|');

        //小区标注
        var houseIcon = new BMap.Icon(headerParameters.statichost+"/static/img/xiaoqu/point-dis-around.png", new BMap.Size(27, 41));

        map = new BMap.Map("map-around"),
            mPoint = new BMap.Point(mapRenderData.longitude, mapRenderData.latitude),
            marker = new BMap.Marker(mPoint, {
                icon: houseIcon
            }), array = [mPoint];
        map.addControl(new BMap.NavigationControl({
            anchor: BMAP_ANCHOR_TOP_LEFT
        }));
        map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT}));//比例尺
        map.clearOverlays();
        map.addOverlay(marker);
        //var label = new BMap.Label($("#map-around").attr("xiaoqu"), { offset : new BMap.Size(-11,-38) });
        //
        //label.setStyle({
        //    fontSize : "16px",
        //    border :"1px solid #ddd",
        //    fontWeight : "bold",
        //    padding : "6px 20px",
        //    height : '24px',
        //    lineHeight : '24px',
        //    boxShadow : "2px 2px 5px eee"
        //})
        //
        //marker.setLabel(label);

        //周边标注
        var size = new BMap.Size(27, 41),
            sizeActive = new BMap.Size(27,41),
            offsetSize = new BMap.Size(2, 0),
            offsetSize_hover = new BMap.Size(0,0);
        myIcon = new BMap.Icon(headerParameters.statichost+"/static/img/xiaoqu/aroundPos.png", size, {
                imageOffset: offsetSize
            }),
            myIconActive = new BMap.Icon(headerParameters.statichost+"/static/img/xiaoqu/aroundPosActive.png", sizeActive, {
                imageOffset: offsetSize_hover
            });
        var circle = new BMap.Circle(mPoint, mapRenderData.distance, {
            strokeColor: "transparent",
            fillColor: "transparent"
        });
        map.addOverlay(circle);
        var mPoint = new BMap.Point(mapRenderData.longitude, mapRenderData.latitude);
        map.centerAndZoom(mPoint, 16);

        map.addOverlay(circle);
        var local = new BMap.LocalSearch(map, {
            onSearchComplete: function (result) {
                mapRenderData.isSearching = false;

                var group, item,  cateIndex = 0;
                mapRenderData.searchResultList = [];
                if (!result instanceof Array) {
                    result = [result];
                }
                for (var j in result) {
                    if(result[j].getCurrentNumPois()!=0){
                        cateIndex += 1;
                        var list = [];
                        for (var i = 0; i < result[j].getCurrentNumPois(); i++) {
                            result[j].getPoi(i).no = i+1;
                            list = list.concat(result[j].getPoi(i));
                            item = result[j].getPoi(i);
                            array.push(item.point);
                            _drawPoint(map, item, result[j].keyword, mapRenderData.cateList[cateIndex-1], i+1);
                        }
                        mapRenderData.searchResultList.push({
                            keyword : result[j].keyword,
                            list : list,
                            cate : mapRenderData.cateList[cateIndex-1]
                        });
                    }
                }


                map.setViewport(array);
                function _drawPoint(m, t, keyword, category, index) {
                    var mk = new BMap.Marker(t.point, {
                        icon: myIcon
                    });
                    var label = new BMap.Label(category+index);
                    label.setStyle({
                        color : "#fff",
                        letterSpacing: '-2px',
                        fontSize : "12px",
                        border : "0",
                        background : "transparent",
                        textAlign : "center",
                        width : "26px",
                        height : "29px",
                        marginLeft:"-1px",
                        paddingTop : "5px"
                    });
                    mk.setLabel(label);

                    m.addOverlay(mk);
                    var content = '<div style="font-size:12px; line-height:150%"><span style="color: #666">地址：</span>' + t.address + '</div>';
                    mk.addEventListener('click', function (e) {//气泡点击事件
                        //if(this.isActive == true) return false;

                        //右侧列表对应条目高亮且滚动到可见位置
                        $("#env-list dt.on").removeClass("on");
                        $("#env-list i").each(function(){
                            if($(this).text() == mk.getLabel().content){
                                $(this).parents("dt").eq(0).addClass("on");
                                $("#env-list").scrollTop(0);
                                $("#env-list").scrollTop($(this).parents("dt").eq(0).offset().top - $("#env-list").offset().top);
                            }
                        });

                        //当前气泡高亮，其他气泡还原
                        var allOverlay = map.getOverlays();
                        for (var i=0; i<allOverlay.length; i++) {
                            if(allOverlay[i].isActive == true){
                                allOverlay[i].setIcon(myIcon);
                                allOverlay[i].setTop(false);
                                allOverlay[i].closeInfoWindow();
                                allOverlay[i].isActive = false;
                            }
                        }
                        this.setIcon(myIconActive);
                        this.isActive = true;
                        this.setTop(true);
                        this.openInfoWindow(new BMap.InfoWindow(content, {
                            title: '<div class="map_popInfoWin_title" title="'+t.title+'">' + t.title + '</div>',
                            offset: new BMap.Size(0, -13),
                            width: 80,
                            maxWidth: 80,
                            enableMessage: false,
                            enableAutoPan: true
                        }));
                    });
                    mk.addEventListener('mouseover', function (e) {//气泡mouseenter事件
                        if(this.isActive == true) return false;

                        //右侧列表对应条目高亮
                        $("#env-list i").each(function(){
                            if($(this).text() == mk.getLabel().content){
                                $("#env-list dt.hover").removeClass("hover");
                                $(this).parents("dt").eq(0).addClass("hover");
                                $("#env-list").scrollTop(0);
                                $("#env-list").scrollTop($(this).parents("dt").eq(0).offset().top - $("#env-list").offset().top);
                                return false;
                            }
                        });

                        //当前气泡高亮、置顶
                        this.setIcon(myIconActive);
                        this.setTop(true);
                    });
                    mk.addEventListener('mouseout', function (e) {//气泡mouseout事件
                        if(this.isActive == true) return false;

                        //右侧列表对应条目失去高亮
                        $("#env-list i").each(function(){
                            if($(this).text() == mk.getLabel().content){
                                $(this).parents("dt").eq(0).removeClass("hover");
                                return false;
                            }
                        });
                        //右侧条目滚动位置到激活的高亮条目位置
                        var allOverlay = map.getOverlays();
                        for(var i=0; i<allOverlay.length; i++) {
                            if(allOverlay[i].isActive == true){
                                $("#env-list").scrollTop(0);
                                $("#env-list dt h4 i").each(function(){
                                    if($(this).text() == allOverlay[i].getLabel().content){
                                        $("#env-list").scrollTop($(this).parents("dt").eq(0).offset().top - $("#env-list").offset().top);
                                        return false;
                                    }
                                });
                            }
                        }

                        //当前气泡失去高亮，取消置顶
                        this.setIcon(myIcon);
                        this.setTop(false);
                    });
                }

                var searchResultListHtml = '';
                $.each(mapRenderData.searchResultList, function(index, node){
                    node.list = node.list.sort(function(p1, p2){
                        return map.getDistance(mPoint, p1.point) - map.getDistance(mPoint, p2.point);
                    });

                    var listHtml = '<h3>'+node.keyword+'</h3>';
                    $.each(node.list, function(i, n){
                        listHtml += '<dl><dt class="clear">';
                        listHtml += '<h4 class="left" title="'+n.title+'"><i>'+node.cate+n.no+'</i>'+n.title+'</h4>';
                        listHtml += '<span class="right">'+map.getDistance(mPoint, n.point).toFixed()+'米</span>';
                        listHtml += '</dt></dl>';
                    });
                    searchResultListHtml += listHtml;
                });
                if(searchResultListHtml == ''){
                    searchResultListHtml = '<p class="noData">暂无数据，请扩大范围试试。</p>'
                }
                $("#env-list").html(searchResultListHtml);
                $("#env-list").scrollTop(0);

            },
            renderOptions: {sautoViewport: false, selectFirstResult: false}
        });
        var bounds = getSquareBounds(circle.getCenter(), circle.getRadius());
        local.searchInBounds(keyword, bounds);

        /**
         * 得到圆的内接正方形bounds
         * @param {Point} centerPoi 圆形范围的圆心
         * @param {Number} r 圆形范围的半径
         * @return 无返回值
         */
        function getSquareBounds(centerPoi, r) {
            var a = Math.sqrt(2) * r; //正方形边长

            mPoi = getMecator(centerPoi);
            var x0 = mPoi.x, y0 = mPoi.y;

            var x1 = x0 + a / 2, y1 = y0 + a / 2;//东北点
            var x2 = x0 - a / 2, y2 = y0 - a / 2;//西南点

            var ne = getPoi(new BMap.Pixel(x1, y1)), sw = getPoi(new BMap.Pixel(x2, y2));
            return new BMap.Bounds(sw, ne);
        }
    }
    //根据球面坐标获得平面坐标。
    function getMecator(poi) {
        return map.getMapType().getProjection().lngLatToPoint(poi);
    }

    //根据平面坐标获得球面坐标。
    function getPoi(mecator) {
        return map.getMapType().getProjection().pointToLngLat(mecator);
    }

    //搜索结果条目事件定义
    $("#env-list").on("click", "dt", function(){
        //if($(this).hasClass("on")) return false;

        //右侧搜索结果列表 － 当前项高亮
        $("#env-list dt.on").removeClass("on");
        $("#env-list dt.hover").removeClass("hover");
        $(this).addClass("on");
        var labelText = $(this).find("h4 i").text();

        //左侧地图marker处理
        var currentMarkerIndex = null;
        var allOverlay = map.getOverlays();
        for(var i=0; i<allOverlay.length; i++) {//遍历找到已经高亮的地标还原之
            if(allOverlay[i].getLabel && allOverlay[i].getLabel() && allOverlay[i].getLabel().content && allOverlay[i].getLabel().content == labelText){
                currentMarkerIndex = i;
            }
            if(allOverlay[i].isActive == true){
                allOverlay[i].setIcon(myIcon);
                allOverlay[i].isActive = false;
                allOverlay[i].setTop(false);
                allOverlay[i].closeInfoWindow();
            }
        }
        if(currentMarkerIndex){//当前地标高亮处理
            var t = null;
            var c = allOverlay[currentMarkerIndex];
            var isFound = false;
            $.each(mapRenderData.searchResultList, function(index, node){
                $.each(node.list, function(i, n){
                    if(n.point.lat == c.point.lat && n.point.lng == c.point.lng){
                        t = n;
                        isFound = true;
                        return false;
                    }
                });
                if(isFound){return false;}
            });

            allOverlay[currentMarkerIndex].setIcon(myIconActive);//换图标
            allOverlay[currentMarkerIndex].isActive = true;//记录状态
            allOverlay[currentMarkerIndex].setTop(true);//置顶
            if(t){//弹信息窗
                var content = '<div><span style="color: #666">地址：</span>' + t.address + '</div>';
                allOverlay[currentMarkerIndex].openInfoWindow(new BMap.InfoWindow(content, {
                    title: '<div class="map_popInfoWin_title" title="'+t.title+'">' + t.title + '</div>',
                    offset: new BMap.Size(0, -13),
                    width: 80,
                    maxWidth: 80,
                    enableMessage: false,
                    //enableAutoPan: false,
                    enableAutoPan: true
                }));
            }
        }
    });

    $("#env-list").on("mouseenter", "dt", function(){
        if($(this).hasClass("on")) return false;


        $(this).addClass("hover");
        var labelText = $(this).find("h4 i").text();

        //左侧地图marker处理
        var allOverlay = map.getOverlays();
        for(var i=0; i<allOverlay.length; i++) {//遍历找到对应的气泡高亮、置顶
            if(allOverlay[i].getLabel && allOverlay[i].getLabel() && allOverlay[i].getLabel().content && allOverlay[i].getLabel().content == labelText){
                allOverlay[i].setIcon(myIconActive);//换图标
                allOverlay[i].setTop(true);//置顶
                return false;
            }
        }
    });
    $("#env-list").on("mouseout", "dt", function() {
        if ($(this).hasClass("on")) return false;

        $(this).removeClass("hover");
        //左侧地图marker处理
        var labelText = $(this).find("h4 i").text();
        var allOverlay = map.getOverlays();
        for(var i=0; i<allOverlay.length; i++) {//遍历找到对应的气泡去除高亮和置顶
            if(allOverlay[i].getLabel && allOverlay[i].getLabel() && allOverlay[i].getLabel().content && allOverlay[i].getLabel().content == labelText){
                allOverlay[i].setIcon(myIcon);//换图标
                allOverlay[i].setTop(false);//置顶
                return false;
            }
        }
    });
});