<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="Library_Management.adminauthormanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                            <div class="col-4">
                                <label>Author ID</label>
                                <div class="input-group">
                                    <input type="text" placeholder="ID" class="form-control"/>
                                    <button class="btn btn-login">Go</button>
                                </div>
                            </div>
                            
                            <div class="col-6">
                                <label>Author Name</label>
                                <input type="text" placeholder="Author Name" class="form-control"/>
                            </div>
                        </div>
                        <br />

                        <div class="row mx-auto">
                            <div class="col-4">
                                <button class="btn btn-outline-success w-100">Add</button>
                            </div>
                            <div class="col-4">
                                <button class="btn btn-outline-primary w-100">Update</button>
                            </div>
                            <div class="col-4">
                                <button class="btn btn-outline-danger w-100">Delete</button>
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
                        <table class="table" id="authorListTable">
                            <thead>
                                <tr>
                                    <th style="background-color: #730cc4; color: white;">Author Id</th>
                                    <th style="background-color: #730cc4; color: white;">Author Name</th>
                                </tr>
                            </thead>
                            <tbody id="authorListTableItem">
                                <tr>
                                    <td>HK001</td>
                                    <td>J.K Rowling</td>
                                </tr>
                                <tr>
                                    <td>HK002</td>
                                    <td>George R.R Martin</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <br />

</asp:Content>
