<%@ page errorPage = "ErrorPage.jsp" language="java" import="java.sql.*" %>
<%
String cid="",name="", password="", paytype="", payno="", paydate="", payat="", loc="", cardhname="",cardno="", cardtype="", cmon="", cyr="", edate="";
 card_num;
//Retrieving the values of text fields in the String variables.
name=request.getParameter("name1");
password=request.getParameter("password");
paytype=request.getParameter("optPaymentType");
payno=request.getParameter("txtPaymentno");
paydate=request.getParameter("txtDated");
payat=request.getParameter("Payableat");
loc=request.getParameter("Location");
cardhname=request.getParameter("card_name");
cardno=request.getParameter("card_number");
card_num = Integer.parseInt(cardno);
cardtype=request.getParameter("card_type");
cmon=request.getParameter("sl_month");
cyr=request.getParameter("sl_year");
edate=cmon+"/"+"01/"+cyr;
int len=0, len2=0;

int cidn = 120;

String yr="", mon="", dy="";
if(paydate!=null)
{
len=paydate.indexOf("/");
dy=paydate.substring(0,len);
len2=paydate.indexOf("/",len+1);
mon=paydate.substring(len+1,len2);
yr=paydate.substring(len2+1,paydate.length());
}
paydate=mon+"/"+dy+"/"+yr;
out.println(name+password);
//Establishing connection with the database.
Connection conn=null;
PreparedStatement stmt;
ResultSet rs=null;
int y=0;
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
conn=DriverManager.getConnection("jdbc:odbc:vinn");
stmt=conn.prepareStatement(" select cid from customer_master where name=? and password=? ");
stmt.setString(1,name);
stmt.setString(2,password);

rs=stmt.executeQuery();
while(rs.next())
{
cid=rs.getString(1);
}


//Retrieving the value of the selected payment mode and inserting it into the CBalance table of the savv database.
if(paytype.equals("draft")||paytype.equals("cheque")||paytype.equals("payorder"))
{
stmt=conn.prepareStatement("insert into cbalance(cid,MODE_OF_PAYM,cheque_no,cheque_date,bank_drawn) values(?,?,?,?,?)");
stmt.setString(1,cid);
stmt.setString(2,paytype); 
stmt.setString(3,payno);
stmt.setString(4,paydate); 
stmt.setString(5,payat);
y=stmt.executeUpdate();
}
if(paytype.equals("cash"))
{
stmt=conn.prepareStatement("insert into cbalance(cid,MODE_OF_PAYM,location) values(?,?,?)");
stmt.setString(1,cid); 
stmt.setString(2,paytype);
stmt.setString(3,loc);
y=stmt.executeUpdate();
}
if(paytype.equals("card"))
{
stmt=conn.prepareStatement("insert into CBalance (cid,Mode_OF_PAYM,Card_type,Card_no, Card_holder_name) values (?,?,?,?,?)");
stmt.setString(1,cid);
stmt.setString(2,paytype);
stmt.setString(3,cardtype);
stmt.setInt(4,card_num);
stmt.setString(5,cardhname);
y=stmt.executeUpdate();
}
conn.close();
}catch(SQLException ee){out.println(ee);}

if(y>0)
{
%>
<jsp:forward page="home.htm" />
<%
}
%>
