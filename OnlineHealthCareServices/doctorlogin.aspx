<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MyMaster.Master" AutoEventWireup="true" CodeBehind="doctorlogin.aspx.cs" Inherits="OnlineHealthCareServices.doctorlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                                <asp:Image ID="userImg" runat="server" Width="100px" CssClass="img-circle" src="img/generaluser.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3>&nbsp;Login</h3>
                        </center>
                     </div>
                  </div>
                   <asp:Label ID="lblLoginError" runat="server" Text=""></asp:Label>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>Mobile No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtMobile"  runat="server" placeholder="Member ID" MaxLength="10" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="Login" ControlToValidate="txtMobile" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Number" ForeColor="Red" ValidationExpression="[0-9]{10}" ValidationGroup="Login" ControlToValidate="txtMobile" SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </div>
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtPass" runat="server" placeholder="Password" TextMode="Password"  MaxLength="16"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Maximum 16 digit password" ControlToValidate="txtPass" ForeColor="Red" ValidationGroup="Login" SetFocusOnError="True"></asp:RequiredFieldValidator>
                           <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Incorrect Password" ControlToValidate="txtPass" ForeColor="Red" ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&amp;+=]).*$" ValidationGroup="Login"></asp:RegularExpressionValidator>
                       --%> </div>
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg"  ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" ValidationGroup="Login"  />
                        </div>
                         <br />
                         <%--<div class="form-group">
                             <center>
                                 <asp:Button ID="btnForgotPass" runat="server" Text="forgot Password" class="btn btn-success btn-block btn-lg" OnClick="btnForgotPass_Click"></asp:Button>
                             </center>
                         </div>--%>
                          <%--<div class="form-group">
                             <center>
                                 Not registered?<a href="userSignUp.aspx">Create an account</a>
                             </center>
                         </div>
                         <div class="form-group">
                             <div class="row">
                                 <div class="col-md-6 cols-sm-12">
                                      <a href="userSignUp.aspx" style="float:right;">Doctor Login</a>
                                 </div>
                                 <div class="col-md-6 cols-sm-12">
                                      <a href="userSignUp.aspx">Admin Login</a>
                                 </div>
                             </div>
                          --%>  
                            
                         </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
        </div>

</asp:Content>
