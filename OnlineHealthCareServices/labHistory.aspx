<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.Master" AutoEventWireup="true" CodeBehind="labHistory.aspx.cs" Inherits="OnlineHealthCareServices.labHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .a1{
            border:1px solid black;
            border-radius:10px;
        }
         
    </style>
    <div class="container" >
        <div class="row">
               <div class="col-md-12 cols-sm-12">
                    <center><h2>Lab Test History</h2></center>
               </div>
            <hr />
        </div><br />
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="container a1 table">
                    <div class="row">
                        <div class="col-md-8 cols-sm-12">
                        <div class="col-md-12  col-sm-12">
                            <div class="row"><h2>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("FirstName") %>'> </asp:Label></h2>&nbsp<h2>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("LastName") %>'></asp:Label></h2>
                            <asp:HiddenField ID="HiddenField1" Value='<%# Eval("labTestId") %>' runat="server" />
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                Address : 
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Addresss") %>' Font-Bold="True"></asp:Label></div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                Date : 
                                <asp:Label ID="Label9" runat="server" Text='<%# Convert.ToDateTime(Eval("Testdate")).ToString("dd-MMM-yyyy") %>' Font-Bold="True"></asp:Label> 
                                Time : 
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Slot") %>' Font-Bold="True"></asp:Label>  
                                </div>
                                
                            </div>
                            
                            
                            </div>
                        </div>
                        <div class="col-md-4 cols-sm-12">
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-md-12 cols-sm-12">
                                    Payment Status :
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("PaymentStatus").ToString() == "1" ? "Payment Success" : "Payment Panding" %>' Font-Bold="True"></asp:Label> 

                                </div>
                               
                            </div>
                            <div class="col-md-12 col-sm-12">
                                <a href="testHistory.aspx?TestId=<%# Eval("labTestId")%>" style='padding: 5px 15px 5px 15px; background-color:#5aba1d; color:#fff; border-radius:5px;'>View Test</a>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
   
</asp:Content>
