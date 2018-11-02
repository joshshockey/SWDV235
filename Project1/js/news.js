"use strict";

var $ = function(id) {
    return document.getElementById(id);
};

var joinList = function() {
	var emailAddress = $("email_address").value;
	var isValid = true;
	
	 // validate the entries(new additions)
    if (emailAddress == "") {
		$("email_address").nextElementSibling.firstChild.nodeValue = "First email address entry required";	
		isValid = false;
	}
	else {
		$("email_address").nextElementSibling.firstChild.nodeValue = "";
	}
	// submit the form if all entries are valid
    // otherwise, display an error message
    if (isValid) {
        $("newsletter_form").submit(); 
    }
};

window.onload = function() {
    $("join_list").onclick = joinList;
    $("email_address").focus();
};
