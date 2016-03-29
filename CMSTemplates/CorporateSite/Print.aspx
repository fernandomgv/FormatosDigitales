<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Print.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_Print" %>
<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsrepeater.ascx" TagName="CMSRepeater" TagPrefix="uc1" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server" enableviewstate="false">
    <title>Print page</title>
    <meta http-equiv="content-style-type" content="text/css" /> 
    <meta http-equiv="content-script-type" content="text/javascript" /> 
    <link type="text/css" rel="stylesheet" href="~/CMSPages/GetCSS.aspx?stylesheetname=CorporateSite" /> 
    <link href="~/CMSPages/GetCSS.aspx?stylesheetname=CorporateSitePrinter" type="text/css" rel="stylesheet" media="print" />
</head>
<body>
    <form id="form1" runat="server">    
        <cms:CMSPageManager ID="CMSPageManager1" runat="server" />
        <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images-(1)/CompanyLogo.aspx" AlternateText="Company logo" />
        <uc1:CMSRepeater ID="repeater" runat="server" />    
    </form>
</body>
</html>
