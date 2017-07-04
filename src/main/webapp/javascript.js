/*
Sử dụng cho các hàm javascript chung tất cả các page
 */
function loadDoc(haha) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("content").innerHTML = this.responseText;
    }
  };
  var s="";
  if(haha.id.match("myhome")){
  		s="myhome.jsp";
  }else if(haha.id.match("admin")){
    s="admin1/admin.jsp";
  }else if(haha.id.match("exam")){
    s="student/student.jsp";
  }else if(haha.id.match("lecture")){
    s="lecture/lecture.jsp";//this is creating exam page
  }else if(haha.id.match("manager")){
    s="exammanager/manager.jsp";
  }else if(haha.id.match("quizz")){
    s="quizzmanager/quizzmanager.jsp";
  }else if(haha.id.match("guiding")){
    s="guiding.jsp";
  }else if(haha.id.match("userManager")){
	  s="exammanager/userExam.jsp";
  }else if(haha.id.match("newExam")){
	  s="lecture/NewExam.jsp?idMonHoc=1";
  }else{
    s="question.jsp";
  }
  xhttp.open("GET",s, true);
  xhttp.send();
}
//nav button mainpage hover
function mousehover(x){
  x.style.color="#FFFF00";
}
function mouseout(x){
  x.style.color="#ffffff";
}
//
function guidingPage(haha) {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      document.getElementById("contentGuiding").innerHTML = this.responseText;
	    }
	  };
	  var s="";
	  if(haha.id.match("adminGuiding")){
	  		s="guidingfolder/adminGuiding.jsp";
	  }else if(haha.id.match("studentGuiding")){
	    s="";
	  }else if(haha.id.match("lectureGuiding")){
	    s="";
	  }else if(haha.id.match("examGuiding")){
	    s="";
	  }else if(haha.id.match("quizzGuiding")){
	    s="";
	  }
	  xhttp.open("GET",s, true);
	  xhttp.send();
	}