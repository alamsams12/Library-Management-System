<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="Library_Management.userprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br /><br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-5 ">
                <div class="card">
                    <div class="card-body">
                        <div class="col">
                            <center>
                                <img src="imgs/user.png" width ="150px"/>
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <h4>User Profile</h4>
                            </center>
                        </div>
                        <hr />
                        <div class ="row">
                            <div class="col-md-6">
                                    <label>Full Name</label>
                                    <input type="text" placeholder="Full Name" class="form-control"/>
                            </div>
                            <div class="col-md-6">
                                    <label>Date of Birth</label>
                                    <input type="date"  class="form-control"/>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-md-6">
                                    <label>Contact No.</label>
                                    <input type="text" placeholder="Contact No." class="form-control"/>
                            </div>
                            <div class="col-md-6">
                                    <label>Email ID</label>
                                    <input type="email" placeholder="Email ID" class="form-control"/>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-md-4">
                                    <label>State</label>
                                    <select class="form-select">
                                        <option selected>--Select State--</option>
                                    </select>
                            </div>
                            <div class="col-md-4">
                                    <label>City</label>
                                    <input type="text" placeholder="City" class="form-control"/>
                            </div>
                            <div class="col-md-4">
                                    <label>Pin Code</label>
                                    <input type="text" placeholder="Pin Code" class="form-control"/>
                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <label>Full Address</label>
                                <textarea class="form-control" placeholder="Enter address here...."></textarea>
                            </div>
                        </div>
                        
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <label>User ID</label>
                                <input type="text" class="form-control" placeholder="Set User ID"/>
                            </div>
                            <div class="col-md-4">
                                <label>Password</label>
                                <input type="password" class="form-control" placeholder="Enter password"/>
                            </div>
                            <div class="col-md-4">
                                <label>New Password</label>
                                <input type="password" class="form-control" placeholder="Enter password"/>
                            </div>
                        </div>

                        <br />
                        <asp:Button ID="userProfileUpdate" runat="server" CssClass="btn btn-login w-100" Text="Update" />

                    </div>
                </div>
                <br />
                <a href="homepage.aspx"> <-Back to Home </a>
            </div>
            
            <div class="col-7">
                <div class="card">
                    <div class="card-body">
                        <div class="col">
                            <center>
                                <img src="imgs/books.png" width="150px"/>
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <h4>Your Issued Books</h4>
                            </center>
                        </div>
                        <hr />
                    </div>
                    <div class="col">
                        <table class="table" id="issuedBooksTable">
                            <thead>
                                <tr>
                                    <th style="background-color: #730cc4; color: white;">Author Id</th>
                                    <th style="background-color: #730cc4; color: white;">Book Name</th>
                                    <th style="background-color: #730cc4; color: white;">Author Name</th>
                                </tr>
                            </thead>
                            <tbody id="issuedBooks">
                                <tr>
                                    <td>HK001</td>
                                    <td>Harry Potter: Chamber of Secrets</td>
                                    <td>J.K Rowling</td>
                                </tr>
                                <tr>
                                    <td>HK002</td>
                                    <td>Song of Fire and Ice</td>
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
