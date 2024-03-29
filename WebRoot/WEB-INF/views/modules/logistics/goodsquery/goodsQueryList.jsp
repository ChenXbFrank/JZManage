<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>发货查询管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/goodsquery/goodsQuery/">发货查询列表</a></li>
		<shiro:hasPermission name="goodsquery:goodsQuery:edit"><li><a href="${ctx}/goodsquery/goodsQuery/form">发货查询添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="goodsQuery" action="${ctx}/goodsquery/goodsQuery/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>奖品名称：</label>
				<form:input path="prizeName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>名称</th>
				<th>奖品名称</th>
				<th>编号</th>
				<th>经销商ID</th>
				<th>经销商名称</th>
				<th>地址</th>
				<th>驾驶员名称</th>
				<th>驾驶员电话</th>
				<th>发货地址</th>
				<th>发货时间</th>
				<th>创建时间</th>
				<th>修改时间</th>
				<shiro:hasPermission name="goodsquery:goodsQuery:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="goodsQuery">
			<tr>
				<td><a href="${ctx}/goodsquery/goodsQuery/form?id=${goodsQuery.id}">
					${goodsQuery.name}
				</a></td>
				<td>
					${goodsQuery.prizeName}
				</td>
				<td>
					${goodsQuery.number}
				</td>
				<td>
					${goodsQuery.dstributorlId}
				</td>
				<td>
					${goodsQuery.dstributorlName}
				</td>
				<td>
					${goodsQuery.dstributorlAddress}
				</td>
				<td>
					${goodsQuery.driverName}
				</td>
				<td>
					${goodsQuery.driverPhone}
				</td>
				<td>
					${goodsQuery.goodsAddress}
				</td>
				<td>
					<fmt:formatDate value="${goodsQuery.goodsTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${goodsQuery.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${goodsQuery.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="goodsquery:goodsQuery:edit"><td>
    				<a href="${ctx}/goodsquery/goodsQuery/form?id=${goodsQuery.id}">修改</a>
					<a href="${ctx}/goodsquery/goodsQuery/delete?id=${goodsQuery.id}" onclick="return confirmx('确认要删除该发货查询吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>