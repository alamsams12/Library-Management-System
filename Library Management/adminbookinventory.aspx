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
                                    <td>HK001</td>
                                    <td>Experience the complete journey of Indian Classical Fusion — Soul of Raag, Power of Raag, and Blend of Raag — all in one soulful jukebox.
                                            A trilogy that celebrates our roots, emotions, and musical depth.

                                            Created by Sunix Thakor & Sagar Swarup, this is Series of Raag — an experience that connects tradition with modern sound.
                                            Let the Raag flow through your soul. 🌸
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td>HK002</td>
                                    <td>Experience the complete journey of Indian Classical Fusion — Soul of Raag, Power of Raag, and Blend of Raag — all in one soulful jukebox.
                                            A trilogy that celebrates our roots, emotions, and musical depth.

                                            Created by Sunix Thakor & Sagar Swarup, this is Series of Raag — an experience that connects tradition with modern sound.
                                            Let the Raag flow through your soul. 🌸
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
