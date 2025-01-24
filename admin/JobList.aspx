<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="JobList.aspx.cs" Inherits="jobportal.admin.JobList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 720px;
        background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container-fluidS pt-4 pb-4">
            <%--<div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>--%>

            <div class="btn-toolbar justify-content-between mb-3">
               <div class="btn-group">
                   <asp:Label ID="lblMsg" runat="server"></asp:Label>
               </div>
               
               <div class="input-group h-25">
                <asp:HyperLink ID="linkBack" runat="server" NavigateUrl="~/admin/ViewResume.aspx" CssClass="btn btn-secondary" 
                Visible="false"> < Back</asp:HyperLink>
            </div>
            </div>

            

            <h3 class="text-center">Job List/Details</h3>
            <div class="input-group justify-content-end h-25 pr-5 pl-5">
    <!-- Search Box -->
    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Placeholder="Search..." />
    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
</div>

            <div class="row mb-3 pt-sm-3 pr-3 pl-3">
                <div class="col-md-12">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" 
                    EmptyDataText="No record to display..!" AutoGenerateColumns="False" 
                        AllowPaging="True" PageSize="5" HeaderStyle-HorizontalAlign="Center"
                    OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="JobId" OnRowDeleting="GridView1_RowDeleting"
                    OnRowCommand="GridView1_RowCommand" onrowdatabound="GridView1_RowDataBound">
                    <Columns>
                         
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Title" HeaderText="Title">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="NoOfPost" HeaderText="No.Of Post">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Qualification" HeaderText="Qualification">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Experience" HeaderText="Experience">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="LastDateToApply" HeaderText="Valid Till" DataFormatString="{0:dd MMMM yyyy}">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="CompanyName" HeaderText="Company">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Country" HeaderText="Country">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="State" HeaderText="State">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="CreateDate" HeaderText="Posted Date" DataFormatString="{0:dd MMMM yyyy}">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                         
                         <asp:TemplateField HeaderText="Edit">
                             <ItemTemplate>
                                 <asp:LinkButton ID="btnEditJob" runat="server" CommandName="EditJob" CommandArgument='<%# Eval("JobId") %>'>
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
