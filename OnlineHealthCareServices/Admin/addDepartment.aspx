<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/Admin.Master" AutoEventWireup="true" CodeBehind="addDepartment.aspx.cs" Inherits="OnlineHealthCareServices.Admin.addDepartment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
        <div class="row">
            <h3 style="text-align:center">Add Department</h3>
        </div>
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

</asp:Content>
