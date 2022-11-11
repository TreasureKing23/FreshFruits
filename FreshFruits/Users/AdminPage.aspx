<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="FreshFruits.Users.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    
    <br /><br />
    <div class="col-md-8"><h2> <asp:Label ID="Customers" runat="server" Text="CUSTOMERS"></asp:Label></h2></div>
   
        <div class="col-md-4 text-right">
        </div>

        <asp:GridView ID="GridView1" runat="server" class="table table-condensed table-hover table-striped" AutoGenerateColumns="False" DataSourceID="AdminCusFruitStoreDB" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="CustomerID" GridLines="Horizontal" OnRowEditing="GridView1_RowEditing">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField  DataField="CustomerID"  HeaderText="CustomerID" SortExpression="CustomerID" ReadOnly="True" InsertVisible="False"  />
                <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                <asp:CommandField DeleteImageUrl="~/Images/trash.png" ShowDeleteButton="True" ButtonType="Image">
                <ControlStyle CssClass="btn btn-danger" />
                </asp:CommandField>
            </Columns>
        
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle ForeColor="#4A3C8C" BackColor="#E7E7FF" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <asp:SqlDataSource ID="AdminCusFruitStoreDB" runat="server" ConnectionString="<%$ ConnectionStrings:estoredbConnectionString %>" ProviderName="<%$ ConnectionStrings:estoredbConnectionString.ProviderName %>" SelectCommand="Select * from customer where Role!='A'" DeleteCommand="Delete from customer where CustomerID = @CustomerID" UpdateCommand="update customers set CustomerID = @CustomerID, CustomerName = @CustomerName, Email=@Email,Role=@Role Where CustomerID=@CustomerId"></asp:SqlDataSource>

    <br /><br />
    <div class="col-md-8"><h2> <asp:Label ID="Products" runat="server" Text="PRODUCTS"></asp:Label></h2></div>
   
        <div class="col-md-4 text-right">
        </div>

        <asp:GridView ID="GridView2" runat="server" class="table table-condensed table-hover table-striped" AutoGenerateColumns="False" DataSourceID="AdminProFruitStoreDB" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="ProductID" ForeColor="Black" GridLines="None">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="ProductID"  HeaderText="ProductID" SortExpression="ProductID" ReadOnly="True"  />
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                <asp:BoundField DataField="ProductDesc" HeaderText="ProductDesc" SortExpression="ProductDesc" />
                <asp:BoundField DataField="ProductPrice" HeaderText="ProductPrice" SortExpression="ProductPrice" />
                <asp:BoundField DataField="ProductImg" HeaderText="ProductImg" SortExpression="ProductImg" />
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/trash.png" ShowDeleteButton="True">
                <ControlStyle CssClass="btn btn-danger" />
                </asp:CommandField>
            </Columns>
        
            <FooterStyle BackColor="Tan" />
        
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
    <asp:SqlDataSource ID="AdminProFruitStoreDB" runat="server" ConnectionString="<%$ ConnectionStrings:estoredbConnectionString %>" DeleteCommand="delete from products where ProductID = @ProductID" ProviderName="<%$ ConnectionStrings:estoredbConnectionString.ProviderName %>" SelectCommand="select * from products"></asp:SqlDataSource>
</asp:Content>
