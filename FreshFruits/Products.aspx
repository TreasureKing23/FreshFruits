<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="FreshFruits.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="text-center"><%: Title%>.</h2>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="FruitStoreDB" OnItemCommand="Repeater1_ItemCommand">
        <ItemTemplate>
                    <div class="panel panel-default col-md-4">
                        <div class="panel-heading" ><asp:Image ID="prodimage" runat="server" ImageUrl='<%#Eval("ProductImg") %>' Height="100%" Width="100%" />
                        </div> 
                        <div class="panel-body">
                            <i><asp:Label ID="prodID" runat="server" Visible="false" Text=<%#Eval("ProductID") %>></asp:Label></i> 
                            <h2><asp:Label ID="prodname" runat="server" Text=<%#Eval("ProductName") %>></asp:Label></h2>
                            <p><%#Eval("ProductDesc") %></p>
                            <h3>&#36 <asp:Label ID="prodprice" runat="server" Text=<%#Eval("ProductPrice") %>>$</asp:Label></h3>
                        </div>
                        <div class ="panel-footer"> 
                            <asp:TextBox ID="Quantity" runat="server" TextMode="Number" CausesValidation="True"></asp:TextBox>       
                            <asp:Button ID="Button2" CssClass="btn btn-outline-primary" runat="server"  Text="Add to cart"  OnClick="AddToCart" />
                        </div>
                    </div>
                </ItemTemplate>
    </asp:Repeater>
    
    <asp:SqlDataSource ID="FruitStoreDB" runat="server" ConnectionString="<%$ ConnectionStrings:estoredbConnectionString %>" ProviderName="<%$ ConnectionStrings:estoredbConnectionString.ProviderName %>" SelectCommand="select * from products">
    
    </asp:SqlDataSource>
</asp:Content>
