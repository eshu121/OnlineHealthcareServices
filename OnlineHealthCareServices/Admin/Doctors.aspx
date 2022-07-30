<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Admin.Master" AutoEventWireup="true" CodeBehind="Doctors.aspx.cs" Inherits="OnlineHealthCareServices.Admin.Doctors" %>
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
    <div class="container alert-dark">
        
        <div class="row">
            <div class="col-md-10 col-sm-12">
                <h3>All Doctors</h3>
            </div>
            <div class="col-md-2 col-sm-12">
                    <div class="wrapper-editor">

  

  <div class="row d-flex justify-content-center modalWrapper">
    <div class="modal fade addNewInputs" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="modalAdd"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header text-center">
            <h4 class="modal-title w-100 font-weight-bold text-primary ml-5">Add new Doctor</h4>
            <button type="button" class="close text-primary" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body mx-3">
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
                      <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control"></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="ddlGender"></asp:RequiredFieldValidator>
                   </div>
                 <div class="col-md-6 cols-sm-12">
                       <asp:TextBox ID="txtOpd" runat="server" CssClass="form-control" placeholder="OPD Time"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtOpd"></asp:RequiredFieldValidator>
                   </div>
                  
                   
             </div>  
              <div class="form-row">
                 
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
                       <asp:Button ID="btnClear" class="btn btn-success btn-block btn-lg" runat="server" Text="Clear" OnClick="btnClear_Click" />
                   </div>
             </div>
        
          </div>
          
        </div>
      </div>
    </div>
       <div class="text-center">
      <a href="" class="btn btn-info btn-rounded btn-sm" data-toggle="modal" data-target="#modalAdd">Add<i
          class="fas fa-plus-square ml-1"></i></a>
    </div>


        </div>
        </div>

                  </div>
            </div>
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table class="table table-bordered">
                        <tr>
                            <th class="table-primary">Image</th>
                            <th class="table-secondary">Name</th>
                            <th class="table-success">Department</th>
                            <th class="table-danger">Degree</th>
                            <th class="table-warning">Mobile</th>
                            <th class="table-info">Email</th>
                            <th class="table-light">Action</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr">
                        <td>
                            <img src="../DoctorImg/<%# Eval("Doctorimg") %> " width="50px" height="50px" />
                        </td>
                        <td>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("doctorName") %>'></asp:Label>
                            <asp:HiddenField ID="hdnDoctorId" Value='<%# Eval("doctorId") %>' runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="lblDepart" runat="server" Text='<%# Eval("departmentName") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDegree" runat="server" Text='<%# Eval("Degree") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("MobileNo") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("EmailId") %>'></asp:Label>
                        </td>
                        <td>
                                <a href="addDoctor.aspx?doctorId=<%# Eval("doctorId")%>" class="btn" style='background-color:blue; color:#fff; border-radius:5px;'>Edit</a>|<asp:LinkButton ID="LinkButton2" CssClass="btn" runat="server" ForeColor="Black" onClick="lnkDelete" BackColor="Red" BorderStyle="Outset">Delete</asp:LinkButton>
                        </td>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

        </div>
    </div>
</asp:Content>
