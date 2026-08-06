<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="Library_Management.adminauthormanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css" />
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br /><br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="col">
                            <center>
                                <img src="imgs/user.png" width="150px"/>
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <h4>Member Details</h4>
                            </center>
                        </div>
                        <hr />

                        <%--search bar for searching will show dropdown on searching--%>
                        <div class="col-10 mx-auto">
                            <div class="input-group">
                                <input type="text" class="form-control" style="border-color:#979797" placeholder="Enter Name.."/>
                                <button class="btn" style="border-color:#979797"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                        
                    </div>
                </div>
               
            </div>
        </div>
    </div>
    <br />

    <div class="container-fluid">
        <div class="row">
            <div class="col-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="col">
                            <center>
                                <h4>Member Table</h4>
                            </center>
                        </div>
                        <hr />
                        <div class="col-4">
                            <%--filter to sort on basis of the status--%>
                            <label>Status</label>
                            <select class="form-select">
                                <option selected value="0">-Select Status-</option>
                                <option  value="1">Active</option>
                                <option  value="2">Pending</option>
                            </select>
                        </div>
                    </div>
                    <%--first show full table of members and after seacrch show only result--%>
                    <div class="col">
                        <table class="table table-bordered" id="userTable">
                            <thead>
                                <tr>
                                    <th style="background-color: #730cc4; color: white;">Member Id</th>
                                    <th style="background-color: #730cc4; color: white;">Member Name</th>
                                    <th style="background-color: #730cc4; color: white;">Account Age</th>
                                    <th style="background-color: #730cc4; color: white;">Action</th>
                                    
                                    <%--EDIT - WILL OPEN MODAL FOR EDITING WITH FULL INFO
                                    DELETE - WILL OPEN A MODAL FOR CONFIRMATION--%>
                                </tr>
                            </thead>
                            <tbody id="userTableItem">
                                <tr>
                                    <td>HK001</td>
                                    <td>J.K Rowling</td>
                                    <td>Active</td>
                                    <td class="text-center gap-2">
                                        <span class="d-flex flex-column gap-2">
                                            <button type="button" class="form-control" onclick="editUserModal()">Edit</button>
                                            <button type="button" class="form-control btn-danger btn" onclick="openDeleteModal()">Delete</button>
                                        </span>
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>
                    <a href="homepage.aspx"> <-Back to Home </a>
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

    <div class="modal-backdrop-g">
        <div class="modal modal-dialog-centered modal-xl openEditModal" id="openEditModal" tabindex="-1"  aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content shadow-lg border-0">

                    <!-- Header -->
                    <div class="modal-header">
                        <div class="modal-title mx-auto"><h5>Edit Member Information</h5></div>
                    </div>

                    <div class="modal-body px-4 py-3">
                        <div>
                            <label class="fw-semibold">Member ID</label>
                            <input type="text" class="form-control" id="member_id" readonly />
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label class="fw-semibold">Full Name</label>
                                <input type="text" class="form-control" id="name" readonly />
                            </div>
                            <div class="col-md-6">
                                <label class="fw-semibold">Email ID</label>
                                <input type="text" class="form-control" id="email" readonly />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label class="fw-semibold">Date of Birth</label>
                                <input type="text" class="form-control" id="dob" readonly />
                            </div>
                            <div class="col-md-6">
                                <label class="fw-semibold">Contact No.</label>
                                <input type="text" class="form-control" id="contact"  />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label class="fw-semibold">City</label>
                                <input type="text" class="form-control" id="city"  />
                            </div>
                            <div class="col-md-4">
                                <label class="fw-semibold">State</label>
                                <input type="text" class="form-control" id="state"  />
                            </div>
                            <div class="col-md-4">
                                <label class="fw-semibold">Pincode</label>
                                <input type="text" class="form-control" id="pincode"  />
                            </div>
                        </div>

                        <div>
                            <label class="fw-semibold">Full Address</label>
                            <textarea class="form-control" id="address" ></textarea>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label class="fw-semibold">Account Age</label>
                                <input type="text" class="form-control" id="accountage" readonly />
                            </div>
                            <div class="col-md-8">
                                <label class="fw-semibold">Account Status</label>
                                <select id="status" class="form-select">
                                    <option selected value="Pending">Peding</option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div class="modal-footer bg-light px-4 py-3">
                        <div class="row w-100 g-2">
                            <div class="col-md-6">
                                <button type="button" class="btn btn-outline-secondary w-100" onclick="closeThisModal(this)">Cancel</button>
                            </div>
                            <div class="col-md-6">
                                <button type="button" class="btn btn-success w-100" onclick="editUser()">Save Changes</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {
            get_user();
        });

        function openDeleteModal() {
            /*deleteID = id;*/
            //console.log("deleteID", id);
            $(".modal.openDeleteModal").show();
            $(".modal.openDeleteModal").addClass("show");
            $(".modal-backdrop-g").show();
            $('body').css('overflow', 'hidden');
        }

        var currentRow = null;
        function openEditModal(el, member_id,  full_name,  dob,  contact_no,  email,  city,  state,  pincode,  full_address,  account_age) {
            currentRow = el;
            $("#member_id").val(member_id);
            $("#name").val(full_name);
            $("#dob").val(dob);
            $("#contact").val(contact_no);
            $("#email").val(email);
            $("#city").val(city);
            $("#state").val(state);
            $("#pincode").val(pincode);
            $("#address").val(full_address);
            $("#accountage").val(account_age);

            $(".modal.openEditModal").show();
            $(".modal.openEditModal").addClass("show");
            $(".modal-backdrop-g").show();
            $('body').css('overflow', 'hidden');
        }

        function closeThisModal(el) {
            $(el).parents(".modal").hide();
            $(el).parents(".modal").removeClass("show");
            $(".modal-backdrop-g").hide();
            $('body').css("overflow", "auto");
        }

        
        function get_user() {

            $.ajax({
                type: "GET",
                url: "https://localhost:44355/api/getUser",
                data: "",
                processData: false,
                contentType: false,
                success: function (response) {
                    console.log(response);
                    $("#userTableItem").empty();

                    $.each(response.Users, function (index, value) {
                        var node = `<tr>
                            <td>${value.member_id}</td>
                            <td>${value.full_name}</td>
                            <td>${value.account_age}</td>
                            <td>
                                <button type="button" class="form-control btn btn-sm btn-primary mb-2" onclick="openEditModal(this,
                                                                                 '${value.member_id}','${value.full_name}','${value.dob}','${value.contact_no}',
                                                                            '${value.email}','${value.city}','${value.state}','${value.pincode}','${value.full_address}',
                                                                        '${value.account_age}','${value.account_status}'
                                                                                )"
                                >Edit</button>
                                <button type="button" class="form-control btn-danger btn btn-sm" onclick="openDeleteModal('${value.member_id}')">Delete</button>
                            </td>
                        </tr>`

                        $("#userTableItem").append(node);
                    });
                },
                error: function (request, status, error) {
                    console.log(error);

                }
            })
        }

    </script>

</asp:Content>
