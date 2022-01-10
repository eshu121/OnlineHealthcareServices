<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.Master" AutoEventWireup="true" CodeBehind="testHistory.aspx.cs" Inherits="OnlineHealthCareServices.testHistory" %>
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
                    <center><h2>Test History</h2></center>
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
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("testName") %>'> </asp:Label></h2>&nbsp<h2>
                            <asp:HiddenField ID="HiddenField1" Value='<%# Eval("labTestDetailId") %>' runat="server" />
                            </div>
                            </div>
                            <div class="row">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("SubTestName") %>'></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-4 cols-sm-12">
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                               <a href="#" download>Test Report</a>
                                    </div>
                            </div><br />
                            
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
   
</asp:Content>
