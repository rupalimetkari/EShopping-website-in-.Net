<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ViewProducts.aspx.cs" Inherits="ViewProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    <br />

    <h3>Welcome to view all Products</h3>
    <hr />
    <div class="container">
        <div class="row">
            <asp:Repeater ID="rptrProducts" runat="server">
                <ItemTemplate>
                    <div class="col-sm-3 col-md-4">
                        <a href="ProductInfo.aspx?PID=<%# Eval("PID") %>" style="text-decoration:none;">
                        <div class="thumbnail" style="align-content: center">
                            <img src="img/ProductImages/<%# Eval("PID")%>/<%# Eval("ImageName") %><%# Eval("Extension") %>" alt="<%# Eval("ImageName") %>"  style="width:205px;height:246px;"/><br />
                            &nbsp
                    <div class="caption">
                        <div class="probrand"><%# Eval("BrandName") %></div>
                        <div class="proName"><%# Eval("PName") %></div>
                        <div class="proPrice">
                            <span class="proOgPrice" style="text-decoration: line-through"><%# Eval("PPrice") %></span>
                            <br />
                            <%# Eval("PSelPrice") %>
                            <span class="proPriceDiscount"><%# Eval("DiscAmount") %></span>
                        </div>
                    </div>

                        </div>
                    </div>
                    </a>
                    </ItemTemplate>
           </asp:Repeater>

        </div>
    </div>
    <br />
</asp:Content>

