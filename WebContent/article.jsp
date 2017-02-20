<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文章列表</title>
</head>
<body>
	<s:iterator value="#request.articles" var="article">
		<h3>文章标题：</h3>
		${article.title }
		<h3>文章内容：</h3>
		${article.content }
		<h3>发布时间：</h3>
		${article.releaseTime }
		<br /><br /><br /><br />
		<hr />
	</s:iterator>
</body>
</html>