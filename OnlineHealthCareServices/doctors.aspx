<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MyMaster.Master" AutoEventWireup="true" CodeBehind="doctors.aspx.cs" Inherits="OnlineHealthCareServices.doctors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .myrow {
        }
            .myrow row :nth-child(even) {
                background-color: red;
            }

            .myrow row :nth-child(odd) {
                background-color: #aaaaaa;
            }
    </style>
    <div class="container">
        <div class="row">
            <div class="col-md-12 cols-sm-12">
                <div class="titlePage">Doctors</div>
            </div>
        </div>
        <br />
        <br />
          <asp:DataList ID="DataList1" RepeatColumns="3" runat="server">
             <ItemTemplate>
                <div class="container table">
                  
                  <div class="card-doctor">
            <div class="header">
              <img src="../Prescription/<%# Eval("Doctorimg") %>" width="250px" height="200px" alt="">
              
            </div>
            <div class="body">
              <p class="text-xl mb-0"><%# Eval("doctorName") %></p>
              <span class="text-sm text-grey"><%# Eval("Degree") %> - <%# Eval("Department") %></span><br />
                <span class="text-sm text-grey"><%# Eval("Exprience") %>Years of Experience </span><br />
                <span class="text-sm text-grey">OPD Timing : <%# Eval("OPDSchedule") %></span>
            </div>
          </div>
                    </div>
            </ItemTemplate>
         </asp:DataList>
        <a href="doctor.aspx" style="float: right; background-color: blue; color: white; border-radius: 5px;">View More</a>
    </div>
</asp:Content>
