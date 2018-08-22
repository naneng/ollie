import "bootstrap";
import "../plugins/flatpickr";

function checked1(address) {
  var checkBox = document.getElementById("myCheck1");
  var pickup = document.getElementById("pickup_loc");
  if (checkBox.checked == true){
    pickup.value = address;
  } else {
    pickup.value = "";
  }
}

function checked2(address) {
  var checkBox = document.getElementById("myCheck2");
  var dropoff = document.getElementById("dropoff_loc");
  if (checkBox.checked == true){
    dropoff.value = address;
  } else {
    dropoff.value = "";
  }
}

function checked3() {
  var checkBox = document.getElementById("myCheck3");
  var date = document.getElementById("date");

  if (checkBox.checked == true){
    date.value = formatDate();
  } else {
    date.value = "";
  }
}

function formatDate() {
  var date = new Date(Date.now())
  var minutes = date.getMinutes();
  var hour = date.getHours();
  var year = date.getFullYear();
  var month = ('0'+(date.getMonth()+1)).slice(-2); // beware: January = 0; February = 1, etc.
  var day = date.getDate();
  var str = `${year}-${month}-${day} ${hour}:${minutes}`
  return str
}


function checked4() {
  var container = document.querySelector(".card_container");
  var checkBox = document.getElementById("myCheck4");

  if (checkBox.checked == true){
    container.insertAdjacentHTML("afterbegin", ``);
  } else {
    date.value = "";
  }
};

