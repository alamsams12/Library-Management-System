<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="Library_Management.adminauthormanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

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
                                <div class="col">
                                    <div class="row">
                                        <div class="col-6">
                                            <label>Language</label>
                                            <select class="form-control" name="language">
                                                <option selected value="0">--Select Language--</option>
                                                <option value="english">English</option>
                                                <option value="hindi">Hindi</option>
                                                <option value="urdu">Urdu</option>
                                                <option value="tamil">Tamil</option>
                                                <option value="french">French</option>
                                                <option value="bengali">Bengali</option>
                                                <option value="german">German</option>
                                                <option value="latin">Latin</option>
                                            </select>
                                            <span class="error" id = "language" name = "language"></span>
                                        </div>
                                        <div class="col-6">
                                            <label>Author Name</label>
                                            <input type="text" placeholder="Author Name" class="form-control" name="authorName"/>
                                            <span class="error" id = "authorNameError" name = "authorNameError"></span>
                                        </div>
                                    </div>
                                    <label>Select Genre</label>
                                    <select id="genre" name="genre" class="form-control" multiple>
                                        <option value="Science Fiction">Science Fiction</option>
                                        <option value="Fantasy">Fantasy</option>
                                        <option value="Mystery">Mystery</option>
                                        <option value="Thriller">Thriller</option>
                                        <option value="Historical Fiction">Historical Fiction</option>
                                        <option value="Romance">Romance</option>
                                        <option value="Horror">Horror</option>
                                        <option value="Biography">Biography</option>
                                        <option value="Self-Help">Self-Help</option>
                                        <option value="Autobiography">Autobiography</option>
                                        <option value="Poetry">Poetry</option>
                                        <option value="Classic">Classic</option>
                                        <option value="Adventure">Adventure</option>
                                    </select>
                                    <br />
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

                        <label class="fw-semibold">Enter book name or ID</label>
                        <div class="col input-group">
                            <input type="text" class="form-control" />
                            <button class="btn" style="border-color:#979797"><i class="fa fa-search"></i></button>
                        </div>

                        <hr />
                    </div>
                    <div class="col">
                        <table class="table table-bordered" id="bookTable">
                            <thead>
                                <tr>
                                    <th style="background-color: #730cc4; color: white;">Book Id</th>
                                    <th style="background-color: #730cc4; color: white;">Book Description</th>
                                    <th style="background-color: #730cc4; color: white;">Action </th>
                                    
                                </tr>
                            </thead>
                            <tbody id="bookTableItem">
                                
                                <tr>
                                    <td class="align-middle fw-bold text-center" style="width: 80px;">01</td>
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

        $(document).ready(function () {
            $("#genre").select2({
                placeholder: "Select Genre",
                width: "100%"
            });
            get_book();
        });


        function setError(id, message) {
            document.getElementById(id).textContent = message;
        }

        function save_book() {
            var bookName = document.querySelector('[name="bookName"]').value.trim();
            var language = document.querySelector('[name="language"]').value.trim();
            var genre = $("#genre").val().join(",");
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

            data.set("genre", genre);

            console.log("Genre:", genre);
            console.log(form);

            $.ajax({
                type: "POST",
                url: "https://localhost:44355/api/saveBook",
                data: data,
                contentType: false,
                processData: false,
                success: function (response) {
                    console.log(response);
                    Swal.fire("Success", "Successfully Saved!", "success");
                    document.getElementById("form1").reset();
                    docuemnt.getElementById("genre").reset();

                },
                error: function (request, status, error) {
                    Swal.fire("Error", "Something went wrong!", "error");

                }
            })
            
        }

        function get_book() {

            $.ajax({
                type: "GET",
                url: "https://localhost:44355/api/getBook",
                data: "",
                processData: false,
                contentType: false,
                success: function (response) {
                    console.log(response);
                    $("#bookTableItem").empty();

                    $.each(response.Books, function (index, value) {
                        var node =
                            `<tr>
                                <td class="align-middle fw-bold text-center" style="width: 80px;">${value.book_id}</td>
                                <td>
                                    <div class="d-flex justify-content-between align-start">
                                        <!-- Left Side: Book Title, Metadata, and Description -->
                                        <div>
                                            <h5 class="fw-bold text-dark mb-1">${value.book_name}</h5>
                                            <p class="text-muted small mb-1">
                                                <strong>Author -</strong> ${value.author_name} &nbsp;|&nbsp;
                                                <strong>Genre -</strong> ${value.genre} &nbsp;|&nbsp;
                                                <strong>Language -</strong> ${value.language}
                                            </p>
                                            <p class="text-muted small mb-1">
                                                <strong>Publisher -</strong> ${value.publisher_name} &nbsp;|&nbsp;
                                                <strong>Publish Date -</strong> ${value.publish_date ? value.publish_date.split('T')[0] : ''} &nbsp;|&nbsp;
                                                <strong>Pages -</strong> ${value.no_of_pages} &nbsp;|&nbsp;
                                            </p>
                                            <p class="text-muted small mb-1"><strong>Edition -</strong> ${value.edition}</p>
                                            <p class="text-muted small mb-1">
                                                <strong>Cost -</strong> ${value.book_cost} &nbsp;|&nbsp;
                                                <strong>Actual Stock -</strong> ${value.actual_stock} &nbsp;|&nbsp;
                                                <strong>Available -</strong> <span class="text-success fw-bold">${value.current_stock}</span>
                                            </p>
                                            <p class="small text-secondary fst-italic mt-2 mb-0">
                                                <strong>Description -</strong> ${value.book_description}
                                            </p>
                                        </div>

                                        <!-- Right Side: Book Cover Image -->
                                        <div class="ms-3 flex-shrink-0">
                                            <img src="${value.book_img_link}" alt="Book Cover" class="img-thumbnail shadow-sm" style="width: 90px; height: 130px; object-fit: cover;">
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-primary w-100 mb-2">Edit</button>
                                    <button type="button" class="btn btn-danger w-100">Delete</button>
                            </tr>`
                        $("#bookTableItem").append(node);
                    });
                    

                },
                error: function () {
                    Swal.fire("Error", "Something went wrong!", "error");
                }
            })
        }

    </script>

</asp:Content>
