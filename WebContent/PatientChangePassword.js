function validate() {
    var new1 = document.getElementById('new').value;
    var repeat = document.getElementById('repeat').value;

	if (!(new1.match(/[a-z]/g) && new1.match(/[A-Z]/g) && new1.match(/[0-9]/g) && new1.match(/[^a-zA-Z\d]/g) && new1.length >= 8)) { 
        alert("Password should contain:\n1. Atleast 1 uppercase character.\n2. Atleast 1 lowercase character.\n3. Atleast 1 digit.\n4. Atleast 1 special character.\n5. Minimum 8 characters.");
        document.getElementById('new').focus();
        return false;
    }

    if (new1 != repeat) {
        alert("Passwords did not match.");
        document.getElementById('repeat').focus();
        return false;
	}

    return true;
}