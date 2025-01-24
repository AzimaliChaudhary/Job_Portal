<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="NewsList.aspx.cs" Inherits="jobportal.admin.NewsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 720px;
        background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container-fluidS pt-4 pb-4">
        <div class="btn-toolbar justify-content-between mb-3">
               <div class="btn-group">
                   <asp:Label ID="lblMsg" runat="server"></asp:Label>
               </div>
               <div class="input-group h-25">
                <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/admin/ViewResume.aspx" CssClass="btn btn-secondary" 
                Visible="false"> < Back</asp:HyperLink>
            </div>
            </div>
         <h3 class="text-center">News List</h3>
          <div class="row mr-lg-5 ml-lg-5 mb-3 pt-4">
            <div class="col-md-3 col-md-offset-2 mb-3">
             <asp:Button ID="btnManageNews" runat="server" Text="Add News" CssClass="btn btn-primary btn-block"  BackColor="#7200cf" PostBackUrl="~/admin/ManageNews.aspx" />
             </div>
             </div>
            <div class="row mb-3 pt-sm-3">
                <div class="col-md-12">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" 
                    EmptyDataText="No record to display..!" AutoGenerateColumns="False" 
                        AllowPaging="True" PageSize="5" HeaderStyle-HorizontalAlign="Center"
                    OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="NewsId" OnRowDeleting="GridView1_RowDeleting"
                    OnRowCommand="GridView1_RowCommand" onrowdatabound="GridView1_RowDataBound">
                    <Columns>
                         
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Title" HeaderText="Title">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Description" HeaderText="Description">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                       
                         <asp:TemplateField HeaderText="Edit">
                             <ItemTemplate>
                                 <asp:LinkButton ID="btnEditJob" runat="server" CommandName="EditJob" CommandArgument='<%# Eval("NewsId") %>'>
                                     <asp:Image ID="Img" runat="server" ImageUrl="../assets/img/icon/edit-3-256.png" Height="25px" />
                                 </asp:LinkButton>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" Width="50px"/>
                         </asp:TemplateField>

                         <asp:CommandField CausesValidation="false" HeaderText="Delete" ShowDeleteButton="true" 
                            DeleteImageUrl="../assets/img/icon/delete-512.png" ButtonType="Image">
                            <ControlStyle Height="25px" Width="25px" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>

                    </Columns>
                    <HeaderStyle BackColor="#7200cf" ForeColor="White" />
                    </asp:GridView>
                
                </div>
            </div>

        </div>
        </div>
</asp:Content>
