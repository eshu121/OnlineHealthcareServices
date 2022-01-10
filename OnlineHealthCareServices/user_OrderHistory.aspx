<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.Master" AutoEventWireup="true" CodeBehind="user_OrderHistory.aspx.cs" Inherits="OnlineHealthCareServices.user_OrderHistory" %>
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
                        <td>
                            <asp:LinkButton ID="lnkEdit"  runat="server"  OnClick="EditOrder">Edit/View</asp:LinkButton> | <asp:LinkButton ID="lnkCancel" runat="server" OnClick="CancelOrder">Cancel Order</asp:LinkButton></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

        </div>
    </div>
</asp:Content>
