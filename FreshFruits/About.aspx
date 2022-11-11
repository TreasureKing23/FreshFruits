<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FreshFruits.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="about" style="text-align: center; border-style: solid;"><%: Title %>.</h2>
    <br />
    <div class="about">
        <h3 style="border-style: solid none none none">WHAT WE DO</h3>
    <p class="do">We provide a variety of local and International Fruits.</p>
        <br />
    <h3 style="border-style: solid none none none">OUR VISION</h3>
    <p class="vision">Our aim is provide customers with the freshest and healthiest fruits around</p>
        <br />
        <h3 style="border-style: solid none none none">OUR HISTORY</h3>
    <p class="history">From a small corner shop to now a multi million dollar organization we fought for over 20 years to get here.
    </p>
    </div>
</asp:Content>
