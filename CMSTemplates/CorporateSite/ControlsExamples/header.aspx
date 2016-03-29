<%@ Page Language="C#" AutoEventWireup="true" CodeFile="header.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_header" Theme="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
    <head runat="server" enableviewstate="false">
	    <title>CMSControlsExamples - Header</title>
	    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	    <link href="Styles.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
		<asp:Panel runat="server" ID="pnlBody" CssClass="CtrlExamples_Header">
            <asp:Panel runat="server" ID="pnlLeft" CssClass="CtrlExamples_HeaderLeft" />
        </asp:Panel>
		</form>
	</body>
</html>
