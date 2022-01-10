<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.Master" AutoEventWireup="true" CodeBehind="changed_Password.aspx.cs" Inherits="OnlineHealthCareServices.changed_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
             <div class="form-group">
                 <a href="Profile.aspx"><< Go Back Profile</a>
             </div>
            <div class="card">
               <div class="card-body">
                  
                  <div class="row">
                     <div class="col">
                        <center>
                           <h3>&nbsp;Changed Password</h3>
                        </center>
                     </div>
                  </div>
                   <asp:Label ID="lblPassError" runat="server" Text=""></asp:Label>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>Current Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtCurrentPass" runat="server" placeholder="Current Password" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtCurrentPass" ForeColor="Red" ValidationGroup="forgot" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          
                        </div>
                        <label>New Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtNewPass" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtNewPass" ForeColor="Red" ValidationGroup="forgot" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          
                        </div>
                          <label>Confirm Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="txtConfirmPass" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtConfirmPass" ForeColor="Red" ValidationGroup="forgot" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Incorrect Password" ControlToCompare="txtNewPass" ControlToValidate="txtConfirmPass" ForeColor="Red" ValidationGroup="forgot" SetFocusOnError="True"></asp:CompareValidator>
                        
                        </div>
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="btnForgot" runat="server" Text="Change Password"  ValidationGroup="forgot" OnClick="btnForgot_Click"   />
                        </div>
                          
                     </div>
                  </div>
               </div>
            </div>
             
         </div>
      </div>
   </div>
</asp:Content>
