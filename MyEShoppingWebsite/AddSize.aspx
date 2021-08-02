<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddSize.aspx.cs" Inherits="AddSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class ="container">
        <h2>Add Size</h2>
        <hr />
        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label1" runat="server"  CssClass="col-xs-2 control-label" Text="Size Name"></asp:Label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtSize" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSize" runat="server" ErrorMessage="Enter Size" ControlToValidate="txtSize" CssClass="alert-danger"></asp:RequiredFieldValidator>
                       </div>
            </div>
       </div>

        <div class="row">
            <div class="center-page">
                <asp:label id="Label2" runat="server" cssclass="col-xs-2 control-label" text="Brand"></asp:label>
                <div class="col-xs-11">
                    <asp:dropdownlist id="ddlBrand" runat="server" CssClass="form-control"></asp:dropdownlist>
                    <asp:requiredfieldvalidator id="rfvBrand" runat="server" errormessage="Enter Brand" controltovalidate="ddlBrand" cssclass="alert-danger"></asp:requiredfieldvalidator>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="center-page">
                <asp:label id="Label3" runat="server" cssclass="col-xs-2 control-label" text="Category"></asp:label>
                <div class="col-xs-11">
                    <asp:dropdownlist id="ddlCategory" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:dropdownlist>
                    <asp:requiredfieldvalidator id="rfvCategory" runat="server" errormessage="Enter Category" controltovalidate="ddlCategory" cssclass="alert-danger"></asp:requiredfieldvalidator>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="center-page">
                <asp:Label ID="Label4" runat="server" CssClass="col-xs-2 control-label" Text="Sub Category"></asp:Label>
                <div class="col-xs-11">
                    <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvSubCategory" runat="server" ErrorMessage="Enter Sub Category" ControlToValidate="ddlSubCategory" CssClass="alert-danger"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
         
       <div class="row">
            <div class="center-page">
                <asp:Label ID="Label5" runat="server" CssClass="col-xs-2 control-label" Text="Gender"></asp:Label>
                <div class="col-xs-11">
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ErrorMessage="Enter Gender" ControlToValidate="ddlGender" CssClass="alert-danger"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>

                 <div class="col-xs-11 space-vert">
                <asp:Button ID="btnSize" runat="server" Class="btn btn-success" Text="Add Size" OnClick="btnSize_Click"/>
            </div>
            
             <br />
         <div class="span6">

            <h4> All Sizes</h4>
             <asp:Repeater ID ="rptrSize" runat="server">
                 <HeaderTemplate>
                     <table class="table table-hover">
              <thead>
                <tr>
                  <th>
                    #
                  </th>
                    <th>
                    Size
                  </th>
                  <th>
                    Brand
                  </th>
                  <th>
                  Category
                  </th>
                    <th>
                   Sub-Category
                  </th>
                    <th>
                  Gender
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
                    <%# Eval("SizeID") %>
                  </td>
                  <td>
                   <%# Eval("SizeName") %>
                  </td>
                  <td>
                   <%# Eval("Name") %>
                  </td>
                  <td>
                   <%# Eval("CatName") %>
                  </td>
                   <td>
                   <%# Eval("SubCatName") %>
                  </td>
                  <td>
                   <%# Eval("GenderName") %>
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

