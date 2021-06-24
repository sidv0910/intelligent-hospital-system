function validate() {
    var pid = document.getElementById('pid').value;
    var uname = document.getElementById('uname').value;
    var pword = document.getElementById('pword').value;

    if (pid.length != 9) {
        alert('Patient ID should contain exact 9 characters.');
        document.getElementById('pid').focus();
        return false;
    }

    if ((uname.length < 6) || (uname.length > 15)) {
        alert('Username should contain:\n1. Minimum 6 characters.\n2. Maximum 15 characters.');
        document.getElementById('uname').focus();
        return false;
    }

    if (!(pword.match(/[a-z]/g) && pword.match(/[A-Z]/g) && pword.match(/[0-9]/g) && pword.match(/[^a-zA-Z\d]/g) && pword.length >= 8)) { 
        alert("Password should contain:\n1. Atleast 1 uppercase character.\n2. Atleast 1 lowercase character.\n3. Atleast 1 digit.\n4. Atleast 1 special character.\n5. Minimum 8 characters.");
        document.getElementById('pword').focus();
        return false;
    }

    return true;
}