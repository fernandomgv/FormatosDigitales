<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master" AutoEventWireup="true" CodeFile="Wishlist.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_SpecialPages_Wishlist" ValidateRequest="false" %> 
<%@ Register Src="~/CMSWebParts/Ecommerce/Wishlist.ascx" TagName="Wishlist" TagPrefix="uc1" %> 
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server"> 
	<!-- Container --> 
	<div class="wishList"> 
		<uc1:Wishlist runat="server" ID="Wishlist" TransformationName="ecommerce.transformations.Product_Wishlist" EnableViewState="false" /> 
	</div> 
</asp:Content> 
