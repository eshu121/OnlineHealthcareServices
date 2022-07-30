<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MyMaster.Master" AutoEventWireup="true" CodeBehind="Link.aspx.cs" Inherits="OnlineHealthCareServices.Link" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h4>Links</h4>
        <div>
         <asp:DataList ID="DataList1"  runat="server">
                  <ItemTemplate>

                      <a href='<%# Eval("newsLink") %>' ><img src="img/new.jpg" width="30px" height="30px" /><%# Eval("newsName") %></a>

                  </ItemTemplate>
              </asp:DataList>
            </div>
    </div>
</asp:Content>
