<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Admin.Master" AutoEventWireup="true" CodeBehind="patients.aspx.cs" Inherits="OnlineHealthCareServices.Admin.patients" %>
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
                            <th>Image</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Gender</th>
                            <th>Age</th>
                            <th>Mobile No</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>District</th>
                            <th>State</th>
                            <th>PinCode</th>
                            <th>Action</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Image ID="img" ImageUrl='<%# Eval("ProfileImg") %>' runat="server" />
                        </td>
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
                            <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("MobileNumber") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("EmailId") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("AddresssLine1") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDistrict" runat="server" Text='<%# Eval("distictName") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblState" runat="server" Text='<%# Eval("stateName") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblPinCode" runat="server" Text='<%# Eval("PinCode") %>'></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="lblAction" runat="server" Text="Label"></asp:Label>
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
