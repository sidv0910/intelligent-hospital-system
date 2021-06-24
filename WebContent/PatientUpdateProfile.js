function validate() {
	var age = document.form.age.value;
	var mobile1 = document.form.mobile.value;
	var mobile2 = document.getElementById('mobile').value;
	var relation = document.form.emgRelation.value;
	var contact1 = document.form.emgContact.value;
	var contact2 = document.getElementById('emgContact').value;
	
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