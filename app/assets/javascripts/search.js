
function searchFunction() {
    // Declare variables
    event.preventDefault();
    search = document.getElementById('search_query').value.toLowerCase();
    movies = document.querySelectorAll('.movie_card')
    newArray = [];
    for (i=0; i<movies.length; i++)  {
      console.log
      if (movies[i].outerText.toLowerCase().includes(search)) {
        movies[i].style.display = "flex";
      } else {
        movies[i].style.display = "none";
      }
    }

}
