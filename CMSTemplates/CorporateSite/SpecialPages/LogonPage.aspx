<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master" AutoEventWireup="true" CodeFile="LogonPage.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_SpecialPages_LogonPage" ValidateRequest="false" %> 
<%@ Register Src="~/CMSWebParts/Membership/Logon/logonform.ascx" TagName="logonform" TagPrefix="uc1" %> 

<%@ Register Src="~/CMSWebParts/Membership/Registration/registrationform.ascx" TagName="registrationform" TagPrefix="uc1" %> 
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server"> 
	<!-- Container --> 
	<div class="logonReg"> 
		<!-- Top zone --> 
		<div class="topZone"> 
		</div> 
		<!-- Left zone --> 
		<div class="zoneLeft" style="width: 50%; float: left;"> 
			<div style="width: 300px; margin: 10px auto;"> 
				<cms:WebPartContainer ID="wpcLogonForm" runat="server" ContainerName="OrangeBox" ContainerTitle="Log on"> 
					<div style="min-height: 160px;height:auto">
						<uc1:logonform runat="server" ID="LogonForm" EnableViewState="false" /> 
					</div> 
				</cms:WebPartContainer> 
			</div> 
		</div> 
		<!-- Right zone --> 
		<div class="zoneRight" style="width: 50%; float: right;"> 
			<div style="width: 300px; margin: 10px auto;"> 
				<cms:WebPartContainer ID="wpcRegistrationForm" runat="server" ContainerName="OrangeBox" ContainerTitle="Not a member yet? Sign up now!"> 
					<uc1:registrationform runat="server" ID="RegistrationForm" EnableViewState="false" /> 
				</cms:WebPartContainer> 
			</div> 
		</div> 
	</div> 
</asp:Content> 
