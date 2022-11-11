<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvoicePage.aspx.cs" Inherits="FreshFruits.InvoicePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div >
        <br />
         <h1 style="text-align:center">INVOICE</h1>
         <asp:Repeater ID="Repeater1" runat="server" DataSourceID="FruitStoreDB3" >
            <ItemTemplate>
                <h3>Name: <asp:Label ID="CustomerName" runat="server" Text=<%#Eval("CustomerName") %>></asp:Label></h3>
                <h3>Total: $<asp:Label ID="GrandTotal" runat="server" Text=<%#Eval("GrandTotal") %>></asp:Label>.00</h3>
                <h3>Order ID: <asp:Label ID="OrderID" runat="server" Text=<%#Eval("InvoiceID") %>></asp:Label></h3>
                <h3>Date: <asp:Label ID="Date" runat="server" Text=<%#Eval("Date") %>></asp:Label></h3>
                <br /><br />
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="FruitStoreDB3" runat="server" ConnectionString="<%$ ConnectionStrings:estoredbConnectionString %>" ProviderName="<%$ ConnectionStrings:estoredbConnectionString.ProviderName %>" SelectCommand="Select * from invoice  where  CustomerID=@CustomerID Order By Date DESC">
            <SelectParameters>
             <asp:SessionParameter Name="@CustomerID" SessionField="cID"/>
        </SelectParameters> 
        </asp:SqlDataSource>
    </div>
</asp:Content>
