<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="Library_Management.adminlogin" %>
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
                                <img src="imgs/admin%20user.png" width="150px"/>
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <h3>Admin Login</h3>
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <hr />
                            </center>
                        </div>
                        <div class="col">
                           <input type="text" placeholder="Admin ID" class="form-control" name="admin"/>
                        </div>
                        <div class="col">
                            <br />
                           <input type="password" placeholder="Password" class="form-control" name="password"/>
                        </div>
                        <div class="col">
                            <center>
                                <br />
                                <button type="button" class="btn btn-login w-100" onclick="adminLogin()" type="submit">Login</button>
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

        function adminLogin() {
            var form = document.getElementById("form1");
            var data = new FormData(form);
            $.ajax({
                type: "POST",
                url: "https://localhost:44355/api/adminLogin",
                data: data,
                processData: false,
                contentType: false,
                success: function () {
                    console.log("Its done bro");
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
