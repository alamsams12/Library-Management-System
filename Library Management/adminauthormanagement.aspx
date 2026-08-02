<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="Library_Management.adminauthormanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

         <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br /><br />
    <div class="container">
        <div class="row">
            <div class="col-5 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="col">
                            <center>
                                <img src="imgs/writer.png" width="150px"/>
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <h4>Author Details</h4>
                            </center>
                        </div>
                        <hr />
                        <div class="row">
                            <%--<div class="col-4">
                                <label>Author ID</label>
                                <div class="input-group">
                                    <input type="text" placeholder="ID" class="form-control" name="author_id" id="author_id"/> 
                                    <button class="btn btn-login">Go</button>
                                </div>
                            </div>--%>
                            
                            <div class="col-6">
                                <label>Author Name</label>
                                <input type="text" placeholder="Author Name" class="form-control" name="author_name" id="author_name"/>
                            </div>
                            <div class="col-6">
                                <label>Country</label>
                                <input type="text" placeholder="Enter country" class="form-control" name="country" id="country" />
                            </div>
                        </div>
                        <br />
                        
                        <div class="col-12">
                            <label>Description</label>
                            <textarea class="form-control" name="description" id="description" placeholder="Enter description"></textarea>
                        </div>
                        <br />


                        <div class="row mx-auto">
                            <div class="col-12">
                                <button type="button" class="btn btn-success w-100" onclick="save_author()">Add</button>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <br />
                <a href="homepage.aspx"> <-Back to Home </a>
            </div>
            
            <div class="col-7 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="col">
                            <center>
                                <img src="imgs/writer%20logo.png" width="150px"/>
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <h4>Author List</h4>
                            </center>
                        </div>
                        <hr />
                    </div>
                    <div class="col">
                        <table class="table table-bordered" id="authorListTable">
                            <thead>
                                <tr>
                                    <th style="background-color: #730cc4; color: white;">Author Id</th>
                                    <th style="background-color: #730cc4; color: white;">Author Name</th>
                                    <th style="background-color: #730cc4; color: white;">Country</th>
                                    <th style="background-color: #730cc4; color: white;">Description</th>
                                    <th style="background-color: #730cc4; color: white;">Action</th>
                                </tr>
                            </thead>
                            <tbody id="authorListTableItem">
                                <tr>
                                    <td>HK001</td>
                                    <td>J.K Rowling</td>
                                    <td>England</td>
                                    <td>Harry Potter</td>
                                </tr>
                                <tr>
                                    <td>HK002</td>
                                    <td>George R.R Martin</td>
                                    <td>Ireland</td>
                                    <td>Game of Thrones</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <br />


    <script>

        $(document).ready(function () {
            get_author();
            

        });

        function save_author() {
            var author_name = document.querySelector("#author_name").value;
            var country = document.querySelector("#country").value;
            var description = document.querySelector("#description").value;


            var formData = new FormData;
            formData.append("author_name",author_name);
            formData.append("country",country);
            formData.append("description",description);

            $.ajax({
                type: "POST",
                url: "https://localhost:44355/api/saveAuthor",
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    console.log("Its done bro");
                    console.log(response);
                    Swal.fire("Success", "Author added successfully!!", "success");
                },
                error: function (xhr) {
                    Swal.fire("Error", "Something went wrong", "error");
                }
            })

        }

        function get_author() {
            $.ajax({
                type: "GET",
                url: "https://localhost:44355/api/getAuthor",
                data: "",
                crossDomain: true,
                crossOrigin: true,
                success: function (response) {
                    $("#authorListTableItem").empty();

                    console.log(response);

                    $.each(response.Authors, function (index, value) {
                        var node = `<tr>
                                <td>${value.author_id}</td>
                                <td>${value.author_name}</td>
                                <td>${value.country}</td>
                                <td>${value.description}</td>
                                <td><button class="form-control btn btn-primary mb-2" id="editAuthor" onclick="editAuthor()">Edit</button>
                                    <button class="form-control btn btn-danger" id="deleteAuthor" onclick="deleteAuthor()">Delete</button>
                                </td>
                            <tr>`

                        $("#authorListTableItem").append(node);
                    });
                },
                error: function (request, status, error) {
                    console.log(error);

                }
            });
        }
            
    </script>
</asp:Content>
