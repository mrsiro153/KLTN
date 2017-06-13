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