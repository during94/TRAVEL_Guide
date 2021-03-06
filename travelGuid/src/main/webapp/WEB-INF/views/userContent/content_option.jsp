<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${detail.c_kind eq '1'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1" selected="selected">서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '2'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1">서울</option>
				<option value="2" selected="selected">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '3'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1"  >서울</option>
				<option value="2" >부산</option>
				<option value="3" selected="selected">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '4'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1"  >서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4" selected="selected">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '5'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1"  >서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5" selected="selected">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '6'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1"  >서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6" selected="selected">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '7'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1"  >서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7" selected="selected">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '8'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1"  >서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8" selected="selected">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '9'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1"  >서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9" selected="selected">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '10'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1"  >서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10" selected="selected">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '11'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1"  >서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11" selected="selected">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '12'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1"  >서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12" selected="selected">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '13'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1"  >서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13" selected="selected">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '14'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1"  >서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14" selected="selected">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '15'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1"  >서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15" selected="selected">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:when>
	<c:when test="${detail.c_kind eq '16'}">
		<td colspan="2">
			<select name="c_kind">
				<option value="0">전체</option>
				<option value="1"  >서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16" selected="selected">제주</option>
			</select>
		</td>
	</c:when>
	
	
	<c:otherwise>
		<td colspan="2">
			<select name="c_kind">
				<option value="0" selected="selected">전체</option>
				<option value="1"  >서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">광주</option>
				<option value="5">대전</option>
				<option value="6">울산</option>
				<option value="7">세종</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>
		</td>
	</c:otherwise>
</c:choose>
</body>
</html>