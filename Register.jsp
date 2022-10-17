<%@ page errorPage = "ErrorPage.jsp" language="java" import="java.sql.*,java.util.*,java.text.*" %>

<html>
<HEAD>
<!--Applying styles for the page. -->
<SCRIPT language=Javascript>
<!--Verifying the fields that are left blank in the page.-->
function validation()
{
if(!((document.form1.optPaymentType[0].checked)||(document.form1.optPaymentType[1].checked)||(document.form1.optPaymentType[2].checked)||(document.form1.optPaymentType[3].checked)||(document.form1.optPaymentType[4].checked)))
{
alert("Please Select the type of Payment you would like to go for.")
return false;
} 
if(document.form1.optPaymentType[4].checked)
{
if((document.form1.optPaymentType[0].checked)||(document.form1.optPaymentType[1].checked)||(document.form1.optPaymentType[2].checked))
	{
	if((document.form1.txtPaymentno.value=="")||(document.form1.txtDrawnon.value=="")||(document.form1.txtDated.value=="")||(document.form1.Payableat.options[0].selected))
	{
alert('Please fill payment details that is, Check for No/DrawnOn/Dated ')
	return false
	}
     }
if(document.form1.optPaymentType[0].checked)
{
if(document.form1.Payableat.value!="Delhi")
{
document.form1.Payableat.focus()
alert('Demand Drafts to be payable at DELHI only. Please select that option.')
return false
}
     }
if(document.form1.optPaymentType[3].checked)
{
document.form1.Payableat.disabled=false
document.form1.Payableat.options[0].selected
document.form1.Payableat.disabled=true

if(document.form1.Location.options[0].selected)
{
alert('Please select the name of the city where you would like pay the registration feein cash')
document.form1.Location.focus()
return false
}
  }
if(document.form1.optPaymentType.value=="")
{
alert('Please select your payment method')
document.form1.optPaymentType.focus()
return false
}
else
{
return true
}
}
}
<!--Verifying the pincode field in the customer registration form for alphabets.-->
function checkno(t)
{
var s = t.value
if(isNaN(s))
{
alert('The pin code cannot have alphabets. Please type the numbers only.')
t.focus()
t.select()
}
return false
}
<!--Verifying the phone number field in the customer registration form for alphabets.-->
function checkphoneno(t)
{
var s = t.value
for(i=0;i<s.length;i++)
{
if((s.charCodeAt[i]>=65 && s.charCodeAt(i)<=91) || (s.charCodeAt(i)>=96 && s.charCodeAt(i)<=123))
{
alert('The phone number cannot have alphabets.')
t.focus()
t.select()
break
}
}
return false
}
<!--Verifying the payment mode field in the Payment Method form. -->
function checkpayment(t)
{
if(document.form1.optPaymentType[4].checked)
{
 document.form1.txtPaymentno.value=""
 document.form1.txtPaymentno.disabled=true
 document.form1.txtDated.value=""
 document.form1.txtDated.disabled=false
 document.form1.gtl.disabled=false
 document.form1.gtl.value="Investmentz.com"  
 document.form1.gtl.disabled=true
 document.form1.txtDrawnon.value=""
 document.form1.txtDrawnon.disabled=true
document.form1.card_name.value=""
document.form1.card_name.disabled=true
document.form1.card_number.value=""
document.form1.card_number.disabled=true
document.form1.card_type[0].disabled=true
document.form1.card_type[1].disabled=true
document.form1.card_type[2].disabled=true
document.form1.card_type[3].disabled=true
document.form1.sl_month.disabled=true
document.form1.sl_year.disabled=true
document.form1.Payableat.disabled=false
document.form1.Payableat.value="sel"
document.form1.Payableat.disabled=true
document.form1.Location.value="Loc"
document.form1.Location.disabled=true
}
<!--Enabling the focus on certain fields, if the payment mode is draft. -->
if(t.value=="draft")
{
document.form1.txtPaymentno.disabled=false
document.form1.txtPaymentno.focus()
document.form1.txtDated.disabled=false
document.form1.gtl.disabled=false
document.form1.gtl.value="Investmentz.com"
document.form1.gtl.disabled=true
document.form1.txtDrawnon.disabled=false
document.form1.Payableat.disabled=false
document.form1.Payableat.value="Delhi"
document.form1.card_name.value=""
document.form1.card_name.disabled=true
document.form1.card_number.value=""
document.form1.card_number.disabled=true
document.form1.card_type[0].disabled=true
document.form1.card_type[1].disabled=true
document.form1.card_type[2].disabled=true
document.form1.card_type[3].disabled=true
document.form1.sl_month.disabled=true
document.form1.sl_year.disabled=true
document.form1.Location.value="Loc"
document.form1.Location.disabled=true
}
<!--Enabling the focus on certain fields, if the payment mode is cheque or payorder. -->
if ((t.value=="cheque")||(t.value=="payorder"))
{
document.form1.txtPaymentno.disabled=false
document.form1.txtPaymentno.focus()
document.form1.txtDated.disabled=false
document.form1.gtl.disabled=false
document.form1.gtl.value="Investmentz.com" 
document.form1.gtl.disabled=true
document.form1.txtDrawnon.disabled=false
document.form1.card_name.value=""
document.form1.card_name.disabled=true
document.form1.card_number.value=""
document.form1.card_number.disabled=true
document.form1.card_type[0].disabled=true
document.form1.card_type[1].disabled=true
document.form1.card_type[2].disabled=true
document.form1.card_type[3].disabled=true
document.form1.sl_month.disabled=true
document.form1.sl_year.disabled=true
document.form1.Payableat.value="sel"
document.form1.Payableat.disabled=false
document.form1.Location.value="Loc"
document.form1.Location.disabled=true
}
<!--Enabling the focus on certain fields, if the payment mode is cash. -->
if (t.value=="cash")
{
document.form1.Location.disabled=false
document.form1.Location.value="Loc" 
document.form1.txtPaymentno.disabled=false
document.form1.txtPaymentno.value="" 
document.form1.txtPaymentno.disabled=true
document.form1.txtDated.disabled=false
document.form1.txtDated.value="" 
document.form1.txtDated.disabled=true
document.form1.gtl.disabled=false
document.form1.gtl.value="" 
document.form1.gtl.disabled=true
document.form1.txtDrawnon.disabled=false
document.form1.txtDrawnon.value="" 
document.form1.txtDrawnon.disabled=true
document.form1.card_name.value=""
document.form1.card_name.disabled=true
document.form1.card_number.value=""
document.form1.card_number.disabled=true
document.form1.card_type[0].disabled=true
document.form1.card_type[1].disabled=true
document.form1.card_type[2].disabled=true
document.form1.card_type[3].disabled=true
document.form1.sl_month.disabled=true
document.form1.sl_year.disabled=true
document.form1.Payableat.disabled=false
document.form1.Payableat.value="sel"
document.form1.Payableat.disabled=true
}
<!--Enabling the focus on certain fields, if the payment mode is credit card. -->
if (t.value=="card")
{
document.form1.Location.value="Loc"
document.form1.Location.disabled=true
document.form1.txtPaymentno.disabled=false
document.form1.txtPaymentno.value="" 
document.form1.txtPaymentno.disabled=true
document.form1.txtDated.disabled=false
document.form1.txtDated.value="" 
document.form1.txtDated.disabled=true
document.form1.gtl.disabled=false
document.form1.gtl.value="" 
document.form1.gtl.disabled=true
document.form1.txtDrawnon.disabled=false
document.form1.txtDrawnon.value="" 
document.form1.txtDrawnon.disabled=true
document.form1.card_name.value=""
document.form1.card_name.disabled=false
document.form1.card_number.value=""
document.form1.card_number.disabled=false
document.form1.card_type[0].disabled=false
document.form1.card_type[1].disabled=false
document.form1.card_type[2].disabled=false
document.form1.card_type[3].disabled=false
document.form1.sl_month.disabled=false
document.form1.sl_year.disabled=false
document.form1.Payableat.disabled=false
document.form1.Payableat.value="sel"
document.form1.Payableat.disabled=true
}
}
<!--Verfying for the leap year. -->
function isLeapYear(Year) 
{
if(((Year%4)==0 ) && (((Year%100)!=0) || ((Year%400)==0)))
{
return (true);
}
else
{
return(false)
}
}
<!--Verifying the date format entered for the date at which the cheque will be given clearance. -->
function checkDate(objName,myValue)
{
var mNames = "JanFebMarAprMayJunJulAugSepOctNovDec"
var mValues = "312831303130313130313031"
var alertMsg = ""
var forFocus = "document.form1."+objName+".focus()"
var wrongdate = true
var args = checkDate.arguments
var dt=new Date()
var tm=dt.getTime()
objName = args[0]
myValue = args[1]
if(myValue.length<10)
{
alert("Please type the date in the format, dd/mm/yyyy!")
eval(forFocus);
return false
}
if( (myValue.substring(2,3) != "/")||(myValue.substring(5,6) != "/") ) 
{
alert("Please type the date in format dd/mm/yyyy!")
eval(forFocus);
return false
}
myDD = parseInt(myValue.substring(0,2),10)
myMM = parseInt(myValue.substring(3,5),10)
myYYYY = parseInt(myValue.substring(6,10),10)
if(myYYYY<2001) 
{
alert("Year should be greater than 2001")
eval(forFocus)
return false
}
if( (isNaN(myDD)) || (isNaN(myMM)) || (isNaN(myYYYY)) ) 
{
alert("Invalid date entered!")
eval(forFocus)
return false
}
if( (myMM > 12) || (myMM <= 0) )
{
alert("Invalid month entered!")
eval(forFocus)
return false
}
var lastDate = 0
if(myMM==2) 
{ 
if(isLeapYear(myYYYY)) {    
lastDate = 29
}
else 
{ 
lastDate = 28 
}
}
else 
{
lastDate = mValues.substring((myMM-1)*2, (myMM-1)*2+2)
}
if( myDD > lastDate || (myDD <=0) )
{
alert("Invalid Date entered!")
eval(forFocus)
return false
}
var newValue = ""
if(myDD < 10) {myDD = "0"+myDD }
if(myMM<10) {myMM = "0"+myMM }
newValue = myDD+"/"+myMM+"/"+myYYYY
var forValue = "document.form1."+objName+".value = newValue"
eval(forValue)
return true
}
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table align=center border=0 cellpadding=0 cellspacing=0 width="98%">
<tbody> 
<tr bgcolor=#FFFFFF align="left"> 
<td height=30 valign=top colspan="2"> 
<div align="left"><img src="vinn.png" width="190" height="45" align="top" vspace="0" hspace="0"> </div>
</td>
</tr>
</tbody> 
</table>
<table align=center border=0 cellpadding=0 cellspacing=0 width="98%" dwcopytype="CopyTableRow">
<tbody> 
<tr> 
<td colspan=2 valign=top> 
      <hr color=#c0003b size=1>
</td>
</tr>
<!-- Top hyperlink row ends. --> </tbody> 
</table>
<%
//Declaring the variables for retrieving the values of the customer registration form.
String title="", name1="", name2="", name3="", name="",address1="", address2="", address="",RPhone=""; 
String MPhone="", OPhone="", Fax="", city="", dob="", dobday="", dobmonth="", dobyear="", state="", email="";
String altemail="", country="", pincode="", occupation="", loginname="", password="", incomegroup="";
String cid="";
//Retrieving the values of the text fields in the String variables.
title=request.getParameter("title");
name1=request.getParameter("name1");
name2=request.getParameter("name2");
name3=request.getParameter("name3");
if(name2!=null)
{
name=name1+name2;
}
address1 =request.getParameter("address1");
address2 =request.getParameter("address2");
if(address2!=null)
{
address=address1+address2;
}
RPhone=request.getParameter("RPhone");
MPhone=request.getParameter("MPhone");
OPhone=request.getParameter("OPhone");
Fax=request.getParameter("Fax");
city=request.getParameter("city");
dobday=request.getParameter("DOBDay");
dobmonth=request.getParameter("DOBMonth");
dobyear=request.getParameter("DOBYear");
dob=dobmonth+"/"+dobday+"/"+dobyear;
state=request.getParameter("state");
email=request.getParameter("email");
altemail=request.getParameter("altemail");
country=request.getParameter("country");
pincode=request.getParameter("pincode");
occupation=request.getParameter("occupation");
loginname=request.getParameter("loginname");
password=request.getParameter("password");
incomegroup=request.getParameter("incomegroup");
//Establishing connection with the savv database.
Connection conn=null;
PreparedStatement stmt;
ResultSet rst;
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	conn=DriverManager.getConnection("jdbc:odbc:vinn");
	stmt=conn.prepareStatement("insert into customer_master(NAME, LNAME, 	TITLE,ADDRESS,PHONE_R,PHONE_O, PHONE_M, FAX, CITY, STATE, DOB, PINCODE, EMAILID, 	OCCUPATION,INCOME, DATE_OF_OPENING, LOGNAME, 	PASSWORD)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) 	");
	java.util.Date now = new java.util.Date();
	DateFormat df1 = DateFormat.getDateInstance(DateFormat.SHORT);
        String s1 = df1.format(now);
	stmt.setString(1,name);
	stmt.setString(2,name3);
	stmt.setString(3,title);
	stmt.setString(4,address1);
	stmt.setString(5,RPhone);
	stmt.setString(6,OPhone);
	stmt.setString(7,MPhone);
	stmt.setString(8,Fax);
	stmt.setString(9,city);
	stmt.setString(10,state);
	stmt.setString(11,dob);
	stmt.setString(12,pincode);
	stmt.setString(13,email);
	stmt.setString(14,occupation);
	stmt.setString(15,incomegroup);
	stmt.setString(16,s1);
	stmt.setString(17,loginname);
	stmt.setString(18,password);
	int rr=stmt.executeUpdate();
	String sel_query="select cid from customer_master where name=? and password=?";
	
	if (rr>=1)
	{
	stmt=conn.prepareStatement(sel_query);
	stmt.setString(1,name);
	stmt.setString(2,password);
	rst = stmt.executeQuery();
        
	
	if(rst.next())
	{
         cid=rst.getString(1);
	}
	}
	conn.close();
	}
	catch(SQLException ee)
	{out.println(ee);}
%> <br>
<!--Designing the layout for the Payment Method form. -->
<table align=center border=0 width=700>
<tbody> 
<tr align=middle bgcolor="#FFFFFF"> 
<td colspan=2 height=2>
<div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Dear         Customer </font></div>
    	</td>
</tr>
<tr align=middle bgcolor="#FFFFFF"> 
<td colspan=2 height=2>
<div align="left"><font face="Arial, Helvetica, sans-serif" size="2">
	<%
out.println("Your CustomerID is" +cid);
out.println(".Please use this CustomerID for further transactions.");
	%>
</font></div>
</td>
</tr>
<tr align=middle bgcolor="#FFFFFF"> 
<td colspan=2 height=2>
<div align="left"><font face="Arial, Helvetica, sans-serif" size="2">In         order to become an active member of our application and gain access to the services provided, you need to pay an amount of Rs 1000/.</font></div>
</td>
</tr>
</tbody> 
</table>
<br>
<form name="form1" action="paym.jsp" method="post" >
<table align=center border=0 width=700>
<tbody> 
<tr align=middle bgcolor="#c0003b"> 
<td colspan=2 height=2><font face="Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Payment Method</font></b> </font>
</td>
</tr>
<tr align=middle valign=top> 
<td colspan=2><font face="Arial, Helvetica, sans-serif" size="2"> 
<!--Designing the radio buttons for the payment mode in the Payment Method form. -->
<input CHECKED name=optPaymentType       onClick="return checkpayment(this)" type=radio value=draft>DD 
<input name=optPaymentType onClick="return checkpayment(this)" type=radio value=cheque>Cheque 
<input name=optPaymentType onClick="return checkpayment(this)" type=radio value=payorder>PayOrder 
<input name=optPaymentType onClick="return checkpayment(this)" type=radio value=cash>Cash 
<input name=optPaymentType onClick="return checkpayment(this)"  type=radio value=card>Credit Card</font></td>
<tr> 
<td align=right height=3><font face="Arial, Helvetica, sans-serif" size="2">DD/Cheque/PO No:</font></td>
<td height=3><font face="Arial, Helvetica, sans-serif" size="2"> 
<input maxlength=15 name=txtPaymentno size=11>&nbsp;&nbsp;&nbsp;Dated(dd/mm/yyyy) : 
<input maxlength=12 name=txtDated onBlur=checkDate(this.name,this.value) size=11></font></td>
<tr> 
<td align=right height=2 valign=center><font face="Arial, Helvetica, sans-serif" size="2">To :</font></td>
<td height=2> <font face="Arial, Helvetica, sans-serif" size="2"> 
      <input maxlength=43 name=gtl size=42 
      value="Investmentz.com ">
      <script language=JavaScript>
document.form1.gtl.disabled=true
</script>
      </font></td>
<tr> 
<td align=right height=2 valign=bottom> <font face="Arial, Helvetica, sans-serif" size="2">Drawn On : </font></td>
<td align=left height=2 valign=top><font face="Arial, Helvetica, sans-serif" size="2"> 
<input maxlength=50 name=txtDrawnon size=15></font></td>
<tr> 
<td align=right height=2 valign=bottom> <font face="Arial, Helvetica, sans-serif" size="2">Payable At :</font></td>
<td height=2 valign=bottom> <font face="Arial, Helvetica, sans-serif" size="2"> 
      <select name=Payableat>
<option selected value=sel>---Select</option>
<!—Providing the values for the field, payableat. -->
      <option value=Ambala>Ambala</option>
      
<option value=MalviyaNagar>MalviyaNagar </option>
      </select>
      Location(for cash): 
      <select name=Location>
<option selected value=Loc>---Select</option>
<!—Providing the values for the field, location. -->
      <option value=Ambala>Ambala</option>
      <option value=Delhi>Delhi</option>
      
      </select></font></td>
</tr>
<tr> 
<td align=right height=2 valign=bottom><font face="Arial, Helvetica, sans-serif"                    size=2> Cardholders Name </font></td>
<td height=2 valign=bottom> 
<input type="text"    name="card_name" size=18><font face=verdana size=1> As it appears on the card</font></td>
</tr>
<tr> 
<td align=right height=2 valign=bottom> <font face="Arial, Helvetica, sans-serif"                                 size=2>Card Number&nbsp;</font></td>
<td height=2 valign=bottom> 
<input  type="text" maxlength=16 name="card_number" size=18>
</td>
</tr>
<tr> 
<td align=right height=2 valign=bottom> <font face="Arial, Helvetica, sans-serif"                               size=2>Card Type</font></td>
<td height=2 valign=bottom> 
<input CHECKED name="card_type" type=radio value=VISA>
<font face="Arial, Verdana" size=2>Visa </font> 
<input name=card_type type=radio value=MC>
      <font face="Arial, Verdana" size=2>Master 
<input name=card_type type=radio      value=Amex>Amex 
<input name=card_type type=radio value=Diners>Diners</font></td>
</tr>
<tr> 
<td align=right height=2 valign=top><font                                face="Arial, Helvetica, sans-serif"                 size=2>Expiry Date </font></td>
<td height=2 valign=bottom><font face= "Arial, Helvetica, sans-serif" size="2"> 
      <select name="sl_month">
      <option selected value=1>1</option>
<option value=2>2</option>
      <option value=3>3</option>
      <option value=4>4</option>
<option value=5>5</option>
      <option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>
</select>
      <select name="sl_year">
<option selected      value=2004>2004</option>
<!—Providing the values for the field, sl_year. -->
      <option value=2005>2005</option>
<option value=2006>2006</option>

<option value=2025>2025</option>
      <option value=2026>2026</option>
</select>
      <br>
<font size="1">&nbsp; MM &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YY</font> </font></td>
<script language=JavaScript>
<!—Providing the default values for the Payment Method form. -->
document.form1.Payableat.value="Delhi"
document.form1.Location.disabled=true
document.form1.card_name.value=""
document.form1.card_name.disabled=true
document.form1.card_number.value=""
document.form1.card_number.disabled=true
document.form1.card_type[0].disabled=true
document.form1.card_type[1].disabled=true
document.form1.card_type[2].disabled=true
document.form1.card_type[3].disabled=true
document.form1.sl_month.disabled=true
document.form1.sl_year.disabled=true
</script>
</tr>
<tr> 
<td align=right height=2 valign=bottom colspan="2"><div align="center"><font color=#000099 face=Verdana,Arial size=-1> 
<input type="hidden" name="name1" value="<%=name1%>">
<input type="hidden" name="password" value="<%=password%>">
<input name=cmdSubmit onClick="return validation()" type=submit value="Submit Order" class=bu>
<input type=reset value=Reset name="reset" class=bu></font></div>
</td>
</tr>
</tbody> 
</table>
<hr color=#c0003b size=1>
</form>
<table border=0 cellpadding=0 cellspacing=0 width="100%">
<tbody> 
<tr> 
<td align=left valign=center height="35"> 
<p align=center><font face="Arial" size="1"> | <a class=copyright href="home.htm">HOME</a>&nbsp;| 
<a class=copyright href="mailto:info@investmentz.com">Contact us</a> &nbsp;| 
<a class=copyright href=privacy.htm>Privacy Policy</a> &nbsp;| 
<a class=copyright href="http://www.sebi.gov.in/">SEBI</a> &nbsp;| 
<a class=copyright 
href="http://www.nse-india.com/">NSE</a> | <br>Investmentz.com - Your currency for online trading &amp; e-broking in        India 
</font></p>
</td>
</tr>
</tbody> 
</table>
</body>
</html>
