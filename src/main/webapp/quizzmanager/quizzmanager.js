function loadPart(selectBox) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("contentPartAndQuizz").innerHTML = this.responseText;
		}
	};
	xhttp.open("GET", "partAndQuizz.jsp?idMonHoc=" + selectBox.value, true);
	xhttp.send();
}
function searchQuizzs() {
	var input, filter, table, tr, td, i;
	input = document.getElementById("myInput");
	filter = input.value.toUpperCase();
	table = document.getElementById("tableContentQuizzs");
	tr = table.getElementsByTagName("tr");
	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[1];
		if (td) {
			if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
				tr[i].style.display = "";
			} else {
				tr[i].style.display = "none";
			}
		}
	}
}
function changeContentQuizz(btn) {
	var rowClicked = btn.parentNode.parentNode.rowIndex;
	//var table = document.getElementById("tableContentQuizzs");
	var currentTRnode = btn.parentNode.parentNode;
	var allTDtags = currentTRnode.getElementsByTagName("td");
	//
	document.getElementById("formIdQuizz").value=allTDtags[0].innerHTML;
	document.getElementById("formContentQuizz").value=allTDtags[1].innerHTML;
	document.getElementById("formAnswerQuizz").value=allTDtags[2].innerHTML;
	document.getElementById("formSelectAQuizz").value=allTDtags[3].innerHTML;
	document.getElementById("formSelectBQuizz").value=allTDtags[4].innerHTML;
	document.getElementById("formSelectCQuizz").value=allTDtags[5].innerHTML;
	document.getElementById("formSelectDQuizz").value=allTDtags[6].innerHTML;
	document.getElementById("formPartQuizz").value=allTDtags[7].innerHTML;
	document.getElementById("formIdPartQuizz").value=allTDtags[8].innerHTML;
}
function nextPage(){
	var x = document.getElementById("currentPage").value;
	var y = document.getElementById("MaxPage").textContent;
	x=parseInt(x);
	y=parseInt(y);
	if(x==y){
		console.log("equal");
		return;
	}
	document.getElementById("currentPage").value=x+1;
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("MainTableQuizzs").innerHTML = this.responseText;
		}
	};
	var currentIndex=document.getElementById("currentOfQuizzNumbers").textContent;
	xhttp.open("GET", "quizzmanager/BreakPage.jsp?currentOfQuizzNumbers=" + currentIndex, true);
	xhttp.send();
}
function previousPage(){
	var x = document.getElementById("currentPage").value;
	var y = document.getElementById("MaxPage").textContent;
	x=parseInt(x);
	y=parseInt(y);
	if(x==1){
		console.log("equal");
		return;
	}
	document.getElementById("currentPage").value=x-1;
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("MainTableQuizzs").innerHTML = this.responseText;
		}
	};	
	var currentIndex=document.getElementById("currentOfQuizzNumbers").textContent;
	currentIndex = parseInt(currentIndex)-20;
	xhttp.open("GET", "quizzmanager/BreakPage.jsp?currentOfQuizzNumbers=" + currentIndex, true);
	xhttp.send();
}