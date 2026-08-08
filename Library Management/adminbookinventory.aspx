<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="Library_Management.adminauthormanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                <h4>Books Details</h4>
                            </center>
                        </div>
                        <hr />
                            <div class="row">
                                <div class="col-12">
                                    <label class="fw-semibold">Book Name</label>
                                    <input type="text" placeholder="Book Name" class="form-control" name="bookName"/>
                                    <span class="error" id = "bookNameError" name = "bookNameError"></span>
                                </div>
                            </div>
                            <br />
                        
                            <div class="row">
                                <div class="col-8">
                                    <div class="row">
                                        <div class="col-6">
                                            <label>Language</label>
                                            <select class="form-control" name="language">
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
                                            <span class="error" id = "language" name = "language"></span>
                                        </div>
                                        <div class="col-6">
                                            <label>Author Name</label>
                                            <input type="text" placeholder="Author Name" class="form-control" name="authorName"/>
                                            <span class="error" id = "authorNameError" name = "authorNameError"></span>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="col-6">
                                            <label>Publisher Name</label>
                                            <input type="text" class="form-control" placeholder="Enter Publisher" name="publisher"/>
                                            <span class="error" id = "publisherError" name = "publisherError"></span>
                                        </div>
                                        <div class="col-6">
                                            <label>Publish Date</label>
                                            <input type="date" class="form-control" name="publisherDate"/>
                                            <span class="error" id = "publisherDateError" name = "publisherDateError"></span>
                                        </div>
                                    </div>
                                </div>

                                <%--later change it to multiple selection dropdown - tags--%>
                                <div class="col-4">
                                    <label>Select Genre</label>
                                        <asp:ListBox id="genre" class="form-control" runat="server" SelectionMode="Multiple" >
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
                                    <input type="text" placeholder="Enter edition" class="form-control" name="edition"/>
                                    <span class="error" id = "editionError" name = "editionError"></span>
                                </div>
                                <div class="col-4">
                                    <label>Book Cost</label>
                                    <input type="number" placeholder="Enter cost" class="form-control" name="bookCost"/>
                                    <span class="error" id = "bookCostError" name = "bookCostError"></span>
                                </div>
                                <div class="col-4">
                                    <label>Pages</label>
                                    <input type="number" placeholder="Enter pages" class="form-control" name="pages"/>
                                    <span class="error" id = "pagesError" name = "pagesError"></span>
                                </div>
                            </div>
                            <br />
                        
                            <div class="row">
                                <div class="col-4">
                                    <label>Total Stock</label>
                                    <input type="number" placeholder="Total Stock" class="form-control" name="totalStock"/>
                                    <span class="error" id = "totalStockError" name = "totalStockError"></span>
                                </div>
                                <div class="col-4">
                                    <label>Current Stock</label>
                                    <input type="number" placeholder="Current stock" class="form-control" name="currentStock"/>
                                    <span class="error" id = "currentStockError" name = "currentStockError"></span>
                                </div>
                                <div class="col-4">
                                    <label>Issued Books</label>
                                    <input type="number" placeholder="Issued books" class="form-control" name="issuedStock"/>
                                    <span class="error" id = "issuedStockError" name = "issuedStockError"></span>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-12">
                                    <label>Description</label>
                                    <textarea class="form-control" placeholder="Enter description..." name="description"></textarea>
                                </div>
                            </div>
                            <br />

                            <div class="row">
                                <div class="col-12">
                                    <label>Upload File</label>
                                    <input type="file" class="form-control" name="file"/>
                                    <span class="error" id = "fileError" name = "fileError"></span>
                                </div>
                            </div>
                            <br />

                            <div class="row mx-auto">
                                <div class="col-6">
                                    <button class="btn btn-outline-danger w-100">Cancel</button>
                                </div>
                                <div class="col-6">
                                    <button type="button" class="btn btn-success w-100" onclick="save_book()">Add</button>
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

    <script>

        function setError(id, message) {
            document.getElementById(id).textContent = message;
        }

        function save_book() {
            var bookName = document.querySelector('[name="bookName"]').value.trim();
            var language = document.querySelector('[name="language"]').value.trim();
            var authorName = document.querySelector('[name="authorName"]').value.trim();
            var publisher = document.querySelector('[name="publisher"]').value.trim();
            var publishDate = document.querySelector('[name="publisherDate"]').value.trim();
            var edition = document.querySelector('[name="edition"]').value.trim();
            var bookCost = document.querySelector('[name="bookCost"]').value.trim();
            var pages = document.querySelector('[name="pages"]').value.trim();
            var totalStock = document.querySelector('[name="totalStock"]').value.trim();
            var currentStock = document.querySelector('[name="currentStock"]').value.trim();
            var issuedStock = document.querySelector('[name="issuedStock"]').value.trim();
            //var description = document.querySelector('[name="=description"]').value.trim();

            let chk =
                (!bookName) ? 0 :
                    (!language) ? 1 :
                        (!authorName) ? 2 :
                            (!publisher) ? 3 :
                                (!publishDate) ? 4 :
                                    (!edition) ? 5 :
                                        (!bookCost) ? 6 :
                                            (!pages) ? 7 :
                                                (!totalStock) ? 8 :
                                                    (!currentStock) ? 9 :
                                                        (!issuedStock) ? 10 :

                                                            11;
            switch (chk) {
                case 0:
                    setError("bookNameError", "*Book Name cannot be empty");
                    return;
                case 1:
                    setError("languageError", "*Language cannot be empty");
                    return;
                case 2:
                    setError("authorNameError", "*Author name cannot be empty");
                    return;
                case 3:
                    setError("publisherError", "*Publisher cannot be empty");
                    return;
                case 4:
                    setError("publisherDateError", "*Publish Date cannot be empty");
                    return;
                case 5:
                    setError("editionError", "*Edition cannot be empty");
                    return;
                case 6:
                    setError("bookCostError", "*Book Cost cannot be empty");
                    return;
                case 7:
                    setError("pagesError", "*Pages cannot be empty");
                    return;
                case 8:
                    setError("totalStockError", "*Total Stock cannot be empty");
                    return;
                case 9:
                    setError("currentStockError", "*Current Stock cannot be empty");
                    return;
                case 10:
                    setError("issuedStockError", "*Issued Stock cannot be empty");
                    return;
                
                  
            }

            var form = document.getElementById("form1");
            var data = new FormData(form);
            console.log(form);

            $.ajax({
                type: "POST",
                url: "https://localhost:44355/api/saveBook",
                data: data,
                contentType: false,
                processData: false,
                success: function (response) {
                    console.log(response);
                    Swal.fire("Success", "Successfully Signed up!", "success");
                },
                error: function (request, status, error) {
                    console.log(error);

                }
            })
            
        }


    </script>

</asp:Content>
