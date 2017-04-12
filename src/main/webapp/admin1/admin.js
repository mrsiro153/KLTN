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
	if (haha.id.match("home")) {
		s = "home";
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