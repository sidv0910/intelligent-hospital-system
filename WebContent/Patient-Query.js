function validate() {

    var message = document.getElementById('message').value;
    if ((message.length < 50) || (message.length > 500)) {
        alert("Message length should be between 50 - 500 characters");
        document.getElementById('message').focus();
        return false;
    }

    return true;
}