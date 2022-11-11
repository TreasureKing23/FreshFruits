<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FreshFruits.Home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2> <asp:Label ID="Name" runat="server" Text=" "></asp:Label></h2>
    <br /><br />
    <div class="carousel_slide" id="slider" data-ride="carousel" data-interval="2000" data-pause="false" data-wrap="true" >
        <div class="carousel-inner">
            <div class="item active">
                <img src="Images/home1.jpg"/>
                <div class="carousel-caption">
                    <h2 style="color:black; background-color:greenyellow; font-family: 'Lucida Console', monospace;">Welcome to Fresh Fruits</h2>
                </div>
            </div>
            <div class="item">
                <img src="Images/home2.jpg" />
                <div class="carousel-caption">
                    <h2 style="color:black; background-color:greenyellow; font-family:'Lucida Console', monospace;">Your #1 Store for All Fruits</h2>
                </div>
            </div>
            <div class="item">
                <img src="Images/home3.jpg" />
                <div class="carousel-caption">
                    <h2 style="color:black; background-color:greenyellow; font-family: 'Lucida Console', monospace;">Offering Local and Foreign Fruits for Everyone </h2>
                </div>
            </div>
        </div>
    </div>

    <div class="row text-center">
        <h2>Featured Items</h2> <br />
        <div class="panel panel-default col-md-4">
            <div class="panel-heading"><img src="../Images/Products/EastIndianMango.jpg" height="200"/></div>
            <div class="panel-footer"><a class="btn btn-primary" href="Products.aspx">Products</a></div>
        </div>
        <div class="panel panel-default col-md-4">
            <div class="panel-heading"><img src="../Images/Products/GreenApples.jpg" height="200"/></div>
            <div class="panel-footer"><a class="btn btn-primary" href="Products.aspx">Products </a></div>
        </div>
        <div class="panel panel-default col-md-4">
            <div class="panel-heading"><img src="../Images/Products/Papaya.jpg" height="200"/></div>
            <div class="panel-footer"><a class="btn btn-primary" href="Products.aspx">Products </a></div>
        </div>
    </div>

</asp:Content>
