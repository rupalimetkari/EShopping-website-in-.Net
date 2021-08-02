<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SubCategory.aspx.cs" Inherits="SubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="container">
        <h2>Add SubCategory</h2>
        <hr />

        <div class="row">
            <div class="center-page">
                <asp:label id="Label2" runat="server" cssclass="col-xs-2 control-label" text="Main CategoryID"></asp:label>
                <div class="col-xs-11">
                    <asp:dropdownlist id="ddlMainCatID" runat="server" CssClass="form-control"></asp:dropdownlist>
                    <asp:requiredfieldvalidator id="rfvMainCatID" runat="server" errormessage="Enter MainCatID" controltovalidate="ddlMainCatID" cssclass="alert-danger"></asp:requiredfieldvalidator>
                </div>
            </div>
        </div>
               

  
        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label1" runat="server"  CssClass="col-xs-2 control-label" Text="SubCategory Name"></asp:Label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtSubCategoryName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSubCategoryName" runat="server" ErrorMessage="Enter SubCategory Name" ControlToValidate="txtSubCategoryName" CssClass="alert-danger"></asp:RequiredFieldValidator>
                       </div>
            </div>
       </div>
            

        <div class="col-xs-11 space-vert">
            <asp:button id="btnAddSubCategory" runat="server" class="btn btn-success" text="Add SubCategory" OnClick="btnAddSubCategory_Click" />
        </div>
           
             <br />
         <div class="span6">

            <h4> All SubCategories</h4>
             <asp:Repeater ID ="rptrSubCategory" runat="server">
                 <HeaderTemplate>
                     <table class="table table-hover">
              <thead>
                <tr>
                  <th>
                    #
                  </th>
                  <th>
                    Sub-Category
                  </th>
                  <th>
                    Main Category
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
                    <%# Eval("SubCatID") %>
                  </td>
                  <td>
                   <%# Eval("SubCatName") %>
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

