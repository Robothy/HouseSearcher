<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>住房对比</title>
<%@ include file="module/references.txt" %>
</head>
<body>

  <%@ include file="module/head.jsp" %>
	<script type="text/javascript" src="/HouseSearcher/js/LoadCompareHouses.js"></script>
  <div class="container">
  <h2>住房比较</h2>
  <hr style="border-width: 2px; border-color:#39AC6A; "/>                        
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>标题</th>
        <th>价格</th>
        <th>面积</th>
        <th>户型</th>
        <th>楼层</th>
        <th>朝向</th>
        <th>上架日期</th>
        <th>小区</th>
        <th>地址</th>
        <th>评分</th>
        <th>取消对比</th>
      </tr>
    </thead>
    <tbody id="house-context">
      <!-- <tr>
        <td>好房子</td>
        <td>2000元/月</td>
        <td>20平</td>
        <td>4室2厅</td>
        <td>12层</td>
        <td>朝北</td>
        <td>2017-03-05</td>
        <td>杨浦区</td>
        <td>军工路516好</td>
        <td>80</td>
        <td><span>X</span></td>
      </tr> -->
      
    </tbody>
  </table>
</div>
</body>
</html>