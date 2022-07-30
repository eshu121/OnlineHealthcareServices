<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/MyMaster.Master" AutoEventWireup="true" CodeBehind="cancel_order.aspx.cs" Inherits="OnlineHealthCareServices.cancle_order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">
        <div class="row">
               <div class="col-md-12 cols-sm-12">
                    <center><h2>Order History</h2></center>
               </div>
            <hr />

            <asp:Repeater ID="repOrderHistory" runat="server">
                <HeaderTemplate>
                    <table class=" table table-striped table-bordered table-hover">
                        <tr>
                            <th>SNo.</th>
                            <th>Date</th>
                            <th>Patient Name</th>
                            <th>Address</th>
                            <th>Order Status</th>
                            <th>Action</th>
                        </tr>                   
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblSNo" runat="server" Text='<%# Eval("SNo") %>'></asp:Label></td>
                        <asp:HiddenField ID="hdnPresId" Value='<%# Eval("PrescriptionDetailId") %>' runat="server" />
                        <td>
                            <asp:Label ID="lblDate" runat="server" Text='<%# Convert.ToDateTime(Eval("CreatedDate")).ToString("dd-MMM-yyyy") %>'></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPatientName" runat="server" Text='<%# Eval("PatientName") %>'></asp:Label></td>
                        <td>
                            <asp:Label ID="lblAddres" runat="server" Text='<%# Eval("Addresss") %>'></asp:Label></td>
                        <td>
                            <asp:Label ID="lblOrderStatus" runat="server" Text='<%# Eval("OrderStatusId").ToString()=="2" ? "Canceled by you": Eval("adminOrderStatus") %>'></asp:Label></td>
                        <td> <asp:Button ID="Button1" runat="server" Text="Confirmed Cancellation" OnClick="Button1_Click"  /></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div> 
            <br /><br />
       <div class="row">
           <div class="col-md-6 cols-sm-12">
                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="14pt" ForeColor="Green"></asp:Label>
           </div>
            <div class="col-md-6 cols-sm-12">
                <a href="order_History.aspx">Back to Order History</a>
           </div>
       </div>
    </div>
</asp:Content>
