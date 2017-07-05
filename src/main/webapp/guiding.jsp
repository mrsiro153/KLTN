<div class="ListGroup" style="width: 15%;float:left;">
<div class="list-group" style="cursor: pointer;">
    <p class="list-group-item list-group-item-success" id="adminGuiding" onclick="guidingPage(this)">Admin Page</p>
    <p class="list-group-item list-group-item-info" id="studentGuiding" onclick="guidingPage(this)">Student Page</p>
    <p class="list-group-item list-group-item-warning" id="lectureGuiding" onclick="guidingPage(this)">Lecture Page</p>
    <p class="list-group-item list-group-item-danger" id="examGuiding" onclick="guidingPage(this)">Exam Manager Page</p>
    <p class="list-group-item list-group-item-primary" id="quizzGuiding" onclick="guidingPage(this)">Quizz Manager Page</p>
</div>
</div>
<div id="contentGuiding" style="float:left; margin-left: 5px; background-color: rgba(255,255,0,0.8); padding: 5px;">
<jsp:include page="guidingfolder/adminGuiding.jsp"></jsp:include>
</div>
