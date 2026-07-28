<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="Library_Management.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="col">
                            <center>
                                <img src="imgs/user.png" width="150px" />
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <h3>Member Login</h3>
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <hr />
                            </center>
                        </div>
                        <div class="col">
                           <input type="text" placeholder="User Name" class="form-control"/>
                        </div>
                        <div class="col">
                            <br />
                           <input type="password" placeholder="Password" class="form-control"/>
                        </div>
                        <div class="col">
                            <center>
                                <br />
                                <asp:Button ID="userLoginBtn" runat="server" CssClass="btn btn-login w-100" Text="Login" />
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <br />
                                <asp:Button ID="userSignUpBtn" runat="server" Text="Sign Up" CssClass="btn btn-signup w-100" />
                            </center>
                        </div>
                    </div>
                </div>
                <br />
                <a href="homepage.aspx"> <-Back to Home </a>

            </div>

        </div>
    </div>
    <br />
    

</asp:Content>
