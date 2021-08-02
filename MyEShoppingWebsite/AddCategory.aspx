<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="container">
        <h2>Add Category</h2>
        <hr />
        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label1" runat="server"  CssClass="col-xs-2 control-label" Text="Category Name"></asp:Label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCategoryName" runat="server" ErrorMessage="Enter Category Name" ControlToValidate="txtCategoryName" CssClass="alert-danger"></asp:RequiredFieldValidator>
                       </div>
            </div>
       </div>
            

                 <div class="col-xs-11 space-vert">
                <asp:Button ID="btnAddCategory" runat="server" Class="btn btn-success" Text="Add Category" OnClick="btnAddCategory_Click"/>
            </div>
           
             

   
     <br />
         <div class="span6">

            <h4> All Categories</h4>
             <asp:Repeater ID ="rptrCategory" runat="server">
                 <HeaderTemplate>
                     <table class="table table-hover">
              <thead>
                <tr>
                  <th>
                    #
                  </th>
                  <th>
                    Category Name
                  </th>
                  <th>
                    Edit
                  </th>
                 
                </tr>
              </thead>
              <tbody>
                 </HeaderTemplate>

                 <ItemTemplate>

                     <tr>
                  <td>
                    <%# Eval("CatID") %>
                  </td>
                  <td>
                   <%# Eval("CatName") %>
                  </td>
                  
                  <td>
                    Edit
                  </td>
                </tr>
                 </ItemTemplate>

                 <FooterTemplate>
                     </tbody>
            </table>

                 </FooterTemplate>

             </asp:Repeater>
          </div>

    </div>
    <br />

</asp:Content>

