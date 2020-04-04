<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:url var="css" value="/resources/css"/>
<spring:url var="js" value="/resources/js"/>
<spring:url var="images" value="/resources/images"/>

<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Online Shopping - ${title}</title>
    
    <script>
    	window.menu = '${title}';
    	window.contextRoot = '${contextRoot}'
    </script>

    <!-- Bootstrap core CSS -->
    <link href="${css}/bootstrap.min.css" rel="stylesheet">
	
	
	<!-- Bootstrap readable them -->
	<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">
	

	<!-- Bootstrap DataTable them -->
	<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">
	
	
    <!-- Add custom CSS here -->
    <link href="${css}/myapp.css" rel="stylesheet">

</head>

<body>

	<div class = "wrapper">
	
	
	<!-- Navigation -->
	<%@include file="./shared/navbar.jsp" %>
	
	<!-- page container -->
	
		<div class="content">
	
			<c:if test="${userClickHome == true }">
			<%@include file="home.jsp" %>
			</c:if>
			
			<!-- Load only when user click about -->
			<c:if test="${userClickAbout == true }">
			<%@include file="about.jsp" %>
			</c:if>
			
			<!-- Load only when user click Contact-->
			<c:if test="${userClickContact == true }">
			<%@include file="contact.jsp" %>
			</c:if>
			
			<!-- Load only when user click Product -->
			<c:if test="${userClickAllProducts == true or userClickCategoryProducts == true}">
			<%@include file="listProducts.jsp" %>
			</c:if>
			
			<!-- Load only when user click show single product -->
			<c:if test="${userClickShowProduct == true }">
			<%@include file="singleProduct.jsp" %>
			</c:if>
			
		</div>
	
		<!-- Footer come here -->
	<%@include file="./shared/footer.jsp" %>
	

    <!-- /.container -->

    <!-- JavaScript -->
    <script src="${js}/jquery.js"></script>
    
    <script src="${js}/bootstrap.min.js"></script>
	
	<!-- datatable plugin -->
	<script src="${js}/jquery.dataTables.js"></script>
	
	<!-- datatable Bootstrap scripts -->
	<script src="${js}/dataTables.bootstrap.js"></script>
	    
    <!-- self coded javascript -->
	<script src="${js}/myapp.js"></script>
	
	</div>
	
</body>

</html>
