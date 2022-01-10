<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MyMaster.Master" AutoEventWireup="true" CodeBehind="doctors.aspx.cs" Inherits="OnlineHealthCareServices.doctors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12 cols-sm-12">
                <div class="titlePage">Doctors</div>
            </div>
        </div><br /><br />
         <asp:Repeater ID="Repeater1"  runat="server">
            <ItemTemplate>
                <div class="container a1 table">
                    <div class="row">
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
                </div>
            </ItemTemplate>
        </asp:Repeater>
            <a href="doctor.aspx" style="float:right; background-color:blue;color:white;border-radius:5px;" >View More</a>
    </div>
</asp:Content>
