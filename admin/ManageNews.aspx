<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageNews.aspx.cs" Inherits="jobportal.admin.ManageNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container">
 <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>

            </div>
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <h2 class="text-center">Add News</h2>
                 <div class="btn-toolbar justify-content-between mb-3">
                 <div class="btn-group">
                     <asp:Label ID="Label1" runat="server"></asp:Label>
                 </div>
                 <div class="input-group h-25">
                     <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/admin/NewsList.aspx" CssClass="btn btn-secondary"
                     Visible="true">< Back</asp:HyperLink>
                 </div>
            </div>
                <h3 class="text-center"><%Response.Write(Session["title"]); %></h3>
                <div class="form-group">
                    <label for="txtTitle">News Title:</label>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtDescription">News Description:</label>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="fileImage">News Image:</label>
                    <asp:FileUpload ID="fileImage" runat="server" CssClass="form-control" />
                </div>
                <div class="text-center">
                   <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" 
                    BackColor="#7200cf" Text="Save" onclick="btnAdd_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
