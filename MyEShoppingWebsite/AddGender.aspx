<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddGender.aspx.cs" Inherits="AddGender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class ="container">
        <h2>Add Gender</h2>
        <hr />
        <div class ="row">
            <div class="center-page">
                <asp:Label ID="Label1" runat="server"  CssClass="col-xs-2 control-label" Text="Gender"></asp:Label>
                        <div class="col-xs-11">
                            <asp:TextBox ID="txtGender" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvGender" runat="server" ErrorMessage="Enter Gender" ControlToValidate="txtGender" CssClass="alert-danger"></asp:RequiredFieldValidator>
                       </div>
            </div>
       </div>
            

                 <div class="col-xs-11 space-vert">
                <asp:Button ID="btnAddBrand" runat="server" Class="btn btn-success" Text="Add Gender" OnClick="btnAddBrand_Click"/>
            </div>
            
           <br />
         <div class="span6">

            <h4> Gender</h4>
             <asp:Repeater ID ="rptrGender" runat="server">
                 <HeaderTemplate>
                     <table class="table table-hover">
              <thead>
                <tr>
                  <th>
                    #
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
                    <%# Eval("GenderID") %>
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

