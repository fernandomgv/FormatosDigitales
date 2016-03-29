<%@ Page Language="C#" AutoEventWireup="true"
  MasterPageFile="~/CMSMasterPages/UI/SimplePage.master" Title="Media library - New library"
  Inherits="CMSModules_Groups_Tools_MediaLibrary_Library_New" Theme="Default" CodeFile="Library_New.aspx.cs" %>

<%@ Register Src="~/CMSModules/MediaLibrary/Controls/UI/MediaLibraryEdit.ascx" TagName="LibraryEdit"
    TagPrefix="cms" %>
      
<asp:Content ID="cntBody" runat="server" ContentPlaceHolderID="plcContent">
    <cms:LibraryEdit ID="elemEdit" runat="server" />
</asp:Content>


