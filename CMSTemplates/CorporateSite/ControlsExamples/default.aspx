<%@ Page Language="c#" Inherits="CMSTemplates_CorporateSiteASPX_ControlsExamples_default" CodeFile="default.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>CMS Controls Examples</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	</head>
	<frameset border="0" rows="40,*">
		<frame name="cmsheader" src="header.aspx" scrolling="no" noresize="noresize" frameborder="0" />
		<frameset border="0" cols="230,*" runat="server" id="colsFrameset" >
			<frame name="menu" src="controlsmenu.aspx" scrolling="auto" frameborder="0" runat="server" />
			<frame name="desktop" scrolling="auto" frameborder="0" runat="server" />
		</frameset>
		<noframes>
			<p id="p1">
				This HTML frameset displays multiple Web pages. To view this frameset, use a 
				Web browser that supports HTML 4.0 and later.
			</p>
		</noframes>
	</frameset>
</html>
