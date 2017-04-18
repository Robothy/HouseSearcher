$(document).ready(function () {

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

	//点击添加到对比事件
	$("#add-to-compare").click(function () {
		var compareHousesJsonString = getCookie("compareHouses"); //获取cookie
		var houseJSONObj = getHouseAttr(); //获取当前页面的房屋信息
		
		//如果cookie中不包含数据，则直接将房屋数据添加到cookie中
		if (compareHousesJsonString == "") {
			$.cookie("compareHouses", JSON.stringify(houseJSONObj)); //添加数据到cookie中
			return
		}

		var isExists = false; //判断cookie中是否已经存在某房屋信息的标志

		var houseStringArray = compareHousesJsonString.split("-");
		
		for (var i = 0; i < houseStringArray.length; i++) {
			var existHouse = JSON.parse(houseStringArray[i]);
			var newHouse = houseJSONObj;
			if (existHouse["houseHref"] == newHouse["houseHref"]) {
				isExists = true;
				break;
			}
		}

		if (isExists) {
			return;
		}
		
		//添加数据到cookie中,带分隔符'-'
		$.cookie("compareHouses", compareHousesJsonString + "-" + houseJSONString); 

	})

})

//获取当前页面房屋信息,返回一个 json 格式的字符串
function getHouseAttr() {
	var houseHref = $("h1").parent().attr("href") //房屋链接
		var title = $("h1").attr("title") //标题
		var price = $("div[class='price']").children("div").text() //价格
		var area = $("div[class='area']").children("div").text() //面积
		var houseType = $("div[class='room']").children("div").text() //户型
		var tds = $("table[class='aroundInfo']").find("td")
		var level = $(tds[1]).text()//楼层
		var orientation = $(tds[3]).text()//朝向
		var pubDate = $(tds[7]).text()//上架日期
		var community = $(tds[9]).text()//小区
		var addr = $(tds[11]).text()//地址
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

function setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
	var expires = "expires=" + d.toGMTString();
	document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
	var name = cname + "=";
	var decodedCookie = decodeURIComponent(document.cookie);
	var ca = decodedCookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') {
			c = c.substring(1);
		}
		if (c.indexOf(name) == 0) {
			return c.substring(name.length, c.length);
		}
	}
	return "";
}
