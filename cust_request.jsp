<%@ page  errorPage = "ErrorPage.jsp" %>

<html>
<head>
<title>SELL SHARES</title>
<script language="javascript">
<!�Verifying the Sell Shares form for the entries that are left blank or incorrect and displaying the alert message. -->
function func_subm()
{
if(document.frm_sell.cid.value=="")
{
alert("Please type your CustomerId");
document.frm_sell.cid.focus();
}
else if(document.frm_sell.company.value=="")
{
alert("Please type the name of the company");
document.frm_sell.company.focus();
}
else if(document.frm_sell.no_shares.value=="")
{
alert("Please type the number of shares");
document.frm_sell.no_shares.focus();
}
else if(document.frm_sell.rate.value=="")
{
alert("Please type the rate per share");
document.frm_sell.rate.focus();
}
else if(isNaN(document.frm_sell.rate.value))
{
alert('The rate per share entry cannot have alphabets or special characters.')
document.frm_sell.rate.focus();
}
else 
{
var nshares=document.frm_sell.no_shares.value
if(isNaN(nshares))
{
alert('The number of shares entry cannot have alphabets or special characters.')
document.frm_sell.no_shares.focus();
}
}
}
</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!�Creating the Sell Shares page. -->
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr bgcolor="#FFFFFF"> 
<td> 
<div align="center"><font face="Arial, Helvetica, sans-serif" size="3" 
color="#000000"><b><font size="2">SELL         SHARES</font></b></font></div>
</td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
<form name="frm_sell" method="post" action="seller.jsp">
      <br>
<table width="85%" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr> 
      	<td width="20%">&nbsp;</td>
            <td width="28%">&nbsp;</td>
            <td colspan="2">&nbsp; </td>
      </tr>
      <tr> 
      	<td width="20%">&nbsp;</td>
<td width="28%"><font face="Arial, Helvetica,sans-serif" size="2"> CustomerID</font></td>
            <td colspan="2"> 
<input type="text" name="cid" disabled value="<%=(String)session.getValue("CUSTID")%>">
            </td>
      </tr>
      <tr> 
      	<td width="20%">&nbsp;</td>
<td width="28%"><font face="Arial, Helvetica, sans-serif" size="2">Name Of the Company</font></td>
            <td colspan="2"> 
            <input type="text" name="company">
            </td>
</tr>
      <tr> 
      	<td width="20%">&nbsp;</td>
<td width="28%"><font face="Arial, Helvetica, sans-serif" size="2"> No.Of Shares</font></td>
            <td colspan="2"> 
<input type="text"name="no_shares">
            </td>
      </tr>
      <tr> 
<td height="15" width="20%">&nbsp;</td>
<td height="15" width="28%"><font size="2" face="Arial, Helvetica, 
sans-serif">Type</font></td>
            <td height="15" colspan="2"> 
            <select name="type_share">
            <option value="O">ORDINARY</option>
            <option value="E">EQUITY</option>
<option value="P">PREFERENTIAL </option>
            </select>
            </td>
</tr>
      <tr> 
            <td width="20%">&nbsp;</td>
<td width="28%"><font face="Arial, Helvetica, sans-serif" size="2"> Rate </font></td>
            <td colspan="2"> 
            <input type="text" name="rate">
            </td>
</tr>
      <tr> 
      	<td width="20%">&nbsp;</td>
            <td width="28%">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
</tr>
      <tr> 
      	<td height="29" width="20%"> 
            <div align="center"> </div>
            </td>
            <td height="29" width="28%"> 
            <div align="center"> 
<input class=bu type="submit" name="Submit" value="Submit" onFocus="func_subm()"></div>
            </td>
            <td width="23%" height="29">
            <div align="center"> 
<input class=bu type="reset" name="Cancel" value="Cancel"></div>
            </td>
<td width="29%" height="29">&nbsp;</td>
</tr>
      </table>
</form>
</td>
</tr>
</table>
<hr color=#c0003b size=1>
<table border=0 cellpadding=0 cellspacing=0 width="100%">
<tbody> 
<tr> 
<td align=left valign=center height="35"> 
<p align=center><font face="Arial" size="1"> | <a class=copyright href="home.htm">HOME</a> 
&nbsp;| <a class=copyright href="mailto:info@investmentz.com">Contact us</a> 
&nbsp;| <a class=copyright href=Privacy.htm>Privacy Policy</a> 
&nbsp;| <a class=copyright       href="http://www.sebi.gov.in/">SEBI</a> 
&nbsp;| <a class=copyright       href="http://www.nse-india.com/">NSE</a> | <br>Investmentz.com - Your currency for online trading &amp; e-broking in        India </font></p>
</td>
</tr>
</tbody> 
</table>
</body>
</html>
The above listing shows creating the page for selling shares. The selling shares page enables you to type the name of the company, the number of shares, type and rate per share. 
The cust_request2.jsp File
The cust_request2.jsp file displays a page that enables a customer to buy their shares. The cust_request.jsp file also verifies the field entries, if they are left blank. Listing 8-20 shows how to create the cust_request.jsp file:
Creating the cust_request2.jsp File
<html>
<head>
<title>BUY SHARES</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="javascript">
<!�Verifying the Buy Shares form for the entries that are left blank or incorrect and displaying the alert message. -->
function func_subm()
{
if(document.frm_buy.cid.value=="")
{
alert("Please type your CustomerId");
document.frm_buy.cid.focus();
}
else if(document.frm_buy.no_shares.value=="")
{
alert("Please type the number of shares");
document.frm_buy.no_shares.focus();
}
else if(document.frm_buy.rate.value=="")
{
alert("Please type the rate per share");
document.frm_buy.rate.focus();
}
else if(isNaN(document.frm_buy.rate.value))
{
alert('The rate per share entry cannot have alphabets or special characters.')
document.frm_buy.rate.focus();
}
else 
{
var nshares=document.frm_buy.no_shares.value
	if(isNaN(nshares))
{
alert('The number of shares entry cannot have alphabets or special characters.')
document.frm_buy.no_shares.focus();
}
}
}
</script>
</head>
<body bgcolor="#FFFFFF">
<!�Creating the Buy Shares page. -->
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
<tr> 
<td> 
<div align="center"><font face="Arial, Helvetica, sans-serif" size="2" color="#000000"><b>BUY SHARES</b></font></div>
</td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr> 
<td> 
<form name="frm_buy" method="post" action="buyer.jsp">
      <br><br>
<table width="85%" border="0" cellspacing="0" cellpadding="0" align="center">
      <tr> 
      	<td width="20%">&nbsp;</td>
            <td width="28%">&nbsp;</td>
            <td colspan="2">&nbsp; </td>
</tr>
      <tr> 
      	<td width="20%">&nbsp;</td>
<td width="28%"><font face="Arial, Helvetica, sans-serif" size="2">CustomerID</font></td>
            <td colspan="2"> 
<input type="text" name="cid" disabled value="<%=(String)session.getValue("CUSTID")%>"></td>
      </tr>
      <tr> 
      	<td width="20%">&nbsp;</td>
<td width="28%"><font face="Arial, Helvetica, sans-serif" size="2">Name Of the Company</font></td>
            <td colspan="2"> 
            <input type="text" name="company">
            </td>
</tr>
      <tr> 
      	<td width="20%">&nbsp;</td>
<td width="28%"><font face="Arial, Helvetica, sans-serif" size="2">No.Of Shares</font></td>
            <td colspan="2"> 
<input type="text" name="no_shares">
            </td>
</tr>
      <tr> 
<td height="15" width="20%">&nbsp;</td>
<td height="15" width="28%"><font size="2" face="Arial, Helvetica, sans-serif">Type</font></td>
            <td height="15" colspan="2"> 
            <select name="type_share">
            <option value="O">ORDINARY</option>
            <option value="E">EQUITY</option>
<option value="P">PREFERENTIAL </option>
            </select>
            </td>
</tr>
      <tr> 
      	<td width="20%">&nbsp;</td>
<td width="28%"><font face="Arial, Helvetica, sans-serif" size="2">Rate </font></td>
            <td colspan="2"> 
            <input type="text" name="rate">
            </td>
</tr>
      <tr> 
      	<td width="20%">&nbsp;</td>
            <td width="28%">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
</tr>
      <tr> 
      	<td height="29" width="20%"> 
            <div align="center"> </div>
            </td>
            <td height="29" width="28%"> 
            <div align="center"> 
<input class=bu type="submit" name="Submit" value="Submit" onFocus="func_subm()"></div>
            </td>
            <td width="23%" height="29"> 
            <div align="center"> 
<input class=bu type="reset" name="Cancel" value="Cancel"></div>
            </td>
<td width="29%" height="29">&nbsp;</td>
</tr>
      </table>
      </form>
</td>
</tr>
</table>
<hr color=#c0003b size=1>
<table border=0 cellpadding=0 cellspacing=0 width="100%">
<tbody> 
<tr> 
<td align=left valign=center height="35"> 
<p align=center><font face="Arial" size="1"> | <a class=copyright href="home.htm">HOME</a> 
&nbsp;| <a class=copyright href="mailto:info@investmentz.com">Contact us</a> 
&nbsp;| <a class=copyright href=Privacy.htm>Privacy Policy</a> 
&nbsp;| <a class=copyright      href="http://www.sebi.gov.in/">SEBI</a> 
&nbsp;| <a class=copyright       href="http://www.nse-india.com/">NSE</a> | <br>Investmentz.com - Your currency for online trading &amp; e-broking in        India </font></p>
    	</td>
</tr>
</tbody> 
</table>
</body>
</html>
