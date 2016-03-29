<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master" AutoEventWireup="true" CodeFile="Unsubscribe.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_SpecialPages_Unsubscribe" ValidateRequest="false" %> 
<%@ Register Src="~/CMSWebParts/Newsletters/NewsletterUnsubscriptionWebPart.ascx" TagName="NewsletterUnsubscription" TagPrefix="uc1" %> 
<%@ Register Src="~/CMSWebParts/Forums/ForumUnsubscription.ascx" TagName="ForumUnsubscription" TagPrefix="uc1" %> 
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server"> 
	<!-- Container --> 
	<div class="unsubscribe"> 
		<uc1:NewsletterUnsubscription runat="server" ID="NewsletterUnsubscription" UnsubscribedText="You've been unsubscribed." EnableViewState="false" /> 
		<br />
		<br /> 
		<uc1:ForumUnsubscription runat="server" ID="ForumUnsubscription" UnsubscriptionText="You've been unsubscribed." UnsuccessfulUnsubscriptionText="Unsubscribtion wasn't successful." EnableViewState="false" /> 
		<br />
		<br /> 
	</div> 
</asp:Content> 
