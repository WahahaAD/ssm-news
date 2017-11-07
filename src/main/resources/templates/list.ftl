<!DOCTYPE html>  
<html>  
<head>  
<meta charset="UTF-8" />  
<title>用户展示页面</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="/js/bootstrap.js"></script>
    <script type="text/javascript" src="/JQuery/jquery-2.1.0.js"></script>
</head>  
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
                <table class="table table-striped table-bordered table-hover">
					<tr>
                        <th>头像</th>
                        <th>姓名</th>
                        <th>邮箱</th>
                        <th>性别</th>
                        <th>爱好</th>
                        <th>出生日期</th>
                        <th>地址</th>
                        <th>手机号</th>
                        <th>身份证</th>
                        <th>个人简介</th>
					</tr>
					<#list pageHelper.list as ul>
						<tr>
							<td><img src="${ul.picture}" style="width: 50px;height: 50px;"></td>
							<td>${ul.name}</td>
                            <td>${ul.email}</td>
                            <td>${ul.sex}</td>
                            <td>${ul.hobby}</td>
                            <td><#setting date_format="yyyy-MM-dd">
                       		 ${ul.birthday?date}</td>
                            <td>${ul.address}</td>
                            <td>${ul.phone}</td>
                            <td>${ul.idcard}</td>
                            <td>${ul.introduce}</td>
						</tr>
					</#list>
				</table>
                共<span>${pageHelper.total}条记录当前显示</span><span>现在显示第${pageHelper.pageNum}页</span>

                <a href="/user/selectAllUser?pageNo=${pageHelper.firstPage}&pageSize=${pageHelper.pageSize}" >首页</a>

			<#if pageHelper.isFirstPage == true >

                <a href="/user/selectAllUser?pageNo=${pageHelper.firstPage}&pageSize=${pageHelper.pageSize}" >上一页</a>

			<#else >
                <a href="/user/selectAllUser?pageNo=${pageHelper.prePage}&pageSize=${pageHelper.pageSize}">上一页</a>
			</#if>

			<#if pageHelper.isLastPage == true>

                <a href="/user/selectAllUser?pageNo=${pageHelper.lastPage}&pageSize=${pageHelper.pageSize}">下一页</a>

			<#else >
                <a href="/user/selectAllUser?pageNo=${pageHelper.nextPage}&pageSize=${pageHelper.pageSize}">下一页</a>
			</#if>

                <a href="/user/selectAllUser?pageNo=${pageHelper.lastPage}&pageSize=${pageHelper.pageSize}">尾页</a>

			</div>
		</div>
	</div>

</body>  
</html> 