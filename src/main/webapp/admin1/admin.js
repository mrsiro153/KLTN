function opentab(evt, thisbutton) {
	var tablinks = document.getElementsByClassName("tablink");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" w3-blue", "");
	}
	evt.currentTarget.className += " w3-blue";
	loadDoc2(thisbutton);
}
function loadDoc2(haha) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("container1").innerHTML = this.responseText;
		}
	};
	var s = "";
	if (haha.id.match("exam")) {
		s = "manage_exam";
	} else if (haha.id.match("user")) {
		s = "manage_user";
	} else {
		s = "manage_role";
	}
	xhttp.open("GET", "admin1/" + s + ".jsp", true);
	xhttp.send();
}
function deletesomeel(x) {
	x.parentElement.style.display = 'none';
}
function editUser(x) {
	// get row index
	var y = x.parentElement.parentElement.rowIndex;
	var z = document.getElementById("mytable1");
	var role = z.rows[y].cells[0].innerHTML;
	var id = z.rows[y].cells[1].innerHTML;
	var name = z.rows[y].cells[2].innerHTML;
	var dob = z.rows[y].cells[3].innerHTML;
	var sex = z.rows[y].cells[4].innerHTML;
	var address = z.rows[y].cells[5].innerHTML;
	var phone = z.rows[y].cells[6].innerHTML;
	//
	document.getElementById("edtRole").value = role;
	document.getElementById("edtId").value = id;
	document.getElementById("edtPa").value = "";
	document.getElementById("edtName").value = name;
	document.getElementById("edtDob").value = dob;
	document.getElementById("edtSex").value = sex;
	document.getElementById("edtAddress").value = address;
	document.getElementById("edtPho").value = phone;
}
function deleteUser(x){
	var y = x.parentElement.parentElement.rowIndex;
	var z = document.getElementById("mytable1");
	var role = z.rows[y].cells[0].innerHTML;
	var id = z.rows[y].cells[1].innerHTML;
	document.getElementById("delRole").value = role;
	document.getElementById("delId").value = id;
}

function searchExamSubject(){
	searchBox = document.getElementById("searchBox");
	examSubjects = document.getElementById("exam_subject");
	//
	var text = searchBox.value;
    var options = examSubjects.options; 
    for (var i = 0; i < options.length; i++) {
        var option = options[i]; 
        var optionText = option.text; 
        var lowerOptionText = optionText.toLowerCase();
        var lowerText = text.toLowerCase(); 
        var regex = new RegExp("^" + text, "i");
        var match = optionText.match(regex); 
        var contains = lowerOptionText.indexOf(lowerText) != -1;
        if (match || contains) {
            option.selected = true;
            loadExamSubject(examSubjects);
            return;
        }
        searchBox.selectedIndex = 0;
    }
}
function loadExamSubject(selectBox){
	var text = selectBox.value;
	var value = text.substring(0, 1);
	for (var i = 0; i<text.length; i++){
		if(text.charAt(i)==" "){
			value = text.substring(0,i);
			break;
		}
		//console.log(text.charAt(i)+" ");
	}
	console.log(text+"   "+value);
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("ScoresExam").innerHTML = this.responseText;
		}
	};
	xhttp.open("GET", "admin1/contentExam.jsp?idExam=" + value, true);
	xhttp.send();
}
//
function submitUserFromFile() {

    var url = "addNewUserByFile"; // the script where you handle the form input.
    var myForm = $("#fromAddUserFromFile")[0];
    var data = new FormData(myForm);
    //
    $.ajax({
           type: "POST",
           enctype: 'multipart/form-data',
           processData: false,
           contentType: false,
           url: url,
           data: data, 
           success: function(data)
           {
        	   $("#responseAddFromFile").html(data);
               //console.log(data);
           }
         });
}