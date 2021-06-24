var count = 0;

var loadFile = function(event) {
	var image = document.getElementById('output');
	image.src = URL.createObjectURL(event.target.files[0]);
	count = count + 1;
};

function validate() {
	var uname = document.getElementById('uname').value;
	var email = document.getElementById('email').value;
    var pword = document.getElementById('pword').value;
	var repword = document.getElementById('repword').value;
	var fname = document.form.fname.value;
	var mname = document.form.mname.value;
	var lname = document.form.lname.value;
	var dob = document.getElementById('dob').value;
	var dt = new Date();
	dt.setFullYear(dt.getFullYear() - 25);
	var months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
	var ch = new Date(dob);
	var age = document.form.age.value;
	var noc = document.form.noc.value;
	var citizen = document.getElementById('citizen').value;
	var mobile1 = document.form.mobile.value;
	var mobile2 = document.getElementById('mobile').value;

    if ((uname.length < 6) || (uname.length > 15)) {
        alert('Username should contain:\n1. Minimum 6 characters.\n2. Maximum 15 characters.');
        document.getElementById('uname').focus();
        return false;
	}
	
	var at = email.indexOf("@");  
    var dot = email.lastIndexOf(".");  
    if ((at < 1) || (dot < at+2) || (dot+2 >= email.length)) {
        alert("Please enter a valid e-mail address.\nEmail should be of type someone@example.com");  
        document.getElementById('email').focus();
        return false;  
    }

    if (!(pword.match(/[a-z]/g) && pword.match(/[A-Z]/g) && pword.match(/[0-9]/g) && pword.match(/[^a-zA-Z\d]/g) && pword.length >= 8)) { 
        alert("Password should contain:\n1. Atleast 1 uppercase character.\n2. Atleast 1 lowercase character.\n3. Atleast 1 digit.\n4. Atleast 1 special character.\n5. Minimum 8 characters.");
        document.getElementById('pword').focus();
        return false;
    }

    if (pword != repword) {
        alert("Passwords did not match.");
        document.getElementById('repword').focus();
        return false;
	}
	
	if (count == 0) {
		alert("Please upload your image.");
		document.getElementById('file').focus();
		return false;
	}

    var nameRegex = /^[a-zA-Z]+$/;
    if (!fname.match(nameRegex)) {
        alert("Name should contain:\n1. Only characters.\n2. No digits.\n3. No special characters.");
        document.getElementById('fname').focus();
        return false;
	}
	if ((mname != "") && (!mname.match(nameRegex))) {
		alert("Name should contain:\n1. Only characters.\n2. No digits.\n3. No special characters.");
        document.getElementById('mname').focus();
        return false;
	}
    if (!lname.match(nameRegex)) {
        alert("Name should contain:\n1. Only characters.\n2. No digits.\n3. No special characters.");
        document.getElementById('lname').focus();
        return false;
	}

	if (ch > dt) {
        alert("Date of Birth should be before "+dt.getUTCDate()+"/"+months[dt.getMonth()]+"/"+dt.getFullYear());
        document.getElementById('dob').focus();
        return false;
	}
	
	if (age <= 0) {
		alert("Age can't be negative or zero.");
		document.getElementById('age').focus();
		return false;
	}
	else if (age < 25) {
		alert("Age should be equal to or more than 25 years.");
		document.getElementById('age').focus();
		return false;
	}

	if (noc < 0) {
		alert("Number of Children can't be negative.");
		document.getElementById('noc').focus();
		return false;
	}

	if (!citizen.match(nameRegex)) {
        alert("Citizenship should contain only letters.");
        document.getElementById('fname').focus();
        return false;
	}

	if (isNaN(mobile1) || mobile2.length != 10) {
        alert("Mobile Number should contain:\n1. Only digits.\n2. No characters or special characters.\n3. Exactly 10 digits.");
        document.getElementById('mobile').focus();
        return false;
	}
	
	var from1 = document.getElementById('from1').value;
	var b1 = new Date(from1);
	var to1 = document.getElementById('to1').value;
	var a1 = new Date(to1);
	var from2 = document.getElementById('from2').value;
	var b2 = new Date(from2);
	var to2 = document.getElementById('to2').value;
	var a2 = new Date(to2);
	var from3 = document.getElementById('from3').value;
	var b3 = new Date(from3);
	var to3 = document.getElementById('to3').value;
	var a3 = new Date(to3);

	if (b1 > a1) {
		alert("High School's From Date should be before To Date");
		document.getElementById('from1').focus();
		return false;
	}

	if (b2 > a2) {
		alert("College's / University's From Date should be before To Date");
		document.getElementById('from2').focus();
		return false;
	}

	if (b3 > a3) {
		alert("Other Course's From Date should be before To Date");
		document.getElementById('from3').focus();
		return false;
	}

	return true;
}