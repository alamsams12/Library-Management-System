<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="Library_Management.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
     <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
                           <input type="text" name="name" placeholder="User Name" class="form-control" id="userName"/>
                        </div>
                        <div class="col">
                            <br />
                           <input type="password" name="password" placeholder="Password" class="form-control" id="password"/>
                        </div>
                        <div class="col">
                            <center>
                                <br />
                                <button type="button" class="btn btn-login w-100" onclick="userLogin()">Go</button>
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <br />
                                <a href ="usersignup.aspx"><button type="button" class="btn btn-login w-100">Sign Up</button></a>
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
    
    <script>

        
        function userLogin() {
            var name = document.querySelector("#userName").value;
            var password = document.querySelector("#password").value;

            var formData = new FormData();
            formData.append("userName",name);
            formData.append("password",password);

            $.ajax({
                type: "POST",
                url: "https://localhost:44355/api/userLogin",
                data:formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    console.log("Its done bro");
                    console.log(response);
                    Swal.fire({
                        title: "Success",
                        text: "Successfully logged in",
                        icon: "success",
                        timer: 1500
                    }).then(function () {
                        window.location.href = "homepage.aspx";
                    });
                    document.getElementById("form1").reset();
                },
                error: function (xhr) {
                    Swal.fire("Error", "Something went wrong", "error");
                }
            })
        }
    </script>
</asp:Content>
