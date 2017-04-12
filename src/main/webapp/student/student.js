function getDetails(argument) {
	var x = document.getElementById("details");
	x.innerHTML = "<p>Subject: cấu trúc dữ liệu<br>Lecture: Nguyễn Nam<br>Code exam: 01245"
			+ "<br>Number of quizzes: 45<br>Time: 30:00<br> date: 20/12/2016</p>";
}
function loadquizz(btn) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("contentQizzes").innerHTML = this.responseText;
		}
	};
	var maxQuizz = parseInt(document.getElementById("maxQuizzs").textContent);
	var currentQuizz = parseInt(document.getElementById("currentQuizz").textContent);
	var currentQuizz1 = parseInt(currentQuizz) + 1;//next quizz
	var currentQuizz2 = parseInt(currentQuizz) - 1;//previous quizz
	if (btn.id == "btnnext") {
		if (currentQuizz < maxQuizz - 1) {
			xhttp.open("GET", "student/newQuizz.jsp?currentQuizz="
					+ currentQuizz1, true);
			xhttp.send();
		}
	}
	if (btn.id == "btnback") {
		if (currentQuizz > 0) {
			xhttp.open("GET", "student/newQuizz.jsp?currentQuizz="
					+ currentQuizz2, true);
			xhttp.send();
		}
	}
}
function load_exam(btn) {
	//
	var y = btn.parentElement.parentElement;
	//
	var z = y.children;
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("mainExam").innerHTML = this.responseText;
		}
	};
	xhttp.open("GET", "student/exam.jsp?idexam=" + z[1].textContent + "&time="
			+ z[3].textContent + "&nameExam=" + z[0].textContent, true);
	xhttp.send();
}
function clickmeee() {
	var liftoffTime = document.getElementById("thoigianlambai").textContent;
	$('#noDays').countdown({
		until : liftoffTime,
		compact : true,
		format : 'HMS'
	});
	document.getElementById("navBarMain").style.display="none";
	document.getElementById("contentQizzes").style.display = "block";
	document.getElementById("btnstartnow").style.display = "none";
	var x = document.getElementById("btngroup");
	x.style.display = "block";
	setTimeout("timeout()", liftoffTime + 500);
}
function timeout() {
	checkAnswer();
	window.location = ("MainPage.jsp");
}
function addToAnswersheet(radioBtn){
	var valueBtn=radioBtn.value;//your answer (a b c or d)
	var parent = radioBtn.parentNode;//div tag
	var children = parent.childNodes;// many children node
	//children[3] is what I need: currentQuizz to add into table
	var currentQuizz=children[3].textContent;
	currentQuizz= parseInt(currentQuizz);
	var mytable = document.getElementById("tableOutline"); //table outline
	//
	mytable.rows[currentQuizz+1].cells[2].textContent=valueBtn;
}
function checkAnswer(){
	var mytable = document.getElementById("tableOutline"); //table outline
	var lengthTable = mytable.rows.length;
	var RightQuizz=0;
	var i = 0;
	for(i;i<lengthTable-1;i++){
		console.log(mytable.rows[i+1].cells[2].textContent+"::"+mytable.rows[i+1].cells[3].textContent);
		if(mytable.rows[i+1].cells[2].textContent==mytable.rows[i+1].cells[3].textContent){
			RightQuizz=RightQuizz+1;
		}
	}
	var diem=parseFloat(RightQuizz);
	diem=diem*10/(lengthTable-1);
	diem=diem.toFixed(2);
	//
	var idUser=document.getElementById("idSinhVien").textContent;
	var idDethi=document.getElementById("idDeThi").textContent;
	//
	var form = document.createElement("form");
	form.setAttribute("method", "Get");
    form.setAttribute("action", "setdiembaithi");
    var input1 = document.createElement("input");
    input1.setAttribute("type", "hidden");
    input1.setAttribute("name", "idUser");
    input1.setAttribute("value", idUser);
    var input2 = document.createElement("input");
    input2.setAttribute("type", "hidden");
    input2.setAttribute("name", "idDeThi");
    input2.setAttribute("value", idDethi);
    var input3 = document.createElement("input");
    input3.setAttribute("type", "hidden");
    input3.setAttribute("name", "Diem");
    input3.setAttribute("value", diem);
    //
    form.appendChild(input1);
    form.appendChild(input2);
    form.appendChild(input3);
    //
    document.body.appendChild(form);
    form.submit();
}
function unloadOrInterrupt(){
    var xhttp = new XMLHttpRequest();
	//
	var idSV=document.getElementById("idSinhVien").textContent;
	var idExam=document.getElementById("idDeThi").textContent;
	//
	var timeOut=document.getElementById("noDays");
	var timeRemaining=timeOut.getElementsByTagName("span")[0].textContent;
	//
	var tableOutline=document.getElementById("tableOutline");//table out line
	var tbody=tableOutline.getElementsByTagName("tbody")[0];//get tbody
	var trtags=tbody.getElementsByTagName("tr");
	//
	var idQuizz=[];
	var contentQuizz=[];
	var yourAnswer=[];
	var trueAnswer=[];
	for(var i = 0; i<trtags.length;i++){
		var index = trtags[i].rowIndex;
		var id = tableOutline.rows[index].cells[0].innerHTML;
		idQuizz.push(id);
		var content =  tableOutline.rows[index].cells[1].innerHTML;
		contentQuizz.push(content);
		var yours=tableOutline.rows[index].cells[2].innerHTML;
		yourAnswer.push(yours);
		var trueAns=tableOutline.rows[index].cells[3].innerHTML;
		trueAnswer.push(trueAns);
	}
	var myjson={
			"idSV":idSV,
			"idExam":idExam,
			"timeRe":timeRemaining,
			"idQuizz":idQuizz,
			"contentQuizz":contentQuizz,
			"yourAnswer":yourAnswer,
			"trueAnswer":trueAnswer
	};
	var data = encodeURIComponent(JSON.stringify(myjson));
	for (i = 0; i < myjson.idQuizz.length; i++) {
	    console.log(myjson.idQuizz[i]);
	}
	//xhttp.setRequestHeader("Content-type", "application/json; charset=utf-8");
	xhttp.open("get", "breakPage?currentExam="+data, true);
	xhttp.send();
}