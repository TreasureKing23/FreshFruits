<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FreshFruits.Users.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <div runat="server" id="logindiv" style="margin:auto; width:60%;">

      <h4>  <asp:Label ID="titlelabel" runat="server" Text="LOGIN BELOW"></asp:Label>  </h4>
             <br /><br />
             <asp:Label ID="Label1" runat="server" Text="Email Address">
             </asp:Label><asp:TextBox ID="TextBox1" runat="server"  CssClass="form-control" TextMode="Email"></asp:TextBox>
             <asp:RequiredFieldValidator runat="server" ControlToValidate="TextBox1" CssClass="text-danger" ErrorMessage="Email is required." />
             <br /><br />

             <asp:Label ID="Label2" runat="server" Text="Password">
             </asp:Label><asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" TextMode="Password" CssClass="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger" ControlToValidate="TextBox2" ErrorMessage="Password is Required"></asp:RequiredFieldValidator>
             <br />
             <br />
             <asp:Button ID="Button1" cssClass="btn btn-primary btn-block" runat="server" Text="Login" OnClick="L_Click" />
             <br />
             <h5><a  href="Registration.aspx">New Customer? Click Here To Register</a></h5>
      <br />   
    <asp:Label ID="Label3" runat="server" Text=" "></asp:Label>
        
    </div>
    
</asp:Content>
