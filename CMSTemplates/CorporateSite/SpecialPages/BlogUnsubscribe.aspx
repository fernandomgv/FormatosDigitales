<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master" AutoEventWireup="true" CodeFile="BlogUnsubscribe.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_SpecialPages_BlogUnsubscribe" ValidateRequest="false" %> 
<%@ Register Src="~/CMSWebParts/Blogs/BlogPostUnsubscription.ascx" TagName="BlogUnsubscription" TagPrefix="uc1" %> 

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server"> 
	<!-- Container --> 
	<div class="unsubscribe"> 
		<uc1:BlogUnsubscription runat="server" ID="BlogUnsubscription" UnsubscribedText="You have been successfully unsubscribed." EnableViewState="false" /> 
	</div> 
</asp:Content> 
