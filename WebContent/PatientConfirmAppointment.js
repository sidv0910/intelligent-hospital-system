function validate() {
	var date = document.getElementById('date').value;
	var dt = new Date();
	var curYear = dt.getFullYear();
	var curMonth = dt.getMonth() + 1;
	var curDate = dt.getDate();
	var ch = new Date(date);
	var inpYear = ch.getFullYear();
	var inpMonth = ch.getMonth() + 1;
	var inpDate = ch.getDate();
	
	if (((inpDate < curDate) && (inpMonth == curMonth) && (inpYear == curYear)) || ((inpMonth < curMonth) && (inpYear == curYear)) || (inpYear < curYear)) {
		alert("Appointment Date can't be a past date.");
		document.getElementById('date').focus;
		return false;
	}
	
	var max= new Date();
    max.setDate(max.getDate() + 30);
    var maxYear = max.getFullYear();
	var maxMonth = max.getMonth() + 1;
	var maxDate = max.getDate();
	var maximum = maxDate + "/" + maxMonth + "/" + maxYear;
	
	if (ch > max) {
		alert("Appointment dates are only available till " + maximum);
		document.getElementById('date').focus;
		return false;
	}

    return true;
}