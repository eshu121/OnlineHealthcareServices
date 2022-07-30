<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Admin.Master" AutoEventWireup="true" CodeBehind="Lab_Update.aspx.cs" Inherits="OnlineHealthCareServices.Admin.Lab_Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <div class="container">
        <div class="row" style="text-align:center;">
            Update Appointment
        </div>
        <div class="form-row">
           <div class="col-md-4 cols-sm-12">
                        Image
                    </div>
                    <div class="col-md-6 cols-sm-12">
                        <asp:FileUpload ID="FileUpload1" runat="server" onchange="ShowPreview_Student(this)"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="FileUpload1" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                  <div class="col-md-2 cols-sm-12">
                       <asp:Image ID="imgProfile" runat="server" CssClass="imgProfile1" alt=""/>
                    </div>
        </div>
        <div class="form-row">
            <div class="col-md-6 cols-sm-12">
            <asp:Button ID="Button1" class="btn btn-success btn-block btn-lg" runat="server" Text="Button" OnClick="Button1_Click" />
                </div>
        </div>
    </div>

</asp:Content>
