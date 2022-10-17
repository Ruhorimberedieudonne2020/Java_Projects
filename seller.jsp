<%@ page errorPage = "ErrorPage.jsp" language="java" import="java.sql.*"  %>
<html>
<head>
<script language="javascript">
function b1click()
{
location.href="cust_request.html";
}
function b2click()
{
f.action="home.htm";
f.method="post";
f.target="_top";
f.submit();
}
</script>
</head>
<body bgcolor="#FFFFFF">
<%
/*Retrieving the values of Sell Shares form in variables. */
String cid,company,no_shares,type_share,rate;
cid=(String)session.getValue("CUSTID");
company=request.getParameter("company");
no_shares=request.getParameter("no_shares");
type_share=request.getParameter("type_share");
rate=request.getParameter("rate");
int cust_id, share_no, share_rate;
cust_id=Integer.parseInt(cid);
share_no=Integer.parseInt(no_shares);
share_rate=Integer.parseInt(rate);
/*Storing the values of the variables in the Seller table of the savv.mdb database. */
 
Connection conn=null;
PreparedStatement stmt;
ResultSet rs=null;
int y=0;
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
conn=DriverManager.getConnection("jdbc:odbc:vinn");
stmt=conn.prepareStatement("insert into seller(CID,COMPANY_NAME,NO_OF_SHARES,RATE_PER_SHARE, TYPE_SHARE) values (?,?,?,?,?)");
stmt.setInt(1,cust_id);
stmt.setString(2,company);
stmt.setInt(3,share_no);
stmt.setInt(4,share_rate);
stmt.setString(5,type_share);
y=stmt.executeUpdate();
if(y>=1)
{
stmt=conn.prepareStatement("select * from seller where cid=?");
stmt.setString(1,cid);
rs=stmt.executeQuery();
%> 
<br><br>
<table border="1" align="center" width="75%" cellpadding="0" cellspacing="0" 

bordercolorlight="#c0003b" bordercolordark="#FFFFFF">
  <tr bgcolor="#c0003b"> 
    <td><font color="#FFFFFF"><b><font size="2" face="Arial, Helvetica, 
sans-serif">CompanyName</font></b></font></td>
    <td><font color="#FFFFFF"><b><font size="2" face="Arial, Helvetica, 
sans-serif">No_Of_Shares</font></b></font></td>
    <td><font color="#FFFFFF"><b><font size="2" face="Arial, Helvetica, sans-serif">Rate       per share</font></b></font></td>
    <td><font color="#FFFFFF"><b><font size="2" face="Arial, Helvetica, 
sans-serif">Type</font></b></font></td>
  </tr>
  <%
while(rs.next())
{
String a=rs.getString(2);
String b=rs.getString(3);
String c=rs.getString(4);
String d=rs.getString(5);
%> 
  <tr> 
    <td><font size="2" face="Arial, Helvetica, sans-serif"><%=a%></font></td>
    <td><font size="2" face="Arial, Helvetica, sans-serif"><%=b%></font></td>
    <td><font size="2" face="Arial, Helvetica, sans-serif"><%=c%></font></td>
    <td><font size="2" face="Arial, Helvetica, sans-serif"><%=d%></font></td>
  </tr>
  <%
}
}
conn.close();
}
catch(SQLException ee){out.println("Error is :"+ee );}
%> 
</table>
<form name="f">
  <div align="center">
    <input type="button" name="b1" value="More to sell..." onclick="b1click()">
    <input type="button" name="b2" value="Proceed to Checkout" onclick="b2click()">
  </div>
</form>
</body>
</html>
