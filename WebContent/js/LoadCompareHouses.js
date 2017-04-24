/**
 * 
 * 加载待比较房屋到比较页面 compare-houses.jsp 的 js 代码
 * 
 */

$(document).ready(function() {
	var housesCookie = $.cookie("compareHouses");
	if(housesCookie==undefined || housesCookie==null || housesCookie==""){	//cookie为空
		alert("请先添加待比较的房屋信息");
		window.location.href = "/HouseSearcher/index.jsp";	//跳转到首页
	}
	
	var houses = housesCookie.split('-$-');
	var context = "";
	for(var i=0; i<houses.length; i++){
		var house = JSON.parse(houses[i]);
		context += "<tr>";
		context += "<td><a href=\"/HouseSearcher/pages/dtl.jsp?houseHref="+ house["houseHref"] +"\">" + house["title"] + "</a></td>";
		context += "<td>" + house["price"] + "</td>";
		context += "<td>" + house["area"] + "</td>";
		context += "<td>" + house["houseType"] + "</td>";
		context += "<td>" + house["level"] + "</td>";
		context += "<td>" + house["orientation"] + "</td>";
		context += "<td>" + house["pubDate"] + "</td>";
		context += "<td>" + house["community"] + "</td>";
		context += "<td>" + house["addr"] + "</td>";
		context += "<td>" + "80" + "</td>";
		context += "<td><span class=\"del-compare-house\" title=\"移除\" style=\"cursor: pointer; cursor: hand; display:inline-block; border:solid gray 1px; margin-right:0px; font-size:11px; \">X</span></td>";
		context += "</tr>"
	}
	
	$("#house-context").html(context);
	
})