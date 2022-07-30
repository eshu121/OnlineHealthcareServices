<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Doctor.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="OnlineHealthCareServices.Doctor.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row">
            
             <div class="col-md-3 cols-sm-12">
                <div class="card" style="width: 17rem; height:10rem;">
                <div class="card-body" style="border:2px solid red; border-radius:5px;">
                <img src="../img/Icons/12.jpg" style="width: 5rem;" />
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    <span>Appointment</span>
                </div>

              </div>
            </div>
            
             <div class="col-md-3 cols-sm-12">
                <div class="card" style="width: 17rem; height:10rem;">
                <div class="card-body" style="border:2px solid red; border-radius:5px;">
                <img src="../img/Icons/14.png" style="width: 5rem;" />
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    <span>Patients</span>
                </div>

              </div>
            </div>
            
            </div>
        <br /><br />
        <div class="row">
            <div class="col-md-6 cols-sm-12">
            <h3>Appointment</h3>
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table class="table table-bordered">
                        <tr>
                            <th class="table-primary">Name</th>
                            <th class="table-warning">Date</th>
                            <th class="table-info">Time</th>
                            <th class="table-info">Doctor</th>
                            <th class="table-info">Injury</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr">
                        
                        <td>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            <asp:HiddenField ID="hdnDoctorId" Value='<%# Eval("appointmentid") %>' runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("AppointmentDate") %>'></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="lblTime" runat="server" Text='<%# Eval("slotName") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDoctor" runat="server" Text='<%# Eval("doctorName") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblInjury" runat="server" Text='<%# Eval("departmentName") %>'></asp:Label>
                        </td>
                        
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            </div>
            </div>
    
        </div>

</asp:Content>
