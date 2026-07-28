<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="Library_Management.adminauthormanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                        <table class="table table-bordered" id="issueTable">
                            <thead>
                                <tr>
                                    <th style="background-color: #730cc4; color: white;">Member Id</th>
                                    <th style="background-color: #730cc4; color: white;">Member Name</th>
                                    <th style="background-color: #730cc4; color: white;">Account Status</th>
                                    <th style="background-color: #730cc4; color: white;">Contact</th>
                                    <th style="background-color: #730cc4; color: white;">Email</th>
                                    <th style="background-color: #730cc4; color: white;">City</th>
                                    <th style="background-color: #730cc4; color: white;">State</th>
                                    <th style="background-color: #730cc4; color: white;">Action</th>
                                    <%--EDIT - WILL OPEN MODAL FOR EDITING WITH FULL INFO
                                    DELETE - WILL OPEN A MODAL FOR CONFIRMATION--%>
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
                                    <td>111001</td>
                                    <td class="text-center gap-2">
                                        <span class="d-flex flex-column gap-2">
                                            <button class="form-control">Edit</button>
                                            <button class="form-control btn-danger btn">Delete</button>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>HK002</td>
                                    <td>George R.R Martin</td>
                                    <td>BK002</td>
                                    <td>Song of Fire and Ice</td>
                                    <td>2026-06-01</td>
                                    <td>2026-06-01</td>
                                    <td>110011</td>
                                    <td class="text-center">
                                        <span class="d-flex flex-column gap-2">
                                            <button class="form-control">Edit</button>
                                            <button class="form-control btn-danger btn">Delete</button>
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
    <br />
</asp:Content>
