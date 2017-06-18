function check(){
	var x = document.getElementById("bodyOfTableManagerExam");
	var inputTag=x.getElementsByTagName("input");
	var i;
	for(i=0;i<inputTag.length;i++){
		if(inputTag[i].value==""){
			console.log(inputTag[i].value);
			inputTag[i].parentNode.parentNode.style.background= "#ff3333";
		}
	}
}
function checkStautusOfDeThi(){
	var form = document.getElementById("formManagerEdit");
	var x = document.getElementById("bodyOfTableManagerExam");
	var inputtag = x.getElementsByTagName("input");
	var i;
	for(i=0;i<inputtag.length;i++){
		if(inputtag[i].getAttribute("type")=="checkbox"){
			if(inputtag[i].checked){
				var y = inputtag[i].parentNode;
				//y.getElementById("statusHidden").disabled = true;
				//
				var inputagHidden = y.getElementsByTagName("input");
				for(t=0;t<inputagHidden.length;t++){
					if(inputagHidden[t].getAttribute("type")=="hidden"){
						inputagHidden[t].disabled = true;
					}
				}
			}
		}
	}
	form.submit();
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
            return;
        }
        searchBox.selectedIndex = 0;
    }
}

function searchStudentSubject(){
	searchBox = document.getElementById("searchBoxStudent");
	examSubjects = document.getElementById("sudentClass");
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
            loadStudent(examSubjects);
            return;
        }
        searchBox.selectedIndex = 0;
    }
}
function loadStudent(selectBox){
	var text = selectBox.value;
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("studentInfoOfClass").innerHTML = this.responseText;
		}
	};
	xhttp.open("GET", "exammanager/studentInfo.jsp?idClass=" + text, true);
	xhttp.send();
}
function setUserExam(){
	//get current value in selectBox class Student
	var selectBox= document.getElementById("sudentClass");
	var text = selectBox.value;
	//get current value in selectBox id Exam
	selectBox = document.getElementById("exam_subject");
	var text1 = selectBox.value;
	//
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		  if (this.readyState == 4 && this.status == 200) {
		    document.getElementById("responseTextFromServlet").innerHTML = this.responseText;
		  }
		};
	xhttp.open("POST", "ManagerSetUserExam", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send("userExam="+text+"&idExam="+text1);
}