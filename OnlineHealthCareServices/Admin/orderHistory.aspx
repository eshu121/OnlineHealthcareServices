<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Admin.Master" AutoEventWireup="true" CodeBehind="orderHistory.aspx.cs" Inherits="OnlineHealthCareServices.Admin.orderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .a1{
            border:1px solid black;
            border-radius:10px;
        }
         
    </style>
    <div >
    <div class="container"  >
        <div class="row">
               <div class="col-md-12 cols-sm-12">
                    <center><h2>Order History</h2></center>
               </div>
            <hr />
        </div><br />
        <asp:Panel ID="Panel1" runat="server">
        <asp:Repeater ID="Repeater1" runat="server" >
            <ItemTemplate>
                <div class="container a1 table">
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                          
                            <img src="../Prescription/<%# Eval("PrescriptionImg") %>" width="300px" height="200px" />
                            <asp:HiddenField ID="HiddenField1" Value='<%# Eval("PrescriptionDetailId") %>' runat="server" />
                        </div>
                        <div class="col-md-4 cols-sm-12">
                        <div class="col-md-12  col-sm-12">
                            <div class="row"><h2>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("PatientName") %>'></asp:Label></h2>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                Address : 
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Addresss") %>' Font-Bold="True"></asp:Label> , 
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("distictName") %>' Font-Bold="True">,</asp:Label> , 
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("stateName") %>' Font-Bold="True"></asp:Label></div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                Amount : 
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Amount") %>' Font-Bold="True"></asp:Label> |
                                Discount : 
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Discount") %>' Font-Bold="True"></asp:Label>  
                                </div>
                                
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                Order Status : 
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("OrderStatusId").ToString() == "2" ? "Canceled by you" : Eval("adminOrderStatus") %>' Font-Bold="True"></asp:Label> 
                                </div>
                               
                            </div>
                            <div class="row">
                                <div class="col-sm-12 cols-sm-12">
                                Date :  
                                <asp:Label ID="Label9" runat="server" Text='<%# Convert.ToDateTime(Eval("CreatedDate")).ToString("dd-MMM-yyyy") %>' Font-Bold="True"></asp:Label> 

                                </div>
                                
                            </div>
                            
                            </div>
                        </div>
                        <div class="col-md-4 cols-sm-12">
                            <br />
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    Total Amount : 
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("Paid") %>' Font-Bold="True"></asp:Label>  
                                </div>
                            </div><br />
                             <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <%# Convert.ToDouble(Eval("Paid"))!=0.00 && Convert.ToInt32(Eval("paymentStatus"))==0 && Convert.ToDouble(Eval("OrderStatusId")) !=2 ? "<a href='Payment.aspx?PresId="+Eval("PrescriptionDetailId")+"' style='padding: 5px 15px 5px 15px; background-color:red; color:#fff; border-radius:5px;'>Payment</a>": (Convert.ToDouble(Eval("Paid")) !=0.00 && Convert.ToInt32(Eval("paymentStatus"))==1 && Convert.ToDouble(Eval("OrderStatusId")) !=2) ? "<a href='' style='padding: 5px 15px 5px 15px; background-color:green; color:#fff; border-radius:5px;'>Payment Success</a>":"" %>
                                    <%# (Convert.ToDouble(Eval("Paid")) !=0.00 && Convert.ToDouble(Eval("OrderStatusId")) ==2) ? "<a href='' style='padding: 5px 15px 5px 15px; background-color:green; color:#fff; border-radius:5px;'>Amount Return Successfully</a>":""%>

                                </div>
                            </div><br />
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                               <a href='../Prescription/<%# Eval("invoice") %>' download>Invoice</a>
                                    </div>
                            </div><br />
                            <div class="row">
                                <a href="orderEdit.aspx?PpId=<%# Eval("PrescriptionDetailId")%>" style='padding: 5px 15px 5px 15px; background-color:#5aba1d; color:#fff; border-radius:5px;'>Edit</a>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
            </asp:Panel>
    </div>
            </div>
  

   </div>
</asp:Content>
