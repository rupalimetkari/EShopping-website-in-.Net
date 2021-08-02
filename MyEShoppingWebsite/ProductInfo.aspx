<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ProductInfo.aspx.cs" Inherits="ProductInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">

        <div class="row" style="padding-top: 50px">
            <div class="col-md-6">
                <div style="max-width: 480px" class="thumbnail">
                    <%--                    <--for Product slider-- %>--%>
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>

                        </ol>
                        <div class="carousel-inner">
                            <asp:Repeater ID="rptrImage" runat="server">
                                <ItemTemplate>
                                    <div class="carousel-item <%# GetActiveImgClass(Container.ItemIndex) %>">
                                        <img class="d-block w-100" src="img/ProductImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extension") %>" alt="<%# Eval("Name") %>" onerror="this.src='img/not-found.png '" />
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <%--                    <--for Product slider ending -- >--%>
                </div>
            </div>
            <div class="col-md-6">
                <asp:Repeater ID="repterProductInfo" runat="server" OnItemDataBound="repterProductInfo_ItemDataBound">
                    <ItemTemplate>


                        <div class="divDet1">
                            <h2 class="proNameView"><%# Eval("PName") %></h2>
                            <span class="proOgPrice"><%# Eval("PPrice") %></span><span class="proPriceDiscount"><%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSelPrice"))) %></span>
                            <p class="proPriceView"><%# Eval("PSelPrice") %></p>
                        </div>

                        <div>
                            <h5 class="">SIZE</h5>
                            <div>

                                <asp:RadioButtonList ID="rblSize" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="S" Text="S"></asp:ListItem>
                                    <asp:ListItem Value="M" Text="M"></asp:ListItem>
                                    <asp:ListItem Value="L" Text="L"></asp:ListItem>
                                    <asp:ListItem Value="XL" Text="XL"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="divDet1">
                            <asp:Button ID="btnAddtoCart" CssClass="mainButton" runat="server" Text="ADD TO CART" OnClick="btnAddtoCart_Click" />
                            <asp:Label ID="lblError" CssClass="text-danger" runat="server"></asp:Label>

                            <br />
                            <br />
                        </div>
                        <div class="divDet1">
                            <h5 class="h5size">Description</h5>
                            <p><%# Eval("PDescription") %></p>

                            <h5 class="h5size">Product Details</h5>
                            <p><%# Eval("PProductsDetails") %> </p>
                            <h5 class="h5size">Material & Care</h5>
                            <p><%# Eval("PMaterialCare") %></p>
                        </div>
                        <div>
                            <p><%# ((int)Eval("FreeDelivery")==1)? "Free Delivery": ""  %></p>
                            <p><%# ((int)Eval("30DAyRet")==1)? "30 Days Return": ""  %></p>

                            <p><%# ((int)Eval("COD")==1)? "Cash On Delivery": ""  %></p>
                        </div>

                        <asp:HiddenField ID="hfCatID" runat="server" Value='<%# Eval("PCategoryID") %>'></asp:HiddenField>
                        <asp:HiddenField ID="hfSubCatID" runat="server" Value='<%# Eval("PSubCatID") %>'></asp:HiddenField>
                        <asp:HiddenField ID="hfGenderID" runat="server" Value='<%# Eval("PGenderID") %>'></asp:HiddenField>
                        <asp:HiddenField ID="hfBrandID" runat="server" Value='<%# Eval("PBrandID") %>'></asp:HiddenField>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
        </div>
    <br />
    <br />
</asp:Content>

