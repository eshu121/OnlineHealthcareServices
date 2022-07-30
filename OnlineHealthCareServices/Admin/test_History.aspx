<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Admin.Master" AutoEventWireup="true" CodeBehind="test_History.aspx.cs" Inherits="OnlineHealthCareServices.Admin.test_History" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .a1{
            border:1px solid black;
            border-radius:10px;
        }
         
    </style>
     <script>
         function ShowPreview_Student(input) {          
            var row = input.parentNode.parentNode;
            if (input.files && input.files[0]) {
                var ImageDir = new FileReader();
                ImageDir.onload = function (e) {
                    $('[id*=imgProfile]').attr('src', e.target.result);
                }
                ImageDir.readAsDataURL(input.files[0]);
            }
        }
    </script>
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
                        <div class="col-md-6 cols-sm-12">
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
                        <%--<div class="col-md-2 cols-sm-12">
                            <h5>Status</h5><br /><asp:Label ID="Label3" runat="server" Text='<%# Eval("Report").ToString()=="1" ? "Test Complete": "Test in Process" %>'></asp:Label></td>

                        </div>--%>
                        <div class="col-md-4 cols-sm-12">
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                               <a href="#" download>Test Report</a>
                                    </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <a href="Lab_Update?LabId=<%# Eval("appointmentid")%>" class="btn" style='background-color:blue; color:#fff; border-radius:5px;'>Edit</a>
                            </div>
                            </div><br />
                            
                        </div>
                    </div>
               
            </ItemTemplate>
        </asp:Repeater>


        </div>

                 
   
</asp:Content>
