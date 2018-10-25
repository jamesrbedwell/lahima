
var jobText = document.querySelector('.job-text');
var textMsgContentArea = document.querySelector(".text-msg-content");

var jobTxtBtnAll = document.querySelectorAll(".job-text-btn");

var span = document.querySelector(".close");

jobTxtBtnAll.forEach(btn => {
  btn.onclick = function(event) {
    var hiddenTxt = event.target.querySelector(".hidden-text");
    jobText.style.display = "block";
    textMsgContentArea.innerHTML = hiddenTxt.innerHTML;
  }
});

span.onclick = function() {
  jobText.style.display = "none";
  textMsgContentArea.innerHTML = "";
}

window.onclick = function(event) {
  if (event.target == jobText) {
      jobText.style.display = "none";
      textMsgContentArea.innerHTML = "";
  }
}