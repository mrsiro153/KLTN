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

function loadExamSubject1(this){
	console.log("hello world!");
}
function searchExamSubject1(){
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