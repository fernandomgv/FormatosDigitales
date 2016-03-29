<%@ Page Title="" Language="C#" MasterPageFile="MFSAndina.master" AutoEventWireup="true" CodeFile="CapacitacionMecanismo.aspx.cs" 
    Inherits="CMSTemplates_CorporateSiteAspx_CapacitacionMecanismo" %>
<%@ Register TagPrefix="uc1" TagName="editabletext" Src="~/CMSWebParts/Text/editabletext.ascx" %>

<asp:Content ID="cntMain" ContentPlaceHolderID="plcMain" Runat="Server">
<cms:CMSEditableRegion runat="server" ID="cmsEditableRegion" RegionTitle="Agregar Contentido" ShowForDocumentTypes="CMS.MenuItem" RegionType="HtmlEditor" DialogHeight="500" />
</asp:Content>