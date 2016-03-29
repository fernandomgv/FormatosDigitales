<%@ Page Language="C#" MasterPageFile="Root.master" AutoEventWireup="true" CodeFile="Wiki.aspx.cs" Inherits="CMSTemplates_CorporateSiteASPX_Wiki" ValidateRequest="false" %> 
<%@ Register Src="~/CMSWebParts/navigation/cmsbreadcrumbs.ascx" TagName="breadcrumbs" TagPrefix="uc1" %> 

<%@ Register Src="~/CMSWebParts/UserContributions/ContributionList.ascx" TagName="ContributionList" TagPrefix="uc1" %> 
<%@ Register Src="~/CMSWebParts/Viewers/Documents/cmsrepeater.ascx" TagName="repeater" TagPrefix="uc1" %> 
<%@ Register Src="~/CMSWebParts/usercontributions/editcontribution.ascx" TagName="editContribution" TagPrefix="uc1" %> 
<%@ Register Src="~/CMSWebParts/Text/staticHTML.ascx" TagName="staticHTML" TagPrefix="uc1" %>
<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server"> 
	<!-- Container --> 
	<div class="userContributions"> 
		<!-- List zone --> 
		<div class="zoneList"> 
			<cms:WebPartContainer ID="wpcbreadcrumbs" runat="server" ContainerName="Box.Gray"> 
				<uc1:breadcrumbs runat="server" ID="breadcrumbs" ClassNames="CMS.MenuItem;CMS.SimpleArticle" EnableViewState="false" /> 
			</cms:WebPartContainer> 
		    <cms:CMSEditableRegion runat="server" ID="editabletextHeader" RegionType="HtmlEditor" Height="50px" />
			<cms:CMSEditableRegion runat="server" ID="editabletextDescription" RegionType="HtmlEditor" />
			<uc1:ContributionList runat="server" ID="ContributionList" HideOnSubPages="True" Path="/wiki" AllowedChildClasses="CMS.SimpleArticle" DisplayList="False" AllowUsers="Authenticated" ShowForDocumentTypes="CMS.MenuItem" />
			<br />
			<div class="GeneralList">
			    <uc1:repeater runat="server" ID="ArticleRepeater" OrderBy="NodeOrder" ClassNames="CMS.SimpleArticle" TransformationName="CMS.SimpleArticle.simplepreview" SelectedItemTransformationName="CMS.SimpleArticle.Default" />
			</div>
			<uc1:editContribution runat="server" ID="EditContribution" ShowForDocumentTypes="CMS.SimpleArticle" AllowDelete="true" AllowUsers="DocumentOwner" ContentBefore="<div class='Contributions'>" ContentAfter="</div>" />
			<br />
			<asp:PlaceHolder ID="plcMyContributions" runat="server" Visible="false">
			    <div class="Contributions">
    			    <a href="~/Wiki/My-contributions.aspx">My contributions</a>
    			</div>
			</asp:PlaceHolder>
		</div> 
	</div> 
</asp:Content> 
