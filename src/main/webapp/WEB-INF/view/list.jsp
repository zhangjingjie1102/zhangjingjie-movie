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
	//分页
	function fenye(pageNum) {
		$("[name=pageNum]").val(pageNum);
		$("form").submit();
	}
	
	function morder(orderName) {
		var orderMethod = '${movieVo.orderMethod}';
		orderMethod	= orderMethod=='desc'?'asc':'desc';
		location.href="/selects?orderName="+orderName+"&orderMethod="+orderMethod;
	}
	

	$(function() {
		//全选与全不选
		$("[name=choose]").change(function() {
			if($(this).is(":checked")){
				$("[name=check]").prop("checked",true);
			}else{
				$("[name=check]").prop("checked",false);
			}
		});
		
		//反选
		$("[name='fan']").click(function() {
			 $("[name='check']").each(function(){  
                 $(this).attr("checked", !$(this).attr("checked"));  
             });  
		});
		
		
		//添加
		$("[name='add']").click(function() {
			location = "/add";
		});
		
	});
	
	
	
	//单删
	function delOne(id,name) {
		if(confirm("你确定要删除影片名字为"+  name  +"的电影吗")){
			$.post("/deleteOne",{id:id}, function(flag) {
				if(flag){
					alert("删除成功");
					location="/selects";
				}else{
					alert("删除失败");
				}
			});
		}
	}
	//批量删除
	function pi() {
		if(confirm("你确定要删除这些电影吗")){
			var gids = $("[name=check]:checked").map(function() {
				return this.value
			}).get().join();
			$.post("/pidelete",{gids:gids}, function(flag) {
				if(flag){
					alert("删除成功");
					location="/selects";
				}else{
					alert("删除失败");
				}
			});
		}
	}
</script>
</head>
<body>
	
	<form action="/selects" method="post">
		<input type="hidden" name="pageNum">
		电影名称<input type="text" name="name" value="${movieVo.name }">  上映时间<input type="text" name="t1" value="${movieVo.t1 }">--<input type="text" name="t2" value="${movieVo.t2 }"><br>
		电影导演<input type="text" name="actor" value="${movieVo.actor }">  电影价格<input type="text" name="p1" value="${movieVo.p1 }">--<input type="text" name="p2" value="${movieVo.p2 }"><br>
		电影年代<input type="text" name="years" value="${movieVo.years }">  电影时常<input type="text" name="l1" value="${movieVo.l1 }">--<input type="text" name="l2" value="${movieVo.l2 }">
		<button type="submit">查询</button>
	</form>
	
	<table>
		<tr>
			<th>
				<input type="checkbox" name="choose">
			</th>
			<th>序号</th>
			<th>电影名称</th>
			<th><a href="javascript:morder('price')">价格</a></th>
			<th>导演</th>
			<th>上映日期</th>
			<th><a href="javascript:morder('longtime')">电影时长</a></th>
			<th><a href="javascript:morder('years')">年代</a></th>
			<th>类型</th>
			<th>区域</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${list }" var="m" varStatus="count">
			<tr>
				<td>
					<input type="checkbox" name="check" value="${m.id}">
				</td>
				<td>${count.index+1 }</td>
				<td>${m.name }</td>
				<td>${m.price }</td>
				<td>${m.actor }</td>
				<td>${m.uptime }</td>
				<td>${m.longtime }</td>
				<td>${m.years }</td>
				<td>${m.type }</td>
				<td>${m.area }</td>
				<td>${m.status==1?'即将上映':m.status==2?'正在热映':'已经下架'}</td>
				<td>
					<button onclick="delOne(${m.id},'${m.name }')">删除影片</button>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="12" align="center">
				<button onclick="fenye(1)">首页</button>
				<button onclick="fenye(${page.prePage==0?1:page.prePage})">上一页</button>
				<button onclick="fenye(${page.nextPage==0?page.pages:page.nextPage})">下一页</button>
				<button onclick="fenye(${page.pages})">尾页</button>&nbsp;&nbsp;&nbsp;
				当前${page.pageNum }/${page.pages }页,共${page.total}条数据&nbsp;&nbsp;&nbsp;&nbsp;
				<button onclick="pi()">批量删除</button>
				<button name="fan">反选</button>
				<button name="add">添加影片</button>
			</td>
		</tr>
	</table>
</body>
</html>