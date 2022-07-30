<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="OnlineHealthCareServices.Appointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
                                    <div class="col-md-12 cols-sm-12">
                            <div class="form-row">
                                <div class="col-md-6 cols-sm-12">
                                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name "></asp:TextBox>
<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtFirstName" runat="server" SetFocusOnError="true" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="col-md-6 cols-sm-12">
                                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name "></asp:TextBox>

<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtLastName" runat="server" ErrorMessage="*" SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-6 cols-sm-12">
                                    <asp:TextBox ID="txtEmailId" runat="server" CssClass="form-control" placeholder="Email Id " TextMode="Email"></asp:TextBox>
<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtEmailId" runat="server" SetFocusOnError="true" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="col-md-6 cols-sm-12">
                                    <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control" placeholder="Mobile No " TextMode="Number"></asp:TextBox>
<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtMobileNo"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-6 cols-sm-12">
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address "></asp:TextBox>
<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>--%>
                                </div>
                                 <div class="col-md-6 cols-sm-12">
                                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="Age"></asp:TextBox>
<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtAge"></asp:RequiredFieldValidator>--%>

                                </div>
                               
                            </div>
                            <div class="form-row">
                                <div class="col-md-6 cols-sm-12">
                                   <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="ddlGender"></asp:RequiredFieldValidator>
                                </div>
                                 <div class="col-md-6 cols-sm-6">
                                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" placeholder="Test Date"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Enabled="true" OnClientDateSelectionChanged="checkDate" Format="dd'/'MM'/'yyyy" TargetControlID="txtDate" PopupButtonID="sp" runat="server" />

                                </div>
                                <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                               
                            </div>
                           
                            <div class="form-row">

                                <div class="col-md-6 cols-sm-12">
                                    <asp:DropDownList ID="ddldisease" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddldisease_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="ddldisease"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-6 cols-sm-12">
                                    <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="form-control" ></asp:DropDownList>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="ddlDoctor"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                           
                            <div class="form-row">
                                <div class="col-md-6 cols-sm-12">
                                    <asp:DropDownList ID="ddlSlot" class="form-control" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="ddlSlot"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-6 cols-sm-12">
                                    <asp:DropDownList ID="ddlAddType" runat="server" CssClass="form-control" ></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="ddlAddType"></asp:RequiredFieldValidator>
                                </div>
                               
                            </div>
                            <div class="form-row">
                                <div class="col-md-6 cos-sm-12">
                                     <div class="col-md-6 cols-sm-12">
                                    <asp:Button ID="btnAddTest" class="btn btn-success btn-block btn-lg" runat="server" Text="Appointment" OnClick="btnAddTest_Click"  />

                                </div>
                                </div>

                            </div>

                        </div>


        </div>
    </div>
</asp:Content>
