<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="FreshFruits.Users.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div runat="server" id="register" style="margin:auto; width:60%;">

      <h4>  <asp:Label ID="titlelabel" runat="server" Text="REGISTER BELOW"></asp:Label>  </h4>
             <br /><br />
             <asp:Label ID="Label1" runat="server" Text="User Name">
             </asp:Label><asp:TextBox ID="TextBox1" runat="server"  CssClass="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox1" CssClass="text-danger" ErrorMessage="Username is required." />
             <br /><br />

             <asp:Label ID="Label2" runat="server" Text="Email">
             </asp:Label><asp:TextBox ID="TextBox2" runat="server"  CssClass="form-control" TextMode="Email"></asp:TextBox>
             <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox1" CssClass="text-danger" ErrorMessage="Input a proper Email." />
            <asp:Label ID="emailInUse" runat="server" Text="" CssClass="text-danger"></asp:Label>
             <br /><br />

             <asp:Label ID="Label3" runat="server" Text="Password">
             </asp:Label><asp:TextBox ID="TextBox3" runat="server"  TextMode="Password" CssClass="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger" ControlToValidate="TextBox3" ErrorMessage="Password is Required"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" display="Dynamic" runat="server" ErrorMessage="Password must be 8-10 characters long with at least one numeric character." forecolor="Red" validationexpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" ControlToValidate="TextBox3" ></asp:RegularExpressionValidator>
             <br />
             <br />
             <asp:Button ID="Button1" cssClass="btn btn-primary btn-block" runat="server" Text="Register" OnClick="R_Click" />
      <br />   
    <asp:Label ID="Label4" runat="server" Text=" "></asp:Label>
        
    </div>
</asp:Content>
