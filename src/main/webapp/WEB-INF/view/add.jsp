<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/index2.css">
<script type="text/javascript" src="resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<form action="/add" method="post">
		<table>
			<tr>
				<th>影片名</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th>导演</th>
				<td>
					<input type="text" name="actor">
				</td>
			</tr>
			<tr>
				<th>票价</th>
				<td>
					<input type="text" name="price">
				</td>
			</tr>
			<tr>
				<th>上映时间</th>
				<td>
					<input type="date" name="uptime">
				</td>
			</tr>
			<tr>
				<th>时长</th>
				<td>
					<input type="text" name="longtime">
				</td>
			</tr>
			<tr>
				<th>类型</th>
				<td>
					<input type="text" name="type">
				</td>
			</tr>
			<tr>
				<th>年代</th>
				<td>
					<input type="text" name="years">
				</td>
			</tr>
			<tr>
				<th>区域</th>
				<td>
					<input type="text" name="area">
				</td>
			</tr>
			<tr>
				<th>状态</th>
				<td>
					<select name="status">
						<option value="-1">请选择电影状态</option>
						<option value="1">正在热映</option>
						<option value="2">已经下架</option>
						<option value="3">即将上映</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>添加</th>
				<td>
					<input type="submit" value="添加">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>