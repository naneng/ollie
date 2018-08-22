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
