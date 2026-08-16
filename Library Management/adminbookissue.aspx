<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="Library_Management.adminbookissue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
     <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br /><br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-5 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="col">
                            <center>
                                <img src="imgs/books.png" width="150px"/>
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <h4>Books Isssuing</h4>
                            </center>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-5">
                                <label class="fw-semibold">Member Name</label>
                                <div class="input-group">
                                    <input type="text" placeholder="Member Name" class="form-control" id="memberName" onkeyup="searchMember()"/>
                                    <div id="search_popup_member" style="display: none; border: 1px solid #ebebeb;  overflow-y: auto; position: absolute; width: 100%; background: white; z-index: 10; top: 43px;">
                                        <ul id="search_member">
                                
                                        </ul>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="col-7">
                                <label class="fw-semibold">Book Name</label>
                                <div class="input-group">
                                    <input type="text" placeholder="Book Name" class="form-control" id="bookName" onkeyup="searchBook()"/>
                                    <button class="btn btn-login btn-sm">Go</button>
                                    <div id="search_popup_root" style="display: none; border: 1px solid #ebebeb;  overflow-y: auto; position: absolute; width: 100%; background: white; z-index: 10; top: 43px;">
                                        <ul id="search_popup">
                                
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-5">
                                <label class="fw-semibold">Member ID</label>
                                <input type="text"  class="form-control" id="memberID" readonly/>
                            </div>
                            <div class="col-7">
                                <label class="fw-semibold">Book Id</label>
                                <input type="text"  class="form-control" id="bookID" readonly/>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-5">
                                <label class="fw-semibold">Start Date</label>
                                <input type="date" class="form-control"/>
                            </div>
                            <div class="col-7">
                                <label class="fw-semibold">End Date</label>
                                <input type="date"class="form-control"/>
                            </div>
                        </div>
                        <br /><br />

                        <div class="row mx-auto">
                            <div class="col-6">
                                <button class="btn btn-outline-success w-100">Issue</button>
                            </div>
                            <div class="col-6">
                                <button class="btn btn-outline-primary w-100">Return</button>
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
                                <img src="imgs/book%20issue.png" width="150px"/>
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <h4>Issued Book List</h4>
                            </center>
                        </div>
                        <hr />
                    </div>
                    <div class="col">
                        <table class="table table-bordered" id="issueTable">
                            <thead>
                                <tr>
                                    <th style="background-color: #730cc4; color: white;">Member Id</th>
                                    <th style="background-color: #730cc4; color: white;">Member Name</th>
                                    <th style="background-color: #730cc4; color: white;">Book ID</th>
                                    <th style="background-color: #730cc4; color: white;">Book Name</th>
                                    <th style="background-color: #730cc4; color: white;">Issue Date</th>
                                    <th style="background-color: #730cc4; color: white;">End Date</th>
                                    <th style="background-color: #730cc4; color: white;">Status</th>
                                </tr>
                            </thead>
                            <tbody id="issueTableItem">
                                <tr>
                                    <td>HK001</td>
                                    <td>J.K Rowling</td>
                                    <td>BK001</td>
                                    <td>Harry Potter and The Chamber of Secrets</td>
                                    <td>2026-06-01</td>
                                    <td>2026-07-01</td>
                                    <td class="returned text-center">
                                        <button class="w-100 form-control">View</button>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td>HK002</td>
                                    <td>George R.R Martin</td>
                                    <td>BK002</td>
                                    <td>Song of Fire and Ice</td>
                                    <td>2026-06-01</td>
                                    <td>2026-06-01</td>
                                    <td class="pending text-center">
                                        <span class="d-flex flex-column gap-2">
                                            <button class="form-control">Returned</button>
                                            <button class="form-control">View</button>
                                        </span>
                                    </td>
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

        var currentSearch = "";

        function searchBook() {
            var term = $("#bookName").val().trim();

            if (term.length === 0) {
                $("#search_popup_root").hide();
                if (currentSearch !== "") {
                    currentSearch = "";
                    // get_servicesVendor_contracts(1);
                }
                return;
            }

            $.ajax({
                type: "GET",
                url: `https://localhost:44355/api/searchBook?searchTerm=${term}`,
                success: function (response) {
                    var dropdown = $("#search_popup");
                    dropdown.empty();

                    console.log(response);

                    if (response.length > 0) {
                        $.each(response, function (index, value) {

                            var option = `<li onclick="selectSearchBook('${value.book_id}','${value.book_name}')" class="px-3 py-2 border-bottom" style="cursor: pointer; transition: background 0.2s;">
                                            <div style="display: flex; flex-direction: column; align-items: flex-start;">
                                                <span>${value.book_name}</span>
                                            </div>
                                        </li>`;
                            dropdown.append(option);
                        })
                        $("#search_popup_root").show();
                    } else {
                        $("#search_popup_root").hide();
                    }
                }

            })
        }

        function selectSearchBook(book_id,book_name) {

            $("#search_popup_root").hide();

            $("#bookID").val(book_id);
            $("#bookName").val(book_name);


        }

        function searchMember() {
            var term = $("#memberName").val().trim();

            if (term.length === 0) {
                $("#search_popup_member").hide();
                if (currentSearch !== "") {
                    currentSearch = "";
                }
                return;
            }
            $.ajax({
                type: "GET",
                url: `https://localhost:44355/api/searchMember?searchTerm=${term}`,
                success: function (response) {
                    var dropdown = $("#search_member");
                    dropdown.empty();

                    console.log(response);

                    if (response.length > 0) {
                        $.each(response, function (index, value) {

                            var option = `<li onclick="selectSearchMember('${value.member_id}','${value.full_name}')" class="px-3 py-2 border-bottom" style="cursor: pointer; transition: background 0.2s;">
                                            <div style="display: flex; flex-direction: column; align-items: flex-start;">
                                                    <span class="fw-semibold text-dark">${value.full_name}</span>
                                            </div>
                                        </li>`;
                            dropdown.append(option);
                        })
                        $("#search_popup_member").show();
                    } else {
                        $("#search_popup_member").hide();
                    }
                }

            })

        }

        function selectSearchMember(member_id, full_name) {

            $("#search_popup_member").hide();

            $("#memberID").val(member_id);
            $("#memberName").val(full_name);


        }

    </script>
</asp:Content>
