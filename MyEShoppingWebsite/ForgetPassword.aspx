<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Forget Password</title>
    <meta charset="utf-8" />
    <meta name ="viewport" content="width=device-width, initial-scale =1" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>

</head>
<body>
    <form id="form1" runat="server">
       <div>
            <div class="bs-example">
    <nav class="navbar navbar-expand-md navbar-light bg-light">
        <a href="Default.aspx" class="navbar-brand"><span><img src="img/logo.jpg"  alt="MyEShopping" height="60"/></span>e-Shopping</a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
            <div class="navbar-nav">
                <a href="Default.aspx" class="nav-item nav-link">Home</a>
                <a href="#" class="nav-item nav-link">About Us</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Products</a>
                    <div class="dropdown-menu">
                        <li class="dropdown-header">Men</li>
                        <li role="separator" class ="divider"></li>
                        <a href="#" class="dropdown-item">Shirts</a>
                        <a href="#" class="dropdown-item">Pants</a>
                        <a href="#" class="dropdown-item">Denims</a>
                        <li role="separator" class ="divider"></li>
                        <li class="dropdown-header">Women</li>
                        <li role="separator" class ="divider"></li>
                        <a href="#" class="dropdown-item">Tops</a>
                        <a href="#" class="dropdown-item">Pants</a>
                        <a href="#" class="dropdown-item">Denims</a>
                       
                    </div>
                </div>
                 <a href="#" class="nav-item nav-link">Contact Us</a>
                 <a href="#" class="nav-item nav-link">Blogs</a>
               
            </div>
      </div>
        <div class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" />
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>

                        <button id="btnCart" class="btn btn-primary navbar-btn ml-2" type="button">
                            Cart <span class="badge" id="pCount" runat="server"></span>
                        </button>
                    </div>
                    <ul class="navbar-nav mr-auto">
                        
                        <li class="nav-item"><a class="nav-link" href="SignIn.aspx">Sign In</a></li>
                    </ul>
    </nav>
</div>
        </div>
        <br />
               <div class="container">
                   <div class="form-horizontal">
                       <h3>Recover Password</h3>
                       <hr />
                       <h4>Please Enter Your Email, we will send you the recovery link for your password!</h4>
                       <div class="form-group">
                           <asp:Label ID ="lblEmail" runat="server" CssClass="col-md-2 control-label"  Text=" Your Email Address"></asp:Label>
                           <div class="col-md-3">
                                 <asp:TextBox ID ="txtEmail" runat="server" CssClass="auto-style1" placeholder="Enter your Email" Width="201px"></asp:TextBox>
                               <asp:RequiredFieldValidator ID ="rfvEmail" runat ="server" ControlToValidate="txtEmail" CssClass="alert-danger" ErrorMessage="Enter Valid Email" ForeColor="Red"></asp:RequiredFieldValidator>
                           &nbsp;&nbsp;<asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Valid Email .com" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                 <br />
&nbsp;&nbsp;
                                 <br />
                                 
                                 <asp:Button ID="btnResetPass" runat="server" Text="Send" CssClass="mt-0" OnClick="btnResetPass_Click" />
                                               <asp:Label ID ="lblResetPassMsg" runat="server" CssClass="alert-success" ></asp:Label>

                           </div>
                      </div>

                   </div>

                   

               </div>

    </form>
    <br />
     <footer>


            <div style="background-color: #21d192;">
    <div class="container">

      <!-- Grid row-->
      <div class="row py-4 d-flex align-items-center">

        <!-- Grid column -->
        <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
          <h6 class="mb-0">Get connected with us on social networks!</h6>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-6 col-lg-7 text-center text-md-right">

          <!-- Facebook -->
         <a class="fb-ic"  href="https://www.facebook.com/">
            <i class="fab fa-facebook-f white-text mr-4"> </i>
          </a>
          <!-- Twitter -->
          <a class="tw-ic" href="https://twitter.com/explore">
            <i class="fab fa-twitter white-text mr-4"> </i>
          </a>
          <!-- Google +-->
          <a class="gplus-ic"href="https://myaccount.google.com/intro/profile" >
            <i class="fab fa-google-plus-g white-text mr-4"> </i>
          </a>
          <!--Linkedin -->
          <a class="li-ic" href="https://www.linkedin.com/">
            <i class="fab fa-linkedin-in white-text mr-4"> </i>
          </a>
          <!--Instagram-->
          <a class="ins-ic" href="https://www.instagram.com/?hl=en">
            <i class="fab fa-instagram white-text"> </i>
          </a>

        </div>
        <!-- Grid column -->

      </div>
      <!-- Grid row-->

    </div>
  </div>

  <!-- Footer Links -->
  <div class="container text-center text-md-left mt-5">

    <!-- Grid row -->
    <div class="row mt-3 dark-grey-text">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-4 col-xl-3 mb-4">

        <!-- Content -->
        <h6 class="font-weight-bold">e-Shopping</h6>
        <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>Here you can use rows and columns to organize your footer content. Lorem ipsum dolor sit amet,
          consectetur
          adipisicing elit.</p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Products</h6>
        <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <a class="dark-grey-text" href="#!">Shirts</a>
        </p>
        <p>
          <a class="dark-grey-text" href="#!">Top</a>
        </p>
        <p>
          <a class="dark-grey-text" href="#!">Kurti</a>
        </p>
        <p>
          <a class="dark-grey-text" href="#!">Saree</a>
        </p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Useful links</h6>
        <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <a class="dark-grey-text" href="Default.aspx">Home</a>
        </p>
        <p>
          <a class="dark-grey-text" href="#!">About Us</a>
        </p>
        <p>
          <a class="dark-grey-text" href="#!">Contact Us</a>
        </p>
        <p>
          <a class="dark-grey-text" href="#!">Blogs</a>
        </p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Contact</h6>
        <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <i class="fas fa-home mr-3"></i> Navi Mumbai, 400614, India</p>
        <p>
          <i class="fas fa-envelope mr-3"></i> info@example.com</p>
        <p>
          <i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>
        <p>
          <i class="fas fa-print mr-3"></i> + 01 234 567 89</p>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

  <!-- Copyright -->
  <div class="footer-copyright text-center text-black-50 py-3">© 2020 Copyright:
    <a class="dark-grey-text" href="Default.aspx"> e-Shopping</a>
  </div>
        </footer>
</body>
</html>
