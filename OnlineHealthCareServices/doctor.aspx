<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.Master" AutoEventWireup="true" CodeBehind="doctor.aspx.cs" Inherits="OnlineHealthCareServices.doctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="row">
            <div class="col-md-12 cols-sm-12">
                <div class="titlePage">Doctors</div>
            </div>
        </div><br /><br />
         <asp:DataList ID="DataList1" RepeatColumns="3" runat="server">
             <ItemTemplate>
                <div class="container table">
                    <%--<div class="row">
                        <div class="col-md-4 col-sm-12">
                            <img src="../Prescription/<%# Eval("Doctorimg") %>" width="250px" height="200px" />
                        </div>
                        <div class="col-md-8  col-sm-12">
                            <div class="row"><h2>
                                 <a href="#"><h2><%# Eval("doctorName") %></h2></a>
                            </div><div class="row"><h2>
                                   <h5><%# Eval("Degree") %> - <%# Eval("Department") %> </h5><br/>
                            </div><div class="row"><h2>
                                   <h5><%# Eval("Exprience") %>Years of Experience <br/></h5>
                            </div><div class="row"><h2>
                                    <h5>OPD Timing<br/>
                                   <%# Eval("OPDSchedule") %></h5>
                            </div>
                        </div>
                    </div>
                </div>--%>
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
    </div>
</asp:Content>
