<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.Master" AutoEventWireup="true" CodeBehind="Book_Appointment.aspx.cs" Inherits="OnlineHealthCareServices.Book_Appointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

    <h1 class="text-center wow fadeInUp">Make an Appointment</h1>
    <hr />
    <div class="container">
         <asp:DataList ID="DataList1" RepeatColumns="3" runat="server">
        <ItemTemplate>
             <div class="container">
                    <div class="row">
                       
                        <div class="card-doctor border">
                        <div class="header">
                          <img src="../img/opdtype/<%# Eval("diseaseImg") %>" alt="" width="300px" height="200px">
                          <div class="meta">
                            <a href="#"><span class="mai-call"></span></a>
                            <a href="#"><span class="mai-logo-whatsapp"></span></a>
                          </div>
                        </div>
                        <div class="body">
                          <span class="text-sm text-grey"><%# Eval("diseaseName") %></span>
                        </div>
                      </div>
                      
                    </div>
                </div>
        </ItemTemplate>
    </asp:DataList>
    </div>
   




</asp:Content>
