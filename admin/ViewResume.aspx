<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ViewResume.aspx.cs" Inherits="jobportal.admin.ViewResume" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 720px;
        background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container-fluidS pt-4 pb-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>

            <h3 class="text-center">Job Applicants/View Resume</h3>
            
            <div class="row mb-3 pt-sm-3">
                <div class="col-md-12">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" 
                    EmptyDataText="No record to display..!" AutoGenerateColumns="False" 
                        AllowPaging="True" PageSize="5" HeaderStyle-HorizontalAlign="Center"
                     DataKeyNames="AppliedJobId" onpageindexchanging="GridView1_PageIndexChanging" 
                        onrowdeleting="GridView1_RowDeleting" 
                        onrowdatabound="GridView1_RowDataBound" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" >
                    <Columns>
                         
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="CompanyName" HeaderText="Company Name">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Title" HeaderText="Job Title">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Name" HeaderText="User Name">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Email" HeaderText="User Email">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Mobile" HeaderText="Mobile No.">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                         
                         <asp:TemplateField HeaderText="Resume">
                             <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container,"DataItem.Resume","../{0}") %>'>
                                 <i class="fas fa-download"></i>Download</asp:HyperLink>
                                 <asp:HiddenField ID="hdnJobId" runat="server" Value='<% #Eval("JobId") %>' Visible="false"/>
                             </ItemTemplate>
                             <ItemStyle HorizontalAlign="Center" />
                         </asp:TemplateField>

                      <%--   <asp:TemplateField HeaderText="Accept">
            <ItemTemplate>
                <asp:Button ID="btnAccept" runat="server" CommandName="Accept" CommandArgument='<%# Eval("AppliedJobId") %>' Text="Accept" CssClass="btn btn-success" OnClick="btnAccept_Click" />
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Reject">
            <ItemTemplate>
                <asp:Button ID="btnReject" runat="server" CommandName="Reject" CommandArgument='<%# Eval("AppliedJobId") %>' Text="Reject" CssClass="btn btn-danger" OnClick="btnReject_Click" />
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>--%>

        <asp:TemplateField HeaderText="Actions">
    <ItemTemplate>
        <div class="btn-group">
                    <asp:Button ID="btnAccept" runat="server" CommandName="Accept" CommandArgument='<%# Eval("AppliedJobId") %>' Text="Accept" CssClass="btn btn-success" OnClick="btnAccept_Click" Visible='<%# Eval("Status").ToString() == "Pending" %>' />
                    <asp:Button ID="btnReject" runat="server" CommandName="Reject" CommandArgument='<%# Eval("AppliedJobId") %>' Text="Reject" CssClass="btn btn-danger" OnClick="btnReject_Click" Visible='<%# Eval("Status").ToString() == "Pending" %>' />
                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' Visible='<%# Eval("Status").ToString() != "Pending" %>' />

                </div>

    </ItemTemplate>
    <ItemStyle HorizontalAlign="Center" />
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
