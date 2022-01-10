<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="OnlineHealthCareServices.order_status" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
       .fix{
           background-image:linear-gradient(rgba(0,0,0,0.5),rgba(0,0,0,0.5)), url(img/card.png);
	 height: 100%;
     width:100%;
	 background-size: cover;
	 background-position: center;
       }
    </style>
    <div class="container">
        <div class="row">
               <div class="col-md-12 cols-sm-12">
                    <center><h2>Your Order</h2></center>
               </div>
        </div>
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="14pt" ForeColor="Green"></asp:Label>

        <hr />
       <div class="row">
           <div class="col-md-8 cols-sm-12">
               
                           <div class="row">
                                <div class="col-md-4 cols-sm-12">
                                    Patient Name 
                                </div>
                                <div class="col-md-4 cols-sm-12"> 
                                    <asp:Label ID="lblPatientName" runat="server"  ></asp:Label>
                                </div>
                           </div>
                           <br />
                           <div class="row">
                                <div class="col-md-4 cols-sm-12">
                                    Doctor Name
                                </div>
                                <div class="col-md-4 cols-sm-12"> 
                                    <asp:Label ID="lblDoctorName" runat="server"  ></asp:Label>
                                </div>
                           </div>
                            <br />
                           <div class="row">
                                <div class="col-md-4 cols-sm-12">
                                    Address
                                </div>
                                <div class="col-md-4 cols-sm-12"> 
                                    <asp:Label ID="lblAddress" runat="server"  ></asp:Label>
                                </div>
                           </div>
                           <br />
                           <div class="row">
                                <div class="col-md-4 cols-sm-12">
                                   Mobile No
                                </div>
                                <div class="col-md-4 cols-sm-12"> 
                                    <asp:Label ID="lblMobileNo" runat="server"  ></asp:Label>
                                </div>
                           </div><br />
                           <div class="row">
                                <div class="col-md-4 cols-sm-12">
                                   Number Of Days
                                </div>
                                <div class="col-md-4 cols-sm-12"> 
                                    <asp:Label ID="lblNOD" runat="server"  ></asp:Label>
                                </div>
                           </div> <br />
                           <div class="row">
                                <div class="col-md-4 cols-sm-12">
                                   Payment Mode
                                </div>
                                <div class="col-md-4 cols-sm-12"> 
                                    <asp:Label ID="lblPayment" runat="server"  ></asp:Label>
                                </div>
                           </div>
                             
                            
                       
            </div>
           <div class="col-md-4 cols-sm-12">
                 <asp:Image ID="Image1" runat="server" Width="500px" Height="400px" />
           </div>
           </div>
        
        <br />
        <div class="row">
           <div class="col-md-6 cols-sm-12">
                
               <br /><br />
                <a href="order_Status.aspx">Go to Order's Details</a>
           </div>
            <div class="col-md-6 cols-sm-12">
           </div>
       </div>
    </div>
</asp:Content>
