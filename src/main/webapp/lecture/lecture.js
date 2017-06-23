function getThisExam(btn){
	var x = btn.parentElement.parentElement.rowIndex;//get rowindex of table
	var table=btn.parentElement.parentElement.parentElement.parentElement;
	var TDIdExam=table.rows[x].cells[0];//return td tag has input idExam
	var listChildren=TDIdExam.childNodes;//all children tag in td
	var IdExam=listChildren[0].value;
	document.getElementById("idDeThiForDelete").value=IdExam;
}
function onValueChangeOfSelecboxSubject(selectBox){
	var text = selectBox.value;
	console.log(text);
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("partsOfSubject").innerHTML = this.responseText;
		}
	};
	xhttp.open("GET", "lecture/partsOfSubject.jsp?idSubject=" + text, true);
	xhttp.send();
}