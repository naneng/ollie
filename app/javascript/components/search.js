var search = document.getElementById("search_function");
search && search.addEventListener('click', () => {
      searchFunction();
    });

function searchFunction() {
    // Declare variables
    console.log("loaded search");
    event.preventDefault();
    var search = document.getElementById('search_query').value.toLowerCase();
    var movies = document.querySelectorAll('.movie_card')
    for (var i=0; i<movies.length; i++)  {
      console.log
      if (movies[i].outerText.toLowerCase().includes(search)) {
        movies[i].style.display = "flex";
      } else {
        movies[i].style.display = "none";
      }
    }
}
