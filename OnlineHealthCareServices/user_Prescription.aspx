<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.Master" AutoEventWireup="true" CodeBehind="user_Prescription.aspx.cs" Inherits="OnlineHealthCareServices.user_Prescription" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <script src="assets/js/jquery-3.5.1.min.js"></script>

     <script type="text/javascript">

         $(document).ready(function () {

             $('#btnclear').click(function () {
                 $('[id*=txtPatientName]').val('');
                 $('[id*=txtDoctorName]').val('');
                 $('[id*=txtAddress]').val('');
                 $('[id*=ddlState]').val('Please Select');
                 $('[id*=ddlDistict]').val('Please Select');
                 $('[id*=txtPinCode]').val('');
                 $('[id*=txtLandmark]').val('');
                 $('[id*=txtNOD]').val('');
                 $('[id*=ddlAddType]').val('Please Select');
                 $('[id*=ddlPayment]').val('Please Select');
                 $('[id*=FileUpload1]').val('');
                 $('[id*=imgPrescp]').attr('src','');
             });
         });
         
         function ShowPreview_Student(input) {          
            var row = input.parentNode.parentNode;
            if (input.files && input.files[0]) {
                var ImageDir = new FileReader();
                ImageDir.onload = function (e) {
                    $('[id*=imgPrescp]').attr('src', e.target.result);
                }
                ImageDir.readAsDataURL(input.files[0]);
            }
        }
         

     </script>
    <style>
        .vl{
            border-left:3px solid ;
            height:100%;
            position:absolute;
            left:63%;
            margin-left:-3px;
            top:0;


        }
    </style>

    <div class="container">
        <div class="row">
        <div class="col-md-8 cols-sm-12">
        <div class="form-group">
            <div class="form-row">
                
               <div class="col-md-12 cols-sm-12">
                    <center><h2>Upload Prescription</h2></center>
               </div>
            </div><hr />
            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label><br />
            <div class="form-row">
                <div class="col-md-2 cols-sm-12">
                    Patient Name 
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtPatientName" runat="server" CssClass="form-control" placeholder="Patient name"></asp:TextBox>                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtPatientName" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                 <div class="col-md-2 cols-sm-12">
                   Doctor Name
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtDoctorName" CssClass="form-control" runat="server" placeholder="Doctor Name"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true" ControlToValidate="txtDoctorName"></asp:RequiredFieldValidator>
                    
                </div>
            </div>
           
                
                 <div class="form-row">
               
                <div class="col-md-2 cols-sm-12">
                    Address
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"  placeholder="Address"></asp:TextBox>                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtAddress" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-2 cols-sm-12">
                    State
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlState_SelectedIndexChanged1" >
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
                    Number of Days 
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtNOD" runat="server" CssClass="form-control" placeholder="Number of Days"></asp:TextBox>                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtNOD" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-2 cols-sm-12">
                   Payment Mode
                </div>
           
                <div class="col-md-4 cols-sm-12">
                    <asp:DropDownList ID="ddlPayment" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="ddlAddType" ForeColor="Red" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
                
                </div>
             <div class="form-row">
                    <div class="col-md-2 cols-sm-12">
                   Prescription Upload 
                </div>
                <div class="col-md-4 cols-sm-12">
                <asp:FileUpload ID="FileUpload1" runat="server" onchange="ShowPreview_Student(this)" /></div>
                  <div class="col-md-2 cols-sm-12">
                   Mobile No 
                </div>
                <div class="col-md-4 cols-sm-12">
                    <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control"></asp:TextBox></div>
                </div>

           <br />
            
                <div class="form-row">
                   
                    <div class="col-md-6 cols-sm-12">
                        <asp:Button ID="btnSubmit" class="btn btn-success btn-block btn-lg" runat="server" Text="Save Order"  ValidationGroup="update" OnClick="btnSubmit_Click"   />
                    </div>
                    <div class="col-md-6 cols-sm-12">
                        <input id="btnclear" name="btnclear" value="Clear" type="button" class="btn btn-success btn-block btn-lg"/>
                        </div>
                </div>    <br />
            <div class="form-row">
                <div class="col-md-6 cols-sm-12">
                    <asp:Button ID="btnOrder" runat="server" class="btn btn-success btn-block btn-lg" Text="Go Order" OnClick="btnOrder_Click" />
                </div>
            </div>
       </div>
            
        </div>
                <div class="col-md-4 cols-sm-12">
                    <div class="col-md-12 cols-sm-12">
                            <center><h2>Prescription Preview</h2></center>
                    </div>
                    <hr />
            
                    <asp:Image ID="imgPrescp" runat="server" height="600px" Width="500px" alt=""/>
                </div>
            </div>
    </div>

</asp:Content>

