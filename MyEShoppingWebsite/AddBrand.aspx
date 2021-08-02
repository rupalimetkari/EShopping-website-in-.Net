<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddBrand.aspx.cs" Inherits="AddBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class ="container">
        <h2>Add Brand</h2>
        <hr />
        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label1" runat="server"  CssClass="col-xs-2 control-label" Text="Brand Name"></asp:Label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtBrandName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvBrandName" runat="server" ErrorMessage="Enter Brand Name" ControlToValidate="txtBrandName" CssClass="alert-danger"></asp:RequiredFieldValidator>
                       </div>
            </div>
       </div>
            

                 <div class="col-xs-11 space-vert">
                <asp:Button ID="btnAddBrand" runat="server" Class="btn btn-success" Text="Add Brand" OnClick="btnAddBrand_Click1"/>
            </div>
            
           <br />
         <div class="span6">

            <h4> All Brands</h4>
             <asp:Repeater ID ="rptrBrands" runat="server">
                 <HeaderTemplate>
                     <table class="table table-hover">
              <thead>
                <tr>
                  <th>
                    #
                  </th>
                  <th>
                    Brand Name
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
                    <%# Eval("BrandID") %>
                  </td>
                  <td>
                   <%# Eval("Name") %>
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

