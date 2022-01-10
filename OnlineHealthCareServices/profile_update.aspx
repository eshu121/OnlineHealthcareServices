<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.Master" AutoEventWireup="true" CodeBehind="profile_update.aspx.cs" Inherits="OnlineHealthCareServices.profile_update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <script src="assets/js/jquery-3.5.1.min.js"></script>

     <script type="text/javascript">

         $(document).ready(function () {

             $('#btnclear').click(function () {

                 $('[id*=txtFirstname]').val('');
                 $('[id*=txtMiddlename]').val('');
                 $('[id*=txtLastname]').val('');
                 $('[id*=txtAge]').val('');
                 $('[id*=ddlGender]').val('Please Select');
                 $('[id*=txtAddress1]').val('');
                 $('[id*=txtAddress2]').val('');
                 $('[id*=ddlState]').val('Please Select');
                 $('[id*=ddlDistict]').val('Please Select');
                 $('[id*=txtPinCode]').val('');
                 $('[id*=txtLandmark]').val('');
                 $('[id*=ddlAddType]').val('Please Select');
                 $('[id*=FileUpload1]').val('');


             });
         });

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
        <div class="form-group">
            <div class="form-row">
               <div class="col-md-12 cols-sm-12">
                    <center><h2>Profile Update</h2></center>
               </div>
            </div><br />
            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label><br />
            <div class="form-row">
                <div class="col-md-2 cols-sm-12">
                    First Name 
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtFirstname" runat="server" CssClass="form-control" placeholder="First name"></asp:TextBox>                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtFirstname" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                 <div class="col-md-2 cols-sm-12">
                   Middle Name
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtMiddlename" runat="server" CssClass="form-control" placeholder="Middle name"></asp:TextBox>                
                    </div>
            </div>
            <div class="form-row">
                <div class="col-md-2 cols-sm-12">
                    Last Name 
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtLastname" runat="server" CssClass="form-control" placeholder="Last name"></asp:TextBox>                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtLastname" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                 <div class="col-md-2 cols-sm-12">
                   Age
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="Age" MaxLength="3"></asp:TextBox>                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="txtAge" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-2 cols-sm-12">
                    Gender 
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                        
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="ddlGender" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                 <div class="col-md-2 cols-sm-12">
                    Mobile No.
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>                
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-2 cols-sm-12">
                    Email Address
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtEmailId" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>                
                </div>
                <div class="col-md-2 cols-sm-12">
                    Address Line1
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtAddress1" runat="server" CssClass="form-control"  placeholder="Address Line1"></asp:TextBox>                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtAddress1" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                 
            </div>
            <div class="form-row">
                <div class="col-md-2 cols-sm-12">
                    Address Line2
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control" placeholder="Address Line2"></asp:TextBox>                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="txtAddress2" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-2 cols-sm-12">
                    State
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="ddlState" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
            </div>
          
            <div class="form-row">
                 <div class="col-md-2 cols-sm-12">
                     Distict
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:DropDownList ID="ddlDistict" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="ddlDistict" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                  <div class="col-md-2 cols-sm-12">
                    PinCode
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control" placeholder="Pin Code" MaxLength="6"></asp:TextBox>                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="txtPinCode" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
            </div>
            
            <div class="form-row">
              <div class="col-md-2 cols-sm-12">
                    LandMark
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtLandmark" runat="server" CssClass="form-control" placeholder="Landmark"></asp:TextBox>                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="txtLandmark" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                 <div class="col-md-2 cols-sm-12">
                    Address Type
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:DropDownList ID="ddlAddType" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="ddlAddType" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
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
                  <div class="col-md-4 cols-sm-12">

                  </div>
                  </div><br />
            
            <div class="form-group">
                <div class="form-row">
                    <div class="col-md-6 cols-sm-12">
                        <asp:Button ID="btnSubmit" class="btn btn-success btn-block btn-lg" runat="server" Text="Submit"  ValidationGroup="update" OnClick="btnSubmit_Click" />
                    </div>
                    <div class="col-md-6 cols-sm-12">
                        <input id="btnclear" name="btnclear" value="Clear" type="button" class="btn btn-success btn-block btn-lg"/>
                        </div>
                </div>
            </div>
             
            
       
        </div>
    </div>
   
</asp:Content>
