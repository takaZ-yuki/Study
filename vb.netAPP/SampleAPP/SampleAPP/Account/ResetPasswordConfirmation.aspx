﻿<%@ Page Title="パスワードが変更されました" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPasswordConfirmation.aspx.vb" Inherits="SampleAPP.ResetPasswordConfirmation" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <div>
        <p>パスワードが変更されました。ログインするには <asp:HyperLink ID="login" runat="server" NavigateUrl="~/Account/Login">こちら</asp:HyperLink> をクリックしてください </p>
    </div>
</asp:Content>
