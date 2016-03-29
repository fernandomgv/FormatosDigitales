<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master" AutoEventWireup="true" CodeFile="BoardUnsubscribe.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_SpecialPages_BoardUnsubscribe" ValidateRequest="false" %> 
<%@ Register Src="~/CMSWebParts/MessageBoards/MessageBoardUnsubscription.ascx" TagName="BoardUnsubscription" TagPrefix="uc1" %> 

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server"> 
	<!-- Container --> 
	<div class="unsubscribe"> 
		<uc1:BoardUnsubscription runat="server" ID="BoardUnsubscription" UnsubscribedText="You've been unsubscribed." EnableViewState="false" /> 
	</div> 
</asp:Content> 
