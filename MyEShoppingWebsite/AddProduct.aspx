<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h2>Products Add</h2>
            <hr />
        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label1" runat="server"  CssClass="col-xs-2 control-label" Text="Product Name"></asp:Label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"></asp:TextBox>
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label2" runat="server"  CssClass="col-xs-2 control-label" Text="Price"></asp:Label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="TxtPrice" runat="server" CssClass="form-control"></asp:TextBox>
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label3" runat="server" CssClass="col-xs-2 control-label" Text="Selling Price"></asp:Label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtSellingPrice" runat="server" CssClass="form-control"></asp:TextBox>
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label4" runat="server" CssClass="col-xs-2 control-label" Text="Brand"></asp:Label>
                        <div class="col-xs-11">
                            <asp:DropDownList ID ="ddlBrand" CssClass="form-control" runat="server"></asp:DropDownList>
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label5" runat="server" CssClass="col-xs-2 control-label" Text="Category"></asp:Label>
                        <div class="col-xs-11">
                            <asp:DropDownList ID ="ddlCategory" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label6" runat="server" CssClass="col-xs-2 control-label" Text="Sub Category"></asp:Label>
                        <div class="col-xs-11">
                            <asp:DropDownList ID ="ddlSubCategory" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged"></asp:DropDownList>
                       </div>
            </div>
       </div>

         <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label19" runat="server" CssClass="col-xs-2 control-label" Text="Gender"></asp:Label>
                        <div class="col-xs-11">
                            <asp:DropDownList ID ="ddlGender" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlGender_SelectedIndexChanged"></asp:DropDownList>
                       </div>
            </div>
       </div>

       <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label7" runat="server" CssClass="col-xs-2 control-label" Text="Size"></asp:Label>
                        <div class="col-xs-11">
                            <asp:CheckBoxList ID ="cblSize" CssClass="col-xs-5 control-label" runat="server"></asp:CheckBoxList>
                       </div>
            </div>
       </div>
        <br />
         <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label20" runat="server"  CssClass="col-xs-2 control-label" Text="Product Quantity"></asp:Label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"></asp:TextBox>
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label8" runat="server" CssClass="col-xs-2 control-label" Text="Description"></asp:Label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtDescription"  TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label9" runat="server" CssClass="col-xs-2 control-label" Text="Product Details"></asp:Label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtProductDetails" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label10" runat="server" CssClass="col-xs-2 control-label" Text="Materials & Care"></asp:Label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtCare" runat="server"  TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label11" runat="server" CssClass="col-xs-2 control-label" Text="Upload Image"></asp:Label>
                        <div class="col-xs-11">
                            <asp:FileUpload ID ="fuImg01"  runat="server" />
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label12" runat="server" CssClass="col-xs-2 control-label" Text="Upload Image"></asp:Label>
                        <div class="col-xs-11">
                            <asp:FileUpload ID ="fuImg02"  runat="server" />
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label13" runat="server" CssClass="col-xs-2 control-label" Text="Upload Image"></asp:Label>
                        <div class="col-xs-11">
                            <asp:FileUpload ID ="fuImg03"  runat="server" />
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label14" runat="server" CssClass="col-xs-2 control-label" Text="Upload Image"></asp:Label>
                        <div class="col-xs-11">
                            <asp:FileUpload ID ="fuImg04"  runat="server" />
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label15" runat="server" CssClass="col-xs-2 control-label" Text="Upload Image"></asp:Label>
                        <div class="col-xs-11">
                            <asp:FileUpload ID ="fuImg05"  runat="server" />
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label16" runat="server" CssClass="col-xs-2 control-label" Text="Free Delivery"></asp:Label>
                        <div class="col-xs-11">
                            <asp:CheckBox ID ="ckbFreeDelivery" runat="server"/>
                            
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label17" runat="server" CssClass="col-xs-2 control-label" Text="30 days return"></asp:Label>
                        <div class="col-xs-11">
                            <asp:CheckBox ID ="ckbreturnPolicy" runat="server"/>
                            
                       </div>
            </div>
       </div>

        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label18" runat="server" CssClass="col-xs-2 control-label" Text="Cash On Delivery"></asp:Label>
                        <div class="col-xs-11">
                            <asp:CheckBox ID ="ckbCashOnD" runat="server"/>
                            
                       </div>
            </div>
       </div>

         <div class="col-xs-11 space-vert">
                <asp:Button ID="btnSave" runat="server" Class="btn btn-success" Text="Save" OnClick="btnSave_Click"/>
            </div>


    </div>
   
    <br />
    <hr />
</asp:Content>

