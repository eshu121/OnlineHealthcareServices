<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.Master" AutoEventWireup="true" CodeBehind="Lab_Test.aspx.cs" Inherits="OnlineHealthCareServices.user_testing" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="assets/js/jquery-3.5.1.min.js"></script>

    <script type="text/javascript">
        function checkDate(sender, args) {
            if (sender._selectedDate < new Date()) {
                alert("You cannot select a  day  than today!");
                sender._selectedDate = new Date();
                // set the date back to the current date
                sender._selectedDate.setDate(sender._selectedDate.getDate() + 1)
                sender._textbox.set_Value(sender._selectedDate.format(sender._format))
            }
        }
        </script>
    <style>
        .myRep{}
        .myRep table th, td{
            height:35px !important;
        }
    </style>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 cols-sm-12">
                <center><h2>Book Lab Test</h2></center>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-5 cols-sm-12">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="img/opdtype/blood.jpg" width="100%" height="500px" />
                        </div>
                        <%-- <div class="carousel-item">
                        <img src="img/opdtype/heart.jpg" width="100%" height="400px" />
                    </div>--%>
                        <div class="carousel-item">
                            <img src="img/opdtype/lipid.jpg" width="100%" height="500px" />
                        </div>
                        <div class="carousel-item">
                            <a href="Book_Appointment.aspx">
                                <img src="img/opdtype/liver.jpg" width="100%" height="500px" /></a>
                            <div class="carousel-caption d-none d-md-block">
                                <h4>Book Appointment</h4>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-md-7 col-sm-12">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row">
                        <div class="col-md-7 cols-sm-12">
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
                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="ddlGender"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-6 cols-sm-12">
                                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="Age"></asp:TextBox>
<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtAge"></asp:RequiredFieldValidator>--%>

                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-6 cols-sm-12">
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address "></asp:TextBox>
<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="col-md-6 cols-sm-6">
                                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" placeholder="Test Date"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Enabled="true" OnClientDateSelectionChanged="checkDate" Format="dd'/'MM'/'yyyy" TargetControlID="txtDate" PopupButtonID="sp" runat="server" />

                                </div>
                            </div>
                            <div class="form-row">

                                <div class="col-md-6 cols-sm-12">
                                    <asp:DropDownList ID="ddlSlot" class="form-control" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="ddlSlot"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-6 cols-sm-12">
                                    <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="ddlCity"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-6 cols-sm-12">
                                    <asp:DropDownList ID="ddlTest" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlTest_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="ddlTest"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-6 cols-sm-12">
                                    <asp:DropDownList ID="ddlSubTest" runat="server" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="ddlCity"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-row">

                                <div class="col-md-6 cols-sm-12">
                                    <asp:DropDownList ID="ddlSample" runat="server" CssClass="form-control" AutoPostBack="True"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="ddlSample"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-6 cols-sm-12">
                                    <asp:Button ID="btnAddTest" class="btn btn-success btn-block btn-lg" runat="server" Text="Add Test" OnClick="btnAddTest_Click" />

                                </div>
                            </div>

                        </div>

                        <div class="col-md-5 cols-sm-12">
                            <div class="container-fluid">
                            <div class="form-row">
                                <div class="col-md-12 cols-sm-12" >
                                    <center><h4>Test Details</h4></center>
                                </div>
                            </div>
                            <hr />
                            <div class="form-row" >
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <HeaderTemplate>
                                        <table class="myRep" cellspacing="0" rules="all" border="1">
                                            <tr>
                                                <th style="width: 20px">
                                                    S.No
                                                </th>
                                                <th  style="width: 250px">
                                                    Test Name
                                                </th>
                                                <th  style="width: 50px">
                                                    Price
                                                </th>
                                                <th style="width: 100px">Action</th>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("SNo") %>' />
                                                 <asp:HiddenField ID="hdnSubTestId" Value='<%# Eval("subTestId") %>' runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblTestName" runat="server" Text='<%# Eval("SubTestName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>' />
                                            </td>
                                            <td>
                                                <asp:LinkButton runat="server"  onClick="lnkDelete">Remove</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <tr style="color:blue; font-weight: bold; text-align:center;">
                                            <td colspan="2">Total</td>
                                            <td colspan="2"><asp:Label ID="lblTotal" runat="server" /></td>

                                        </tr>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                                
                            </div>
                            <div class="form-row">
                                <div class="col-md-12 cols-sm-12">
                                    <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg" runat="server" Text="Submit" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                            </div>
                            </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
