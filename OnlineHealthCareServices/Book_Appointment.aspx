<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.Master" AutoEventWireup="true" CodeBehind="Book_Appointment.aspx.cs" Inherits="OnlineHealthCareServices.Book_Appointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

    <h1 class="text-center wow fadeInUp">Make an Appointment</h1>
    <hr />
    <div class="container">
         <asp:DataList ID="DataList1" RepeatColumns="3" runat="server">
        <ItemTemplate>
             <div class="container">
                    <div class="row">
                       
                        <div class="card-doctor border">
                        <div class="header">
                          <img src="../img/opdtype/<%# Eval("diseaseImg") %>" alt="" width="300px" height="200px">
                          <div class="meta">
                            <a href="#"><span class="mai-call"></span></a>
                            <a href="#"><span class="mai-logo-whatsapp"></span></a>
                          </div>
                        </div>
                        <div class="body">
                          <span class="text-sm text-grey"><%# Eval("diseaseName") %></span>
                        </div>
                      </div>
                      
                    </div>
                </div>
        </ItemTemplate>
    </asp:DataList>
    </div>
   



<%--    <div class="container">
        <%--  --
       <div class="card" style="width: 20rem;">
          <img class="card-img-top" src="../img/opdtype/cardiology.jpeg" alt="Card image cap" style="height:15rem">
          <div class="card-body">
            <h5 class="card-title">Cardiology</h5>
            <p class="card-text">Heart attack<br>
                                   Hypertriglyceridemia<br>
                                   Postural orthostatic<br>

            </p>
              
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
       </div>
        <div class="card" style="width: 20rem;">
          <img class="card-img-top" src="../img/opdtype/dental.jpeg" alt="Card image cap" style="height:15rem">
          <div class="card-body">
            <h5 class="card-title">Dental</h5>
            <p class="card-text">Oral cancer<br>
             Dental plaque<br>
             Tooth impaction</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
       </div>
        <div class="card" style="width: 20rem;">
          <img class="card-img-top" src="../img/opdtype/neurology.jpeg" alt="Card image cap" style="height:15rem">
          <div class="card-body">
            <h5 class="card-title">Neurology</h5>
            <p class="card-text">Alzheimers disease<br>
            Aphasia<br>
            Bells palsy</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
            
       </div>
        <div class="card" style="width: 20rem;">
          <img class="card-img-top" src="../img/opdtype/generalmedcine.jpeg" alt="Card image cap" style="height:15rem">
          <div class="card-body">
            <h5 class="card-title">General Medicine</h5>
            <p class="card-text">Internal Diseases<br>Acute Diseases<br>Chronic Diseases</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
       </div>
        <div class="card" style="width: 20rem;">
          <img class="card-img-top" src="../img/opdtype/ent.jpeg" alt="Card image cap" style="height:15rem">
          <div class="card-body">
            <h5 class="card-title">E N T</h5>
            <p class="card-text">Hearing disorders<br>
             Thyroid disorders<br>
             Vertigo</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
       </div>
         <div class="card" style="width: 20rem;">
          <img class="card-img-top" src="../img/opdtype/orthology.jpeg" alt="Card image cap" style="height:15rem">
          <div class="card-body">
            <h5 class="card-title">Orthology</h5>
            <p class="card-text">Knee replacement<br>
            Arthritis<br>
             Knee pain</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
          </div>
       </div>
      
    </div>--%>

</asp:Content>
