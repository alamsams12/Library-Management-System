<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="Library_Management.adminauthormanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                <label>Member ID</label>
                                <input type="text" placeholder="Member ID" class="form-control"/>
                            </div>
                            <div class="col-7">
                                <label>Book ID</label>
                                <div class="input-group">
                                    <input type="text" placeholder="Book ID" class="form-control"/>
                                    <button class="btn btn-login btn-sm">Go</button>
                                </div>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-5">
                                <label>Member Name</label>
                                <input type="text" placeholder="Member Name" class="form-control" id="memberName"/>
                            </div>
                            <div class="col-7">
                                <label>Book Name</label>
                                <input type="text" placeholder="Book Name" class="form-control"/>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-5">
                                <label>Start Date</label>
                                <input type="date" class="form-control"/>
                            </div>
                            <div class="col-7">
                                <label>End Date</label>
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

        

    </script>
</asp:Content>
