<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FreshFruits.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    
    <br /><br />
    <div class="col-md-8"><h2> <asp:Label ID="cartlabel" runat="server" Text="FRUIT BASKET"></asp:Label></h2></div>
   
        <div class="col-md-4 text-right">
        </div>

        <asp:GridView ID="GridView1" runat="server" class="table table-condensed table-hover table-striped" AutoGenerateColumns="False" DataSourceID="FruitStoreDB" BackColor="#ffff00" BorderColor="#000000" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="ProductID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="ProductID"  HeaderText="ProductID" SortExpression="ProductID" ReadOnly="True"  />
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                <asp:BoundField DataField="ProductPrice" HeaderText="ProductPrice" SortExpression="ProductPrice" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" SortExpression="SubTotal" />
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/trash.png" ShowDeleteButton="True">
                <ControlStyle CssClass="btn btn-danger" />
                </asp:CommandField>
            </Columns>
        
            <HeaderStyle BackColor="Green" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="Black" />
    </asp:GridView>
    <asp:SqlDataSource ID="FruitStoreDB" runat="server" ConnectionString="<%$ ConnectionStrings:estoredbConnectionString %>" ProviderName="<%$ ConnectionStrings:estoredbConnectionString.ProviderName %>" SelectCommand="select * from cart where Quantity!=0 and CustomerID=@cusID"  DeleteCommand="Update cart set Quantity = 0, SubTotal = 0 where ProductID = @ProductID">
        <SelectParameters>
            <asp:SessionParameter Name="@cusID" SessionField="cID"/>
        </SelectParameters>   
    </asp:SqlDataSource>

  
       <asp:DataList ID="DataList1" runat="server" DataSourceID="FruitStoreDB2" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
        <ItemTemplate>
            <div class="text-right">
                <h3>Total: $<asp:Label ID="grandlabel" runat="server" Text=<%#Eval("GrandTotal") %>>></asp:Label>.00</h3>
            </div>
        </ItemTemplate>
    </asp:DataList>
     <asp:SqlDataSource ID="FruitStoreDB2" runat="server" ConnectionString="<%$ ConnectionStrings:estoredbConnectionString %>" SelectCommand="SELECT SUM(SubTotal) AS GrandTotal FROM cart where Quantity!=0 and CustomerID=@CustomerID" ProviderName="<%$ ConnectionStrings:estoredbConnectionString.ProviderName %>">
         <SelectParameters>
            <asp:SessionParameter Name="@CustomerID" SessionField="cID"/>
        </SelectParameters>   
     </asp:SqlDataSource>
    


    <asp:Button ID="Button1" runat="server" Text="CheckOut" OnClick="Button1_Click" CssClass="bg-success" Font-Bold="True" />
    
    
</asp:Content>

