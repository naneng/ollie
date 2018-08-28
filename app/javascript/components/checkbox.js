function checked1(address) {
  var checkBox = document.getElementById("myCheck1");
  var pickup = document.getElementById("pickup_loc");
  if (checkBox.checked == true){
    pickup.value = address;
    pickup.setAttribute("readonly","readonly");
  } else {
    pickup.value = "";
    pickup.removeAttribute("readonly");
  }
}

function checked2(address) {
  var checkBox = document.getElementById("myCheck2");
  var dropoff = document.getElementById("dropoff_loc");
  if (checkBox.checked == true){
    dropoff.value = address;
    dropoff.setAttribute("readonly","readonly");
  } else {
    dropoff.value = "";
    dropoff.removeAttribute("readonly");
  }
}

function checked3() {
  var checkBox = document.getElementById("myCheck3");
  var date = document.getElementById("date");

  if (checkBox.checked == true){
    date.value = formatDate();
    date.setAttribute("readonly","readonly");
  } else {
    date.value = "";
    date.removeAttribute("readonly");
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

function favorite_click() {
    // Declare variables
    event.preventDefault();
    var movies = document.querySelectorAll('.movie_card');
    for (var i=0; i<movies.length; i++)  {
      console.log(movies[i]);
      /*if (movies[i].outerText.toLowerCase().includes(search)) {
        movies[i].style.display = "flex";
      } else {
        movies[i].style.display = "none";
      }*/
    }
}

export function bindEventListener() {
  const check1 = document.getElementById("myCheck1");
  check1 && check1.addEventListener('click', () => {
    checked1(check1.getAttribute("data-location"));
  });

  const check2 = document.getElementById("myCheck2");
  check2 && check2.addEventListener('click', () => {
    checked2(check2.getAttribute("data-location"));
  });

  const check3 = document.getElementById("myCheck3");
  check3 && check3.addEventListener('click', () => {
    checked3();
  });

  const favorites = document.getElementById("favorite_check");
  favorites && favorites.addEventListener('click', () => {
    favorite_click();
  });
}
