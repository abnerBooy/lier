<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/calendar.css">
<!-- 注意：ShowCalendar.js所在文件夹应放在WebRoot里，WEB-INF外！！！！！！！！ -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/ShowCalendar.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/calendar.js"></script>
<title>添加用户的视图</title>

</head>
<body style="text-align: center;">
	<br />
	<form id="form"
		action="${pageContext.request.contextPath }/AddCustomerServlet"
		method="post" onsubmit="return mkpre()">
		<table border="1" width="50%" align="center">
			<tr>
				<td>客户姓名</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>客户性别</td>
				<!-- <td>
                <input type="radio" name="gender" value="男">男
                <input type="radio" name="gender" value="女">女
                <input type="radio" name="gender" value="人妖">人妖
            </td> -->
				<td><c:forEach var="gender" items="${genders}">
						<input type="radio" name="gender" value="${gender }">${gender }            
            </c:forEach></td>
			</tr>
			<tr>
				<td>生日</td>
				<td><input type="text" name="birthday" class="birthday" id="birthday" value="">
					<!-- <input type="text" name="birthday" id="birthday" title="点击选择" onclick="showCalendar(this.id)"> -->
				</td>
			</tr>

			<tr>
				<td>手机</td>
				<td><input type="text" name="cellphone"></td>
			</tr>
			<tr>
				<td>邮箱</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>爱好</td>
				<!--  <td>
                <input type="checkbox" name="pre" value="唱歌">唱歌
                <input type="checkbox" name="pre" value="跳舞">跳舞
                <input type="checkbox" name="pre" value="逛夜店">逛夜店
            </td> -->
				<td><c:forEach var="pre" items="${preferences }">
						<input type="checkbox" name="pre" value="${pre }">${pre }
            </c:forEach></td>
			</tr>
			<tr>
				<td>客户类型</td>
				<!--  <td>
                <input type="radio" name="type" value="VIP客户">VIP客户
                <input type="radio" name="type" value="重点客户">重点客户
                <input type="radio" name="type" value="一般客户">一般客户
            </td> -->

				<td><c:forEach var="type" items="${types }">
						<input type="radio" name="type" value="${type }">${type }
            </c:forEach></td>
			</tr>
			<tr>
				<td>客户备注</td>
				<td><textarea rows="5" cols="60" name="dwescription"></textarea>
				</td>
			</tr>
			<tr>
				<td><input type="reset" value="重置"></td>
				<td><input type="submit" value="添加客户"></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
    $(".birthday").Calendar({filter:function(time){
		var date = new Date(time);
		
		return true;
	}});
    function mkpre(){
    		var pres = document.getElementsByName("pre");
            var preference = "";
            for(var i=0;i<pres.length;i++) {
                var input = pres[i];
                if(input.checked==true) {
                    preference = preference + input.value + ","; 
                }
            }
            preference = preference.substring(0, preference.length-1); // preference="唱歌,跳舞,夜生活";
            // 在form表单创建一个input隐藏输入项，如：<input type="hidden" name="preference" value="唱歌,跳舞,夜生活,...">
            var form =  document.getElementById("form");
            var input = document.createElement("input");
            input.type = "hidden";
            input.name = "preference";
            input.value = preference;
            form.appendChild(input);
            return true;
    	}
    </script>
</body>
</html>