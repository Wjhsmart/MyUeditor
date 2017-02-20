<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>在线编辑器实例</title>
<!-- 引用UEditor的配置文件 -->
<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.config.js"></script>
<!-- 引用UEditor的全部主文件 -->
<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>

	<a href="<%=path %>/article/all">查看所有文章</a>
	<a href="UEditorDemo.jsp">查看UEditorDemo</a>
	<form action="http://www.baidu.com/baidu" target="_blank">
		<table bgcolor="#FFFFFF">
			<tr>
				<td>
					<input name=tn type=hidden value=baidu> 
						<a href="http://www.baidu.com/">
							<img src="http://img.baidu.com/img/logo-80px.gif" alt="Baidu"
							align="bottom" border="0">
						</a> 
					<input type=text name=word size=30> 
					<input type="submit" value="百度一下">
				</td>
			</tr>
		</table>
	</form>
	<form action="<%=path %>/article/add" method="post">
		<h4>文章标题</h4>
		<input type="text" name="article.title" placeholder="请输入文章的标题" />
		<h4>文章内容</h4>
		<script id="editor" name="article.content" type="text/plain" style="width:1024px;height:300px;"></script>
		<h4>发布时间</h4>
		<input type="date" name="article.releaseTime" />
		<input type="submit" value="发布" />
	</form>
	
	
	
</body>
<script type="text/javascript">
	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	var ue = UE.getEditor('editor');
	
	ue.ready(function() {
		ue.setHeight(300);
	});
</script>
</html>