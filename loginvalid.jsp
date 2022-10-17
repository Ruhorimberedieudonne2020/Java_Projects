<%@ page errorPage = "ErrorPage.jsp" language="java" import="java.sql.*" %>
<%
/*Verifying the second level login entered by the customer with Customer_Master table of the savv.mdb database. */
Connection conn=null;
PreparedStatement stmt;
ResultSet rs=null;
try
{
String cid, pswd;
cid="";
pswd="";
int i=0;
cid=request.getParameter("cid");
pswd=request.getParameter("pswd");
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
conn=DriverManager.getConnection("jdbc:odbc:vinn");
stmt=conn.prepareStatement("select * from customer_master where cid=? and Password=? ");
stmt.setString(1,cid);
stmt.setString(2,pswd);
rs=stmt.executeQuery();
while(rs.next())
{
i++;
out.println(i);
System.out.println(i);
}
if(i>0)
{
/*Creating a session variable to keep track of the CustomerID in the whole application. */
session.putValue("CUSTID",cid);
%>
<jsp:forward page="sellbuy2.htm" />
<%
out.println("Welcome to Investmentz.com");
%>
<%
}else{
%>
<script language="javascript">
<!—Dispalying the alert message, if the second level login is incorrect. -->
alert("Invalid CustomerID/password. Please Re-enter");
location.href="login.jsp"
</script>
<%
}
conn.close();
}
catch(SQLException ee){out.println(ee);}
%>
