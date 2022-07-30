<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Admin.Master" AutoEventWireup="true" CodeBehind="addDoctor.aspx.cs" Inherits="OnlineHealthCareServices.Admin.addDoctor" %>
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
        <div class="row">
            <h3 style="text-align:center">Add Doctor</h3>
        </div>
             <div class="form-row">
                  <div class="col-md-6 cols-sm-12">
                      <asp:TextBox ID="txtDoctorName" runat="server" CssClass="form-control" placeholder="First Name "></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"  ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtDoctorName"></asp:RequiredFieldValidator>
                   </div>
                 <div class="col-md-6 cols-sm-12">
                       <asp:TextBox ID="txtEducation" runat="server" CssClass="form-control" placeholder="Education "></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtEducation"></asp:RequiredFieldValidator>
                   </div>
             </div>
            
            <div class="form-row">
                  <div class="col-md-6 cols-sm-12">
                      <asp:DropDownList ID="ddlDepart" CssClass="form-control" runat="server"></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="ddlDepart"></asp:RequiredFieldValidator>
                   </div>
                   <div class="col-md-6 cols-sm-12">
                       <asp:TextBox ID="txtExprience" runat="server" CssClass="form-control" placeholder="Exprience " TextMode="Number"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtExprience"></asp:RequiredFieldValidator>
                   </div>
             </div>
            <div class="form-row">
                  <div class="col-md-6 cols-sm-12">
                      <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Mobile No"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtMobile"></asp:RequiredFieldValidator>
                   </div>
                   <div class="col-md-6 cols-sm-12">
                       <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                   </div>
             </div>
             <div class="form-row">
                 <div class="col-md-6 cols-sm-12">
                       <asp:TextBox ID="txtOpd" runat="server" CssClass="form-control" placeholder="OPD Time"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtOpd"></asp:RequiredFieldValidator>
                   </div>
                  <div class="col-md-6 cols-sm-12">
                      <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtPass"></asp:RequiredFieldValidator>
                   </div>
                   
             </div>  
              <div class="form-row">
                  <div class="col-md-6 cols-sm-12">
                      <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control"></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="ddlGender"></asp:RequiredFieldValidator>
                   </div>
                  <div class="col-md-2 cols-sm-12">
                        Image
                    </div>
                    <div class="col-md-4 cols-sm-12">
                        <asp:FileUpload ID="FileUpload1" runat="server" onchange="ShowPreview_Student(this)"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="FileUpload1" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                  <div class="col-md-2 cols-sm-12">
                       <asp:Image ID="imgProfile" runat="server" CssClass="imgProfile1" alt=""/>
                    </div>
                  </div><br />
             <div class="form-row">
                  <div class="col-md-6 cols-sm-12">
                      <asp:Button ID="btnSubmit" class="btn btn-success btn-block btn-lg" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                   </div>
                   <div class="col-md-6 cols-sm-12">
                       <asp:Button ID="btnClear" class="btn btn-success btn-block btn-lg" runat="server" Text="Clear" />
                   </div>
             </div>
        
    </div>
</asp:Content>
