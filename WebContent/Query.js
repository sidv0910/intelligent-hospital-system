function validate() {
    var email = document.getElementById('email').value;
    var at = email.indexOf("@");  
    var dot = email.lastIndexOf(".");  
    
    if ((at < 1) || (dot < at+2) || (dot+2 >= email.length)) {
        alert("Please enter a valid e-mail address.\nEmail should be of type someone@example.com");  
        document.getElementById('email').focus();
        return false;  
    }

    var mobile1 = document.form.mobile.value;
    var mobile2 = document.getElementById('mobile').value;
    if (isNaN(mobile1) || mobile2.length != 10) {
        alert("Mobile Number should contain:\n1. Only digits.\n2. No characters or special characters.\n3. Exactly 10 digits.");
        document.getElementById('mobile').focus();
        return false;
    } 

    var message = document.getElementById('message').value;
    if ((message.length < 50) || (message.length > 500)) {
        alert("Message length should be between 50 - 500 characters");
        document.getElementById('message').focus();
        return false;
    }

    return true;
}