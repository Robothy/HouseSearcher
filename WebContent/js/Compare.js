$(document).ready(function () {

	//从cookie中加载待比较的房屋信息
	loadCompareHouses();

	//点击显示[房屋对比]
	$("#show-compare").click(function () {
		$("#show-compare").css("visibility", "hidden")
		$("#compare-houses").css("visibility", "visible")
	})

	//点击隐藏[房屋对比]
	$("#hide-compare-houses").click(function () {
		$("#compare-houses").css("visibility", "hidden")
		$("#show-compare").css("visibility", "visible")
	})

	//点击【加入对比】事件
	$("#add-to-compare").click(function () {
		var compareHousesJsonString = $.cookie("compareHouses"); //获取cookie
		var houseJSONObj = getHouseAttr(); //获取当前页面的房屋信息

		var isExists = false; //判断cookie中是否已经存在某房屋信息的标志

		//如果cookie中不包含数据，则直接将房屋数据添加到cookie中
		if (compareHousesJsonString == "" || compareHousesJsonString == null || compareHousesJsonString == undefined) {
			$.cookie("compareHouses", JSON.stringify(houseJSONObj), {
				expires: 60
			}); //添加数据到cookie中
			appendHouseElement(houseJSONObj)
			return
		}
		var houseStringArray = compareHousesJsonString.split("-$-");

		for (var i = 0; i < houseStringArray.length; i++) {
			var existHouse = JSON.parse(houseStringArray[i]);
			var newHouse = houseJSONObj;
			if (existHouse["houseHref"] == newHouse["houseHref"]) {
				isExists = true;
				break;
			}
		}

		if (!isExists) {
			//添加数据到cookie中,带分隔符'-$-'
			$.cookie("compareHouses", compareHousesJsonString + "-$-" + JSON.stringify(houseJSONObj), {
				expires: 60
			});
			//将数据添加到列表中
			appendHouseElement(houseJSONObj)
		}
	})

	//点击【开始比较】按钮
	$("#begin-compare-houses").click(function () { ;

	});

	//点击【X】，删除某一条房屋信息
	$('ul').on('click','.del-compare-house' ,function () {

		var delLi = $(this).parent(); //要移除的li
		var delHref = $(delLi).find('a').attr('href'); //要删除的房屋的链接
		var houses = $.cookie('compareHouses').split("-$-");

		if (houses.length <= 1) { //简单粗暴，直接清空
			$.cookie('compareHouses', "", {
				expires: 0
			})
		} else {
			var index = 0;
			for (var i = 0; i < houses.length; i++) {
				if (houses[i].valueOf(delHref) > -1) {
					index = i;
					break;
				}
			}
			houses.splice(index); //删除元素
			$.cookie('compareHouses', houses.join('-$-'), {
				expires: 60
			}); //重新写入cookie
		}

		$(delLi).remove() //移除li

	});

	//点击【清空】按钮
	$("#clear-compare-houses").click(function () {
		$.cookie("compareHouses", "", {
			expires: 0
		}) //清除cookie
		$("#compare-houses-lst").empty("li"); //清空列表
	})

})

/**
 * 从cookie中加载要比较的房屋信息到比较列表容器中
 */
var loadCompareHouses = function () {
	var housesJSONString = $.cookie("compareHouses");
	if (housesJSONString == undefined || housesJSONString == null || housesJSONString == '') {
		return;
	}

	var houses = housesJSONString.split("-$-");
	for (var i = 0; i < houses.length; i++) {
		appendHouseElement(JSON.parse(houses[i]));
	}
}

//往待比较房屋中添加一个元素
var appendHouseElement = function (JSONobj) {
	$("#compare-houses-lst").append("<li style=\"padding:3px 3px 10px 10px; width:100%; \"><span title=\"查看\" style=\"  float:left; display:inline-block; \"><a style=\"font-size:11px; color:black;\" href=\"/HouseSearcher/pages/house-details.action?houseHref=" + JSONobj['houseHref'] + "\">" + JSONobj['community'] + "," + JSONobj['houseType'] + "," + JSONobj['price'] + "</a></span><span class=\"del-compare-house\" title=\"删除\" style=\"cursor: pointer; cursor: hand; display:inline-block; border:solid gray 1px; margin-right:0px; font-size:11px; \">X</span><li>");
}

//获取当前页面房屋信息,返回一个 json 格式的字符串
function getHouseAttr() {
	var houseHref = $("#house-href").text(); //房屋链接
	var title = $("h1").text() //标题
		var price = $("div[class='price']").children("div").text() //价格
		var area = $("div[class='area']").children("div").text() //面积
		var houseType = $("div[class='room']").children("div").text() //户型
		var tds = $("table[class='aroundInfo']").find("td")
		var level = $(tds[1]).text() //楼层
		var orientation = $(tds[3]).text() //朝向
		var pubDate = $(tds[7]).text() //上架日期
		var community = $(tds[9]).text() //小区
		var addr = $(tds[11]).text() //地址
		var obj = {
		"houseHref": houseHref,
		"title": title,
		"price": price,
		"area": area,
		"houseType": houseType,
		"level": level,
		"orientation": orientation,
		"pubDate": pubDate,
		"community": community,
		"addr": addr
	}
	return obj
}
