<%@ Page Language="C#" MasterPageFile="~/CMSTemplates/CorporateSiteASPX/Root.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_SpecialPages_ShoppingCart" ValidateRequest="false" %> 
<%@ Register Src="~/CMSWebParts/Ecommerce/ShoppingCart/ShoppingCartWebPart.ascx" TagName="ShoppingCart" TagPrefix="uc1" %> 
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server"> 
	<!-- Container --> 
	<div class="shoppingCart"> 
		<uc1:ShoppingCart runat="server" ID="ShoppingCart" RedirectAfterPurchase="/SpecialPages/OrderCompleted" DisplayStepImages="True" ImageStepSeparator="&lt;img class=&quot;ShoppingCartStepSeparator&quot; src=&quot;../App_Themes/CorporateSite/Images/ShoppingCart/Separator.gif&quot; alt=&quot;Separator&quot; /&gt;" EnableProductPriceDetail="True" RequiredFieldsMark="&lt;span style=&quot;color:#eb6d24; vertical-align:top;font-weight:bold; padding-left:1px&quot;&gt;*&lt;/span&gt;" /> 
	</div> 
</asp:Content> 
