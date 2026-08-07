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
                                <h4>Books Details</h4>
                            </center>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-4">
                                <label>Book ID</label>
                                <div class="input-group">
                                    <input type="text" placeholder="Book ID" class="form-control"/>
                                    <button class="btn btn-login btn-sm">Go</button>
                                </div>

                            </div>
                            <div class="col-8">
                                <label>Book Name</label>
                                <input type="text" placeholder="Book Name" class="form-control"/>
                            </div>
                        </div>
                        <br />
                        
                        <div class="row">
                            <div class="col-8">
                                <div class="row">
                                    <div class="col-6">
                                        <label>Language</label>
                                        <select class="form-control">
                                            <option selected value="0">--Select Language--</option>
                                            <option value="1">English</option>
                                            <option value="2">Hindi</option>
                                            <option value="3">Urdu</option>
                                            <option value="4">Tamil</option>
                                            <option value="5">French</option>
                                            <option value="6">Bengali</option>
                                            <option value="7">German</option>
                                            <option value="8">Latin</option>
                                        </select>
                                    </div>
                                    <div class="col-6">
                                        <label>Author Name</label>
                                        <input type="text" placeholder="Book Name" class="form-control"/>
                                    </div>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col-6">
                                        <label>Publisher Name</label>
                                        <input type="text" class="form-control" placeholder="Enter Publisher"/>
                                    </div>
                                    <div class="col-6">
                                        <label>Publish Date</label>
                                        <input type="date" class="form-control"/>
                                    </div>
                                </div>
                            </div>

                            <%--later change it to multiple selection dropdown - tags--%>
                            <div class="col-4">
                                <label>Select Genre</label>
                                    <asp:ListBox ID="ListBox1" class="form-control" runat="server" SelectionMode="Multiple">
                                        <asp:ListItem>Science Fiction</asp:ListItem>
                                        <asp:ListItem>Fantasy</asp:ListItem>
                                        <asp:ListItem>Mystery</asp:ListItem>
                                        <asp:ListItem>Thriller</asp:ListItem>
                                        <asp:ListItem>Historical Fiction</asp:ListItem>
                                        <asp:ListItem>Romance</asp:ListItem>
                                        <asp:ListItem>Horror</asp:ListItem>
                                        <asp:ListItem>Biography</asp:ListItem>
                                        <asp:ListItem>Self-Help</asp:ListItem>
                                        <asp:ListItem>Autobiography</asp:ListItem>
                                        <asp:ListItem>Poetry</asp:ListItem>
                                        <asp:ListItem>Classic</asp:ListItem>
                                        <asp:ListItem>Adventure</asp:ListItem>
                                    </asp:ListBox>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-4">
                                <label>Edition</label>
                                <input type="text" placeholder="Enter edition" class="form-control"/>
                            </div>
                            <div class="col-4">
                                <label>Book Cost</label>
                                <input type="number" placeholder="Enter cost" class="form-control"/>
                            </div>
                            <div class="col-4">
                                <label>Pages</label>
                                <input type="number" placeholder="Enter pages" class="form-control"/>
                            </div>
                        </div>
                        <br />
                        
                        <div class="row">
                            <div class="col-4">
                                <label>Total Stock</label>
                                <input type="number" placeholder="Total Stock" class="form-control"/>
                            </div>
                            <div class="col-4">
                                <label>Current Stock</label>
                                <input type="number" placeholder="Current stock" class="form-control"/>
                            </div>
                            <div class="col-4">
                                <label>Issued Books</label>
                                <input type="number" placeholder="Issued books" class="form-control"/>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-12">
                                <label>Description</label>
                                <textarea class="form-control" placeholder="Enter description..."></textarea>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-12">
                                <label>Upload File</label>
                                <input type="file" class="form-control" />
                            </div>
                        </div>
                        <br />

                        <div class="row mx-auto">
                            <div class="col-6">
                                <button class="btn btn-outline-danger w-100">Cancel</button>
                            </div>
                            <div class="col-6">
                                <button class="btn btn-success w-100">Add</button>
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
                                <h4>Book Inventory List</h4>
                            </center>
                        </div>
                        <hr />
                    </div>
                    <div class="col">
                        <table class="table table-bordered" id="issueTable">
                            <thead>
                                <tr>
                                    <th style="background-color: #730cc4; color: white;">Book Id</th>
                                    <th style="background-color: #730cc4; color: white;">Book Description</th>
                                    
                                </tr>
                            </thead>
                            <tbody id="issueTableItem">
                                
                                <tr>
                                    <td class="align-middle fw-bold text-center" style="width: 80px;">HBK001</td>
                                    <td>
                                        <div class="d-flex justify-content-between align-start">
                                            <!-- Left Side: Book Title, Metadata, and Description -->
                                            <div>
                                                <h5 class="fw-bold text-dark mb-1">The song of Fire and Ice</h5>
                                                <p class="text-muted small mb-1">
                                                    <strong>Author -</strong> George R.R Martin &nbsp;|&nbsp; 
                                                    <strong>Genre -</strong> Adventure, Fantasy &nbsp;|&nbsp; 
                                                    <strong>Language -</strong> English
                                                </p>
                                                <p class="text-muted small mb-1">
                                                    <strong>Publisher -</strong> Game of Thrones &nbsp;|&nbsp; 
                                                    <strong>Publish Date -</strong> 14-01-2012 &nbsp;|&nbsp; 
                                                    <strong>Pages -</strong> 1200 &nbsp;|&nbsp; 
                                                    <strong>Edition -</strong> 2nd
                                                </p>
                                                <p class="text-muted small mb-1">
                                                    <strong>Cost -</strong> 1200 &nbsp;|&nbsp; 
                                                    <strong>Actual Stock -</strong> 12 &nbsp;|&nbsp; 
                                                    <strong>Available -</strong> <span class="text-success fw-bold">2</span>
                                                </p>
                                                <p class="small text-secondary fst-italic mt-2 mb-0">
                                                    <strong>Description -</strong> Game of Thrones Spoilers
                                                </p>
                                            </div>

                                            <!-- Right Side: Book Cover Image -->
                                            <div class="ms-3 flex-shrink-0">
                                                <img src="imgs/Book1poster.jpeg" alt="Book Cover" class="img-thumbnail shadow-sm" style="width: 90px; height: 130px; object-fit: cover;"/>
                                            </div>
                                        </div>
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

</asp:Content>
