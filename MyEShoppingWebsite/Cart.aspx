<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <div style ="padding-top:50px;">
        <div class="col-md-8">
            <h4 class="proNameViewCart" runat="server" id="h4Noitems"></h4>
            <asp:Repeater ID="rptrCartProducts" runat="server">
                <ItemTemplate>
<%--          Cart details start--%>
            <div class=" media">
                <div class="media-left">
                    <a href="ProductInfo.aspx?PID=<%# Eval("PID") %>" target="_blank">
                        <img class="media-object"  style="width:100px;" src="img/ProductImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extension") %>" alt="<%# Eval("Name") %>" onerror="this.src='img/not-found.png '" />
                    </a>
                </div>
                <div class ="media-body" style="padding-left:20px;">
                    <h4 class="media-heading proNameViewCart" ><%# Eval("Name") %></h4>
                    <h5 class="proPriceDiscount"><%# Eval("SizeNamee") %></h5>
                    <span class="proPriceView"><%# Eval("PSelPrice" ,"{0:C}") %></span>
                    <span class="pro)gPriceView"><%# Eval("PPrice","{0:00,0}") %></span>
                    <p>
                        <br />
                        <asp:Button ID="btnRemoveCart" CssClass="btn btn-outline-success RemoveButton" runat="server" Text="Remove Item" OnClick="btnRemoveCart_Click" />
                    </p>
                </div>

            </div>  
                    </ItemTemplate>
                </asp:Repeater>
<%--            cart details end--%>
        </div>

        <div class="col-md-4">

            <div>
                <h5>Price Details</h5>
                <div>
                    <label>Cart Total</label>
                    <span class="pull-right-priceGray" runat="server" id ="spanCartTotal"></span>
                </div>

                <div>
                    <label>Cart Discount</label>
                    <span class="pull-right priceGreen" runat="server" id="spanDiscount">-200</span>
                </div>

            </div>
            <div>
                <div class="proPriceView">
                    <label>Cart Total</label>
                    <span class="pull-right" runat="server" id="spanTotal">-200</span>
                </div>

                <div>
                    <asp:Button ID="btnBuy" CssClass="buyNowbtn" runat="server" Text="Buy Now" OnClick="btnBuy_Click" />

                </div>

            </div>

        </div>


        </div>
       
    <br />
    <br />

</asp:Content>
