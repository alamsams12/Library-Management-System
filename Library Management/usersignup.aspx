<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="Library_Management.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
    
    <div class="container">
        <div class="row">
            <div class="col-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="col">
                            <center>
                                <img src="imgs/sign%20up.png" width="150px"/>
                            </center>
                        </div>
                        <div class="col">
                            <center>
                                <h4>User Registration</h4>
                            </center>
                        </div>
                        <hr />
                        <form id="usersignup">
                        <div class ="row">
                            <div class="col-md-6">
                                    <label>Full Name</label>
                                    <input type="text" placeholder="Full Name" class="form-control" id="name"/>
                                    <span class="error" id = "nameError" name = "nameError"></span>
                            </div>
                            <div class="col-md-6">
                                    <label>Date of Birth</label>
                                    <input type="text"  class="form-control" id="dob"/>
                                    <span class="error" id = "dobError" name = "dobError"></span>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-md-6">
                                    <label>Contact No.</label>
                                    <input type="text" placeholder="Contact No." class="form-control" id="contactno"/>
                                    <span class="error" id = "contactNoError" name = "contactNoError"></span>
                            </div>
                            <div class="col-md-6">
                                    <label>Email ID</label>
                                    <input type="email" placeholder="Email ID" class="form-control" id="email"/>
                                    <span class="error" id = "emailError" name = "emailError"></span>
                            </div>
                        </div>

                        <br />

                        <div class="row">
                            <div class="col-md-4">
                                    <label>State</label>
                                    <select class="form-select" id="state">
                                        <option selected value="0">--Select State--</option>
                                        <option value="1">New Delhi</option>
                                    </select>
                                    <span class="error" id = "stateError" name = "stateError"></span>
                            </div>
                            <div class="col-md-4">
                                    <label>City</label>
                                    <input type="text" placeholder="City" class="form-control" id="city"/>
                                    <span class="error" id = "cityError" name = "cityError"></span>
                            </div>
                            <div class="col-md-4">
                                    <label>Pin Code</label>
                                    <input type="text" placeholder="Pin Code" class="form-control" id="pincode"/>
                                    <span class="error" id = "pincodeError" name = "pincodeError"></span>
                            </div>
                        </div>

                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <label>Full Address</label>
                                <textarea class="form-control" placeholder="Enter address here...." id="address"></textarea>
                                <span class="error" id = "addressError" name = "addressError"></span>
                            </div>
                        </div>
                        
                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <label>User ID</label>
                                <input type="text" class="form-control" placeholder="Set User ID" id="userid"/>
                                <span class="error" id = "useridError" name = "useridError"></span>
                            </div>
                            <div class="col-md-6">
                                <label>Password</label>
                                <input type="password" class="form-control" placeholder="Enter password" id="password"/>
                                <span class="error" id = "passwordError" name = "passwordError"></span>
                            </div>
                        </div>
                        
                        <br />
                        <button class="btn btn-login w-100" id="save" onclick="validateForm()">Go</button>
                        </form>
                    </div>
                </div>
                <br />
                <a href="homepage.aspx"> <-Back to Home </a>
            </div>

        </div>
    </div>
    <br />

    <script>

        $("#pincode").on("input", function () {
            this.value = this.value.replace(/\D/g, "").slice(0, 6);
        });
        $("#contactno").on("input", function () {
            this.value = this.value.replace(/\D/g, "").slice(0, 10);
        });

        $(document).ready(function () {

            flatpickr("#dob", {
                dateFormat: "Y-m-d",   // value shown in the input AND stored
                altInput: false,       // single input, no hidden duplicate needed
                allowInput: true,      // user can still type the date manually
                minDate: "2000-01-01",
                maxDate: "today",
            });
        });

        function setError(id, message) {
            document.getElementById(id).textContent = message;
        }

        function validateForm() {
            window.event.preventDefault();

            var name = document.getElementById("name").value.trim();
            var dob = document.getElementById("dob").value.trim();
            var contactno = document.getElementById("contactno").value.trim();
            var email = document.getElementById("email").value.trim();
            var state = document.getElementById("state").value.trim();
            var city = document.getElementById("city").value.trim();
            var pincode = document.getElementById("pincode").value.trim();
            var address = document.getElementById("address").value.trim();
            var userid = document.getElementById("userid").value.trim();
            var password = document.getElementById("password").value.trim();


            const nameRegex = /^[A-Za-z ]+$/;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const dobShapeRegex = /^\d{4}-\d{2}-\d{2}$/;

            const dobDate = new Date(dob + "T00:00:00");
            const minDate = new Date("2000-01-01T00:00:00");
            const today = new Date();

            today.setHours(0, 0, 0, 0);

            setError("nameError", "");
            setError("dobError", "");
            setError("contactNoError", "");
            setError("emailError", "");
            setError("stateError", "");
            setError("cityError", "");
            setError("pincodeError", "");
            setError("addressError", "");
            setError("useridError", "");
            setError("passwordError", "");

            let chk =
                (!name) ? 0 :
                    (!nameRegex.test(name)) ? 1 :
                        (name.length < 5 || name > 50) ? 2 :
                            (!dob) ? 3 :
                                (!dobShapeRegex.test(dob)) ? 4 :
                                    (!contactno) ? 5 :
                                        (contactno.length != 10) ? 6 :
                                            (!email) ? 7 :
                                                (!emailRegex.test(email)) ? 8 :
                                                    (state == 0) ? 9 :
                                                        (!city) ? 10 :
                                                            (!nameRegex.test(city)) ? 11 :
                                                                (pincode.length != 6) ? 12 :
                                                                    (!address) ? 13 :
                                                                        (!userid) ? 14 :
                                                                            (userid.length < 8) ? 15 :
                                                                                (!password) ? 16 :
                                                                                    (password.length < 8) ? 17 :
                                                                                        (isNaN(dobDate.getTime()) ||
                                                                                            dobDate < minDate ||
                                                                                            dobDate > today) ? 18:
                                                                                                              19;
            switch(chk){
                case 0 :
                    setError("nameError", "*Name cannot be empty");
                    return;
                case 1:
                    setError("nameError", "*Only letter and spaces allowed");
                    return;
                case 2:
                    setError("nameError", "*Name should be 5-50");
                    return;
                case 3:
                    setError("dobError", "*Date of Birth cannot be empty");
                    return;
                case 4:
                    setError("dobError", "*Date of Birth must be YYYY-MM-DD");
                    return;
                case 18:
                    setError("dobError", "*Date of Birth must be 2000-01-01 to Today");
                    return;
                case 5:
                    setError("contactNoError", "*Contact Number cannot be empty");
                    return;
                case 6:
                    setError("contactNoError", "*Contact Number must be of length 10");
                    return;
                case 7:
                    setError("emailError", "*Email cannot be empty");
                    return;
                case 8:
                    setError("emailError", "*Invalid email");
                    return;
                case 9:
                    setError("stateError", "*Choose a state");
                    return;
                case 10:
                    setError("cityError", "*City cannot be empty");
                    return;
                case 11:
                    setError("cityError", "*Only alphabets and spaces allowed");
                    return;
                case 12:
                    setError("pincodeError", "*Pincode must be of length 6");
                    return;
                case 13:
                    setError("addressError", "*Address cannot be empty");
                    return;
                case 14:
                    setError("useridError", "*User Id cannot be empty");
                    return;
                case 15:
                    setError("useridError", "*User Id should contain at least 8 letters");
                    return;
                case 16:
                    setError("passwordError", "*Password cannot be empty");
                    return;
                case 17:
                    setError("passwordError", "*Password should contain at least 8 letters");
                    return;
                case 19:
                    Swal.fire("Success", "Successfully Signed up!", "success");
                
            }

        }
        

    </script>

</asp:Content>
