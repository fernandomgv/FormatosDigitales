<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master" AutoEventWireup="true" CodeFile="OrderCompleted.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_SpecialPages_OrderCompleted" ValidateRequest="false" %> 

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server"> 
	<!-- Container --> 
	<div class="textHeader"> 
		<!-- Header zone --> 
		<div class="zoneHeader"> 
			<h1>
				<cms:CMSEditableRegion runat="server" ID="HeaderText" RegionType="TextBox" /> 
			</h1> 
		</div> 
		<!-- Content --> 
		<div class="zoneContent"> 
			<cms:CMSEditableRegion runat="server" ID="ContentText" DialogWidth="960" DialogHeight="450" RegionType="HtmlEditor" /> 
		</div> 
		<div style="clear: both;">
		</div> 
	</div> 
</asp:Content> 
