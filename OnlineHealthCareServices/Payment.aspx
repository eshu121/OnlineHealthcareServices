<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="OnlineHealthCareServices.Payment1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card">
                       <div class="card-body">
                           <h3 class="text-center">Dummy Payment Gateway</h3>
                            <hr>
<%--                           <h3 class="text-center">Card Payment</h3>
                            <hr>--%>
                                <div class="form-group">
                                    <div class="form-row" style="float:right;padding: 5px 15px 5px 15px; background-color:#5aba1d; color:#fff; border-radius:5px;">
                                         Amount : 
                                    <asp:Label ID="Label1" runat="server" ></asp:Label>
                                    </div>
                                   
                                <div class="form-row">
                                    <label>Card Number</label>
                                    <asp:TextBox ID="txtCardNo" class="form-control" autocomplete="off" maxlength="16" pattern="\d{16}" title="Credit card number" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtCardNo" ForeColor="Red" ValidationGroup="payment" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-row">
                                    <label class="col-md-8">Card Exp. Date</label><label class="col-md-4">CVV</label>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlMonth" class="form-control" runat="server">
                                            <asp:ListItem Value="01">01</asp:ListItem>
                                            <asp:ListItem Value="02">02</asp:ListItem>
                                            <asp:ListItem Value="03">03</asp:ListItem>
                                            <asp:ListItem Value="04">04</asp:ListItem>
                                            <asp:ListItem Value="05">05</asp:ListItem>
                                            <asp:ListItem Value="06">06</asp:ListItem>
                                            <asp:ListItem Value="07">07</asp:ListItem>
                                            <asp:ListItem Value="08">08</asp:ListItem>
                                            <asp:ListItem Value="09">09</asp:ListItem>
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                            <asp:ListItem Value="11">11</asp:ListItem>
                                            <asp:ListItem Value="12">12</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="ddlMonth" ForeColor="Red" ValidationGroup="payment" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlyear" class="form-control" runat="server">
                                            <asp:ListItem>2022</asp:ListItem>
                                            <asp:ListItem>2023</asp:ListItem>
                                            <asp:ListItem>2024</asp:ListItem>
                                            <asp:ListItem>2025</asp:ListItem>
                                            <asp:ListItem>2026</asp:ListItem>
                                            <asp:ListItem>2027</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlyear" ForeColor="Red" ValidationGroup="payment"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-4">
                                    
                                        <asp:TextBox ID="txtCvv" class="form-control" autocomplete="off" maxlength="3" pattern="\d{3}" title="Three digits at back of your card" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtCvv" ForeColor="Red" ValidationGroup="payment" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                    <div class="form-row">
                                    <label for="cc_name">Card Holder's Name</label>
                                    <asp:TextBox ID="txtHolderName"  class="form-control"  pattern="\w+ \w+.*" title="First and last name" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtHolderName" ForeColor="Red"  ValidationGroup="payment" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                                
                                <hr>
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <asp:Button ID="btnCancel" class="btn btn-default btn-lg btn-block" runat="server" Text="Cancel" OnClick="btnCancel_Click"  />
                                    </div>
                                    <div class="col-md-6">
                                         <asp:Button ID="btnSubmit" class="btn btn-success btn-lg btn-block" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="payment"  />
                                    </div>
                                </div>
                             </div>

                       </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
