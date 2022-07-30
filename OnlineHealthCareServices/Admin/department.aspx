<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Admin.Master" AutoEventWireup="true" CodeBehind="department.aspx.cs" Inherits="OnlineHealthCareServices.Admin.department" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container alert-dark">
        
        <div class="row">
            <div class="col-md-10 col-sm-12">
                <h3>Appointment</h3>
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
                      <asp:TextBox ID="txtDepartName" runat="server" CssClass="form-control" placeholder="Department Name "></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"  ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtDepartName"></asp:RequiredFieldValidator>
                   </div>
                   
             </div>
            
            <div class="form-row">
                  <div class="col-md-6 cols-sm-12">
                      <asp:TextBox ID="txtDepartHead" runat="server" CssClass="form-control" placeholder="Head of Department"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtDepartHead"></asp:RequiredFieldValidator>
                   </div>
                   
             </div>
             <div class="form-row">
                  <div class="col-md-6 cols-sm-12">
                      <asp:TextBox ID="txtStatus" runat="server" CssClass="form-control" placeholder="Status"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"  ForeColor="Red" SetFocusOnError="true" ControlToValidate="txtStatus"></asp:RequiredFieldValidator>
                   </div>
                   
             </div>
              
              <br />
             <div class="form-row">
                  <div class="col-md-6 cols-sm-12">
                      <asp:Button ID="btnSubmit" class="btn btn-success btn-block btn-lg" runat="server" Text="Submit" OnClick="btnSubmit_Click"  />
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
        <br />
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table class="table table-bordered">
                        <tr>
                            <th class="table-primary">#</th>
                            <th class="table-secondary">Department Name</th>
                            <th class="table-success">Department Head</th>
                            <th class="table-warning">Department Date</th>
                            <th class="table-info">Status</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr">
                        
                        <td>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("departmentId") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("departmentName") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("HOD") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblGender" runat="server" Text='<%# Eval("createdOn") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
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
