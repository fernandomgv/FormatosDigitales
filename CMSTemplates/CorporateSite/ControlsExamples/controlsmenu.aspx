<%@ Page Language="c#" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_controlsmenu" CodeFile="controlsmenu.aspx.cs" %>
<%@ Register TagPrefix="cms" Namespace="CMS.skmMenuControl" Assembly="CMS.skmMenuControl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  lang="cz">
	<head runat="server">
	<title>CMSControlsExamples - Menu</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="Styles.css" type="text/css" rel="stylesheet"/>
	<style type="text/css">
		body
        {
            background-color: #f9fcfd;
        }
        .menustyle { FONT-WEIGHT: bold; FONT-SIZE: 8pt; CURSOR: default; COLOR: black; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #f9fcfd; cursor: hand}
        .menustyleover { BACKGROUND: #a4b2bc; COLOR: white; cursor: hand }
	</style>
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
		    <asp:Panel runat="server" ID="border" CssClass="Border" />
		    <div style="padding:20px 0px 0px 10px">
			    <cms:menu id="Menu1" runat="server" />
			</div>
		</form>
	</body>
</html>
