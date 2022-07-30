<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Admin.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="OnlineHealthCareServices.Admin.Appointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container alert-dark">
        
        <div class="row">
            <div class="col-md-10 col-sm-12">
                <h3>Appointment</h3>
            </div>
            </div>
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table class="table table-bordered">
                        <tr>
                            <th class="table-primary">Name</th>
                            <th class="table-secondary">Email</th>
                            <th class="table-success">Mobile</th>
                            <th class="table-danger">Gender</th>
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
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("EmailId") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("MobileNo") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblGender" runat="server" Text='<%# Eval("genderName") %>'></asp:Label>
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


</asp:Content>
