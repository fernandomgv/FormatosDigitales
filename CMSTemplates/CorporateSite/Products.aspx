<%@ Page Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_Products" ValidateRequest="false" %> 
<%@ Register Src="~/CMSWebParts/Navigation/cmstreemenu.ascx" TagName="cmstreemenu" TagPrefix="uc1" %> 
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs" TagPrefix="uc1" %> 

<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsdatalist.ascx" TagName="cmsdatalist" TagPrefix="uc1" %> 
<%@ Register Src="~/CMSWebParts/Viewers/Documents/SendToFriend.ascx" TagName="SendToFriend" TagPrefix="uc1" %> 
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server">
	<!-- Container --> 
	<div class="productMulticolLeftMenu"> 
		<!-- Left zone --> 
		<div class="zoneLeft" style="float: left;"> 
			<div style="padding-bottom: 40px;">
				<uc1:cmstreemenu runat="server" ID="LeftTreeMenu" Path="/{0}/%" MaxRelativeLevel="2" CSSPrefix=";sub" DisplayHighlightedItemAsLink="False" HighlightAllItemsInPath="False" Indentation="1" EnableViewState="false" /> 
			</div> 
		</div> 
		<!-- Right zone --> 
		<div class="zoneContent" style="float: right;"> 
			<cms:WebPartContainer ID="wpcProductBreadcrumbs" runat="server" ContainerName="Box.Gray"> 
				<uc1:breadcrumbs runat="server" ID="ProductBreadcrumbs" EnableViewState="false" /> 
			</cms:WebPartContainer> 
			<asp:PlaceHolder ID="plcPrint" runat="server" Visible="false">
                <div class="PrintLink">
	                <br />
	                <asp:HyperLink ID="lnkPrint" runat="server" Target="_blank" ToolTip="Print" EnableViewState="false" >
		                <asp:Image ID="imgPrint" runat="server" CssClass="PrintImage" AlternateText="Print" /><asp:Label ID="lblPrint" runat="server" Text="Print" />	
		            </asp:HyperLink>                
                </div>			
            </asp:PlaceHolder>
			<cms:WebPartContainer ID="wpcProductDataList" runat="server" ContainerName="Padding.Content"> 
				<div class="ProductList">
				    <uc1:cmsdatalist runat="server" ID="ProductDataList" ClassNames="cms.cellphone;cms.laptop;cms.pda;cms.product" OrderBy="SKUPrice" TransformationName="ecommerce.transformations.product_preview" RepeatColumns="4" RepeatDirection="horizontal" RepeatLayout="table" EnablePaging="True" PagingMode="querystring" BackNextLocation="none" PagerPosition="bottom" ShowFirstLast="False" ResultsPosition="top" ShowNewButton="False" ShowEditDeleteButtons="True" DataListControl-DelayedLoading="true" EnableViewState="false" /> 
				</div>
			</cms:WebPartContainer> 
			<uc1:SendToFriend runat="server" ID="ucSendToFriend" Visible="false" EnableViewState="false" /> 
		</div> 
		<div style="clear: both;">
		</div> 
	</div> 
</asp:Content> 
