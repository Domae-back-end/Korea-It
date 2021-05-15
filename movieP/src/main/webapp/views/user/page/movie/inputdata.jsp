<%@page import="java.util.HashMap"%>
<%@page import="com.model.MovieInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.model.DbMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String kind = "boxoffice";
	String dd = "";
	if(request.getParameter("kind") != null){
		kind = request.getParameter("kind");
	}
	
	if(request.getParameter("dd") != null){
		dd = request.getParameter("dd");
	}
	
%>

<%=dd %>
