<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="Library_Management.adminpublishermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" />
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

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
                                <img src="imgs/publisher.png" width="150px"/>
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <h4>Publisher Details</h4>
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
                                <input type="text" placeholder="Publisher Name" class="form-control" name="publisher_name" id="publisher_name"/>
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
                                <button type="button" class="btn btn-success w-100" onclick="save_publisher()">Add</button>
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
                        <%--<div class="col">
                            <center>
                                <img src="imgs/writer%20logo.png" width="150px"/>
                            </center>
                        </div>--%>
                        <div class="col">
                            <center>
                                <h4>Publisher List</h4>
                            </center>
                        </div>
                        <hr />
                    </div>
                    <div class="col">
                        <table class="table table-bordered" id="publisherListTable">
                            <thead>
                                <tr>
                                    <th style="background-color: #730cc4; color: white;">Publisher Id</th>
                                    <th style="background-color: #730cc4; color: white;">Publisher Name</th>
                                    <th style="background-color: #730cc4; color: white;">Country</th>
                                    <th style="background-color: #730cc4; color: white;">Description</th>
                                    <th style="background-color: #730cc4; color: white;">Action</th>
                                </tr>
                            </thead>
                            <tbody id="publisherListItem">
                                <%--<tr>
                                    <td>HK001</td>
                                    <td>J.K Rowling</td>
                                    <td>England</td>
                                    <td>Harry Potter</td>
                                    <td>
                                        <button type="button" class="btn btn-danger btn-sm" onclick ="openDeleteModal(id)">Delete</button>

                                    </td>
                                </tr>--%>
                                
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <br />

    <div class="modal-backdrop-g">
        <div class="modal modal-dialog-centered modal-xl openDeleteModal" id="openDeleteModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg ">
                <div class="modal-content shadow-lg border-0">

                    <!-- Header -->
                    <div class="modal-header">
                        <div class="mx-auto"><h5>Do you want to delete this entry?</h5></div>
                    </div>

                    <div class=" row modal-body mx-auto">
                        <div class="col-md-6">
                            <button type="button" class="btn btn-danger" onclick="deleteEntry()">Delete</button>
                        </div>
                        <div class="col-md-6">
                            <button type="button" class="btn btn-outline-primary" onclick="closeThisModal(this)">Cancel</button>
                        </div>
                    
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {
            get_publisher();

        });

        var deleteID;
        function openDeleteModal(id) {
            deleteID = id;
            console.log("deleteID", id);
            $(".modal.openDeleteModal").show();
            $(".modal.openDeleteModal").addClass("show");
            $(".modal-backdrop-g").show();
            $('body').css('overflow', 'hidden');
        }

        function closeThisModal(el) {
            $(el).parents(".modal").hide();
            $(el).parents(".modal").removeClass("show");
            $(".modal-backdrop-g").hide();
            $('body').css("overflow", "auto");
        }

        function save_publisher() {
                var publisher_name = document.querySelector("#publisher_name").value;
                var country = document.querySelector("#country").value;
                var description = document.querySelector("#description").value;


                var formData = new FormData;
                formData.append("publisher_name",publisher_name);
                formData.append("country",country);
                formData.append("description",description);

                $.ajax({
                    type: "POST",
                    url: "https://localhost:44355/api/savePublisher",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        console.log("Its done bro");
                        console.log(response);
                        get_publisher();
                        Swal.fire("Success", "Publisher added successfully!!", "success");
                    },
                    error: function (xhr) {
                        Swal.fire("Error", "Something went wrong", "error");
                    }
                })

        }

        function get_publisher() {
            $.ajax({
                type: "GET",
                url: "https://localhost:44355/api/getPublisher",
                data: "",
                crossDomain: true,
                crossOrigin: true,
                success: function (response) {

                    console.log(response);

                    $("#publisherListItem").empty();
                    $.each(response.Publishers, function (index, value) {


                        var node = `<tr>
                                <td>${value.publisher_id}</td>
                                <td>${value.publisher_name}</td>
                                <td>${value.country}</td>
                                <td>${value.description}</td>
                                <td>
                                    <button type="button" class="form-control btn btn-danger btn-sm mb-2" id="deletePublisher" onclick="openDeleteModal('${value.publisher_id}')">Delete</button>
                                    <button type="button" class="form-control btn btn-primary btn-sm" id="viewAuthor" onclick="viewPublisherModal()">View</button>
                                </td>
                            </tr>`

                        $("#publisherListItem").append(node);
                    });
                    $('#publisherListTable').DataTable();
                },
                error: function (request, status, error) {
                    console.log(error);

                }
            });
        }

        function deleteEntry() {

            var formdata = new FormData;
            formdata.append("publisher_id", deleteID);

            $.ajax({
                type: "POST",
                url: "https://localhost:44355/api/deletePublisher",
                data: formdata,
                processData: false,
                contentType: false,
                success: function (response) {
                    console.log(response);
                    closeThisModal(this);
                    swal.fire("Success", "Successfully Deleted", "success");
                    get_publisher();
                },
                error: function (xhr) {
                    Swal.fire("Error", "Something went wrong", "error");
                }
            })
        }

    </script>
</asp:Content>
