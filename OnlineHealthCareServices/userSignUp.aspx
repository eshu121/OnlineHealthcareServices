<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MyMaster.Master" AutoEventWireup="true" CodeBehind="userSignUp.aspx.cs" Inherits="OnlineHealthCareServices.userSignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="img/generaluser.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Sign Up</h4>
                        </center>
                     </div>
                  </div>
                   <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-12">
                        <label>User Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtUsername" runat="server" placeholder="User Name"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="SignUp" ControlToValidate="txtUsername" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                      <div class="col-md-12">
                        <label>Mobile No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtMobileNo" runat="server" placeholder="Mobile No" MaxLength="10"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="SignUp" ControlToValidate="txtMobileNo" SetFocusOnError="True"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Number" ForeColor="Red" ValidationExpression="[0-9]{10}" ValidationGroup="SignUp" ControlToValidate="txtMobileNo" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </div>
                     </div>
                      <div class="col-md-12">
                        <label>Email Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" placeholder="Email Address"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="SignUp" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Enter Correct Email Address" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ValidationGroup="SignUp" ForeColor="Red" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </div>
                     </div>
                      <div class="col-md-12">
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtPass" runat="server" placeholder="Password" TextMode="Password" MinLength="8" MaxLength="16"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Maximum 16 digit password" ControlToValidate="txtPass" ForeColor="Red" ValidationGroup="SignUp" SetFocusOnError="True"></asp:RequiredFieldValidator>
                           <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Incorrect Password" ControlToValidate="txtPass" ForeColor="Red" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&amp;+=]).*$" ValidationGroup="SignUp"></asp:RegularExpressionValidator>
                       --%> </div>
                     </div>
                      <div class="col-md-12">
                        <label>Confirm Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtConfirmPass" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtConfirmPass" ForeColor="Red" ValidationGroup="SignUp" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Incorrect Password" ControlToValidate="txtConfirmPass" ForeColor="Red" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&amp;+=]).*$" ValidationGroup="SignUp"></asp:RegularExpressionValidator>
                           --%> <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Incorrect Password" ControlToCompare="txtPass" ControlToValidate="txtConfirmPass" ForeColor="Red" ValidationGroup="SignUp" SetFocusOnError="True"></asp:CompareValidator>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" ValidationGroup="SignUp"  />
                        </div>
                         <div class="form-group">
                             <center>
                                 Already registered?<a href="userLogin.aspx">Login</a>
                             </center>
                         </div>
                     </div>
                  </div>
               </div>
            </div>
            
         </div>
      </div>
   </div>
</asp:Content>
