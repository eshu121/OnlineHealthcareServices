<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.Master" AutoEventWireup="true" CodeBehind="user_home.aspx.cs" Inherits="OnlineHealthCareServices.user_home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
                        <div class="col-md-12 cols-sm-12">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="img/opdtype/blood.jpg" width="100%" height="500px" />
                        </div>
                        <%-- <div class="carousel-item">
                        <img src="img/opdtype/heart.jpg" width="100%" height="400px" />
                    </div>--%>
                        <div class="carousel-item">
                            <img src="img/opdtype/lipid.jpg" width="100%" height="500px" />
                        </div>
                        <div class="carousel-item">
                                <img src="img/opdtype/liver.jpg" width="100%" height="500px" /></a>
                           
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>

        </div>
    </div>
        <div class="page-section py-3 mt-md-n5 custom-index">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-4 py-3 py-md-0 wow fadeInLeft" data-wow-delay="300ms">
            <div class="card-service wow fadeInUp">
              <div class="circle-shape bg-secondary text-white">
                    <span class="mai-shield-outline"></span>
              </div>
             <%-- <a href="userLogin.aspx"><p><span>Book</span> Appointment</p></a>--%>
                <asp:LinkButton ID="LinkButton1" runat="server" ><span>Book</span> Appointment</asp:LinkButton>
            </div>
          </div>
          <div class="col-md-4 py-3 py-md-0 wow fadeInUp" data-wow-delay="300ms">
            <div class="card-service wow fadeInUp">
              <div class="circle-shape bg-primary text-white">
                <span class="mai-shield-checkmark"></span>
              </div>
             <%--<a href="userLogin.aspx"><p><span>Book</span> Lab Test</p></a>--%>
             <asp:LinkButton ID="LinkButton2" runat="server" ><span>Book</span> Lab Test</asp:LinkButton>

            </div>
          </div>
          <div class="col-md-4 py-3 py-md-0 wow fadeInRight" data-wow-delay="300ms">
            <div class="card-service wow fadeInUp">
              <div class="circle-shape bg-accent text-white">
                <span class="mai-basket"></span>
              </div>
              <%--<a href="userLogin.aspx"><p><span>Order</span> Medicine</p></a>--%>
              <asp:LinkButton ID="LinkButton3" runat="server"  ><span>Order</span> Medicine</asp:LinkButton>

            </div>
          </div>
        </div>
      </div>
    </div> <!-- .page-section -->

      <div class="page-section">
    <div class="container">
      <h1 class="text-center wow fadeInUp">Your Enquiry</h1>

      <form class="main-form">
        <div class="row mt-5 ">
          <div class="col-12 col-sm-6 py-2 wow fadeInLeft">
            <input type="text" class="form-control" placeholder="Full name">
          </div>
          <div class="col-12 col-sm-6 py-2 wow fadeInRight">
            <input type="text" class="form-control" placeholder="Email address..">
          </div>
          <div class="col-12 col-sm-6 py-2 wow fadeInLeft" data-wow-delay="300ms">
            <input type="text" class="form-control" placeholder="Number..">
          </div>
          <div class="col-12 col-sm-6 py-2 wow fadeInRight" data-wow-delay="300ms">
            <select name="departement" id="departement" class="custom-select">
              <option value="general">General Health</option>
              <option value="cardiology">Cardiology</option>
              <option value="dental">Dental</option>
              <option value="neurology">Neurology</option>
              <option value="orthopaedics">Orthopaedics</option>
            </select>
          </div>
          <%--<div class="col-12 py-2 wow fadeInUp" data-wow-delay="300ms">
            <input type="text" class="form-control" placeholder="Number..">
          </div>--%>
          <div class="col-12 py-2 wow fadeInUp" data-wow-delay="300ms">
            <textarea name="message" id="message" class="form-control" rows="6" placeholder="Enter message.."></textarea>
          </div>
        </div>

        <button type="submit" class="btn btn-primary mt-3 wow zoomIn">Submit Request</button>
      </form>
    </div>
  </div> <!-- .page-section -->


</asp:Content>
