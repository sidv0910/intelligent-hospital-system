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
	var lname = document.form.lname.value;
	var dob = document.getElementById('dob').value;
	var dt = new Date();
	dt.setFullYear(dt.getFullYear() - 5);
	var months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
    var ch = new Date(dob);
	var age = document.form.age.value;
	var mobile1 = document.form.mobile.value;
	var mobile2 = document.getElementById('mobile').value;
	var relation = document.form.relation.value;
	var contact1 = document.form.contact.value;
	var contact2 = document.getElementById('contact').value;

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

    if (!(pword.match(/[a-z]/g) && pword.match(/[A-Z]/g) && pword.match(/[0-9]/g) && pword.match(/[^a-zA-Z\d]/g) && pword.length >= 8 && pword.length <= 15)) { 
        alert("Password should contain:\n1. Atleast 1 uppercase character.\n2. Atleast 1 lowercase character.\n3. Atleast 1 digit.\n4. Atleast 1 special character.\n5. Minimum 8 characters.\n6. Maximum 15 characters.");
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
	else if (age < 5) {
		alert("Age should be equal to or more than 5 years.");
		document.getElementById('age').focus();
		return false;
	}

    if (isNaN(mobile1) || mobile2.length != 10) {
        alert("Mobile Number should contain:\n1. Only digits.\n2. No characters or special characters.\n3. Exactly 10 digits.");
        document.getElementById('mobile').focus();
        return false;
    }

	if (!relation.match(nameRegex)) {
        alert("Relationship with Patient should contain:\n1. Only characters.\n2. No digits.\n3. No special characters.");
        document.getElementById('relation').focus();
        return false;
	}	
	
	if (isNaN(contact1) || contact2.length != 10) {
        alert("Person's Contact No. should contain:\n1. Only digits.\n2. No characters or special characters.\n3. Exactly 10 digits.");
        document.getElementById('contact').focus();
        return false;
    }

	return true;
}