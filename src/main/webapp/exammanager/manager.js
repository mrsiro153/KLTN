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