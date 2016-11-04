﻿Imports System
Imports System.Threading.Tasks
Imports System.Security.Claims
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Microsoft.Owin.Security

' User クラスに複数のプロパティを追加することによって、ユーザーのプロファイル データを追加できます。詳細については、http://go.microsoft.com/fwlink/?LinkID=317594 を参照してください。
Public Class ApplicationUser
    Inherits IdentityUser

    Public Function GenerateUserIdentity(manager As ApplicationUserManager) As ClaimsIdentity
        ' authenticationType は、CookieAuthenticationOptions.AuthenticationType に定義されている種類と一致する必要があります
        Dim userIdentity = manager.CreateIdentity(Me, DefaultAuthenticationTypes.ApplicationCookie)
        ' カスタム ユーザー要求をここに追加します
        Return userIdentity
    End Function

    Public Function GenerateUserIdentityAsync(manager As ApplicationUserManager) As Task(Of ClaimsIdentity)
        Return Task.FromResult(GenerateUserIdentity(manager))
    End Function
End Class

Public Class ApplicationDbContext
    Inherits IdentityDbContext(Of ApplicationUser)
    Public Sub New()
        MyBase.New("DefaultConnection", throwIfV1Schema:=False)
    End Sub
    
    Public Shared Function Create As ApplicationDbContext
        Return New ApplicationDbContext()
    End Function    
End Class

#Region "Helpers"
Public Class IdentityHelper
    '外部ログインをリンクするときに XSRF 用に使用します
    Public Const XsrfKey As String = "xsrfKey"

    Public Const ProviderNameKey As String = "providerName"
    Public Shared Function GetProviderNameFromRequest(request As HttpRequest) As String
        Return request.QueryString(ProviderNameKey)
    End Function

    Public Const CodeKey As String = "code"
    Public Shared Function GetCodeFromRequest(request As HttpRequest) As String
        Return request.QueryString(CodeKey)
    End Function

    Public Const UserIdKey As String = "userId"
    Public Shared Function GetUserIdFromRequest(request As HttpRequest) As String
        Return HttpUtility.UrlDecode(request.QueryString(UserIdKey))
    End Function

    Public Shared Function GetResetPasswordRedirectUrl(code As String, request As HttpRequest) As String
        Dim absoluteUri = "/Account/ResetPassword?" + CodeKey + "=" + HttpUtility.UrlEncode(code)
        Return New Uri(request.Url, absoluteUri).AbsoluteUri.ToString()
    End Function

    Public Shared Function GetUserConfirmationRedirectUrl(code As String, userId As String, request As HttpRequest) As String
        Dim absoluteUri = "/Account/Confirm?" + CodeKey + "=" + HttpUtility.UrlEncode(code) + "&" + UserIdKey + "=" + HttpUtility.UrlEncode(userId)
        Return New Uri(request.Url, absoluteUri).AbsoluteUri.ToString()
    End Function

    Private Shared Function IsLocalUrl(url As String) As Boolean
        Return Not String.IsNullOrEmpty(url) AndAlso ((url(0) = "/"c AndAlso (url.Length = 1 OrElse (url(1) <> "/"c AndAlso url(1) <> "\"c))) OrElse (url.Length > 1 AndAlso url(0) = "~"c AndAlso url(1) = "/"c))
    End Function

    Public Shared Sub RedirectToReturnUrl(returnUrl As String, response As HttpResponse)
        If Not [String].IsNullOrEmpty(returnUrl) AndAlso IsLocalUrl(returnUrl) Then
            response.Redirect(returnUrl)
        Else
            response.Redirect("~/")
        End If
    End Sub
End Class
#End Region