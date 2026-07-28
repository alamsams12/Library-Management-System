<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="Library_Management.viewbooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class ="col-md-10 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="col">
                            <center>
                                <img src="imgs/books.png" width="150px"/>
                            </center>
                            
                        </div>
                        <div class="col">
                            <center>
                                <h4>Books Inventory</h4>
                            </center>
                        </div>
                        <hr />
                        <div class="col-md-8 mx-auto">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Enter book name..." id="searchBook"/>
                                <button class="btn btn-login btn-sm">Go</button>
                            </div>
                        </div>
                        <br />
                        <div class="col">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Book ID</th>
                                        <th>Book Name</th>
                                        <th>Author Name</th>
                                        <th>Publications</th>
                                        <th>Edition</th>
                                        <th>No. of Pages</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>BK001</td>
                                        <td>Song of Fire and Ice</td>
                                        <td>George R.R Martin</td>
                                        <td>Game of Thornes</td>
                                        <td>13th</td>
                                        <td>2026</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
