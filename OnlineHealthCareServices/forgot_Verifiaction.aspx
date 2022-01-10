<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MyMaster.Master" AutoEventWireup="true" CodeBehind="forgot_Verifiaction.aspx.cs" Inherits="OnlineHealthCareServices.forgot_Verifiaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="divLogin">
        <div class="container">
           
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-12 cols-sm-12" style="background-color:green; color:#fff; font-size:18px;">
                        <center>
                            <h2>Verification</h2>
                        </center>
                    </div>
                </div>
            </div>
            
                 <div class="form-group">
                        <div class="form-row">
                             <div class="col-md-12 cols-sm-12">
                                <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>   
                            </div>
                        </div>
                    </div>
            <div class="form-group">
                
            
                <div class="form-group">
                    <br />
                <div class="form-row">
                    <div class="col-md-2 cols-sm-12">
                        <h3>Enter OTP</h3>
                    </div>
                    <div class="col-md-4 cols-sm-12">
                        <asp:TextBox ID="txtOTP" runat="server"></asp:TextBox>
                    </div>
                            
                    
                </div>
                    
            </div>
               

            <div class="form-group">
                <div class="form-row">
                   
                     <div class="col-md-6 cols-sm-12">
                        <asp:Button ID="btnVerify" runat="server" Text="Verify"  CssClass="form-control" OnClick="btnVerify_Click"    />
                         
                    </div>
                    <div class="col-md-6 cols-sm-12">
                        <asp:Button ID="btnResend" runat="server" Text="Resend OTP"  CssClass="form-control" OnClick="btnResend_Click"    />
                         
                    </div>
                </div>
            </div>
                <div class="form-group">
                        <div class="form-row">
                             <div class="col-md-12 cols-sm-12">
                                <asp:Label ID="lblVerify" runat="server" Text="Label"></asp:Label>   
                            </div>
                        </div>
                    </div>
                
        </div>
    </div>
</asp:Content>
