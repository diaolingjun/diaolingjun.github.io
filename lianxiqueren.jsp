<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" errorPage="error.jsp"%>
<html>
<head>
<title>添加留言信息</title>

<body>
	<%
		request.setCharacterEncoding("utf-8");
		String submit = request.getParameter("submit");
		

		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String liuyan = request.getParameter("liuyan");
		String action = request.getParameter("action");
		String diyid = request.getParameter("diyid");
		String di = request.getParameter("do");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://rm-bp1d6ps88g25ulxi2bo.mysql.rds.aliyuncs.com:3306/webconnect?serverTimezone=UTC&characterEncoding=utf-8", "root",
				"123456Zl");
		//使用Statement对象
		//Statement stmt = con.createStatement();
		//String sql = "insert into bookinfo(bookname,author,price) values('" + bookname + "','" + author + "'," + price + ")";
		//int i = stmt.executeUpdate(sql);
		
		
		PreparedStatement stmt = con.prepareStatement("insert into liuyan(name,phone,email,liuyan,action,diyid,do) values(?,?,?,?,?,?,?)");
		stmt.setString(1, name);
		stmt.setString(2, phone);
		stmt.setString(3, email);
		stmt.setString(4,liuyan);
		stmt.setString(5,action);
		stmt.setString(6,diyid);
		stmt.setString(7,di);
		int i = stmt.executeUpdate();
		
		
		if (i == 1) {
			out.println("<script language='javaScript'>alert('提交成功，点击确定返回主页面！');</script>");
			response.setHeader("refresh", "1;url=index.html");
		} else {
			out.println("<script language='javaScript'>alert('操作失败，点击确定返回原页面！');</script>");
			response.setHeader("refresh", "1;url=index.html");
		}
		stmt.close();
		con.close();
		
	%>
</body>
</html>
