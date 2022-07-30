<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Doctor.Master" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="OnlineHealthCareServices.Doctor.Patients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <h3 style="text-align:center;">All Patients</h3>
        </div><br />
        <div class="row">
             <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table class="table table-active table-bordered">
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Gender</th>
                            <th>Age</th>
                            <th>Mobile No</th>
                            <th>Email</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblGender" runat="server" Text='<%# Eval("genderName") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblAge" runat="server" Text='<%# Eval("Age") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("MobileNo") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("EmailId") %>'></asp:Label>
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
