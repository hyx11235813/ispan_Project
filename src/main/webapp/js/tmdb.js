var form = document.querySelector("form");
var input = document.querySelector('input[type="text"]');
var resultT = document.querySelector(".tmdb-result");

function movieResult(poster, name, year, rating, overview, trailerKey) {
  var resultItem = document.createElement("div");
  resultItem.classList.add("result-item");
  var img = document.createElement("img");
  img.src = poster;
  img.alt = name;
  img.addEventListener("click", function() {
    // Display movie details in a popup window
    var detailsWindow = window.open("", "_blank", "width=560,height=600");
    detailsWindow.document.write(`
          <html>
            <head>
              <meta charset="UTF-8">
              <title>${name}</title>
              <style>
                body {
                  font-family: sans-serif;
                  font-size: 16px;
                  line-height: 1.4;
                  color: #333;
                  background-color: #f7f7f7;
                  padding: 20px;
                }
                h1 {
                  margin-top: 0;
                }
                img {
                  max-width: 100%;
                }
                .details {
                  margin-top: 1em;
                }
                .trailer {
                  margin-top: 1em;
                }
                button {
                  background-color: #4CAF50;
                  color: #fff;
                  padding: 0.5em 1em;
                  border: none;
                  border-radius: 4px;
                  font-size: 1em;
                  cursor: pointer;
                }
                button:hover {
                  background-color: #3e8e41;
                }
              </style>
            </head>
            <body>
              <div class="poster">
                <img src="${poster}" alt="${name}">
              </div>
              <div class="details">
                <h1>${name}</h1>
                <p>${year.slice(0, 4)} 年</p>
                <p><strong>評分:</strong> ${rating}/10</p>
                <p><strong>簡介:</strong> ${overview}</p>
              </div>
            </body>
          </html>
        `);
  });

  var movieTitle = document.createElement("h4");
  var releaseYear = document.createElement("p");
  var movieRating = document.createElement("div");
  var movieOverview = document.createElement("div");
  var trailerButton = document.createElement("button");

  movieTitle.innerHTML = name;
  releaseYear.innerHTML = year.slice(0, 4) + " 年";
  movieRating.innerHTML = "評分: " + rating + "/10";
  movieOverview.innerHTML = "簡介: " + overview;
  trailerButton.innerText = "預告片";
  trailerButton.addEventListener("click", function() {
    fetchTrailer(trailerKey);
  });
  resultItem.appendChild(trailerButton);

  resultItem.appendChild(img);
  resultItem.appendChild(movieTitle);
  resultItem.appendChild(releaseYear);
  resultItem.appendChild(movieRating);
  resultItem.appendChild(movieOverview);

  resultT.appendChild(resultItem);
}

function fetchTrailer(movieId) {
  var trailerUrl = "https://api.themoviedb.org/3/movie/" + movieId + "/videos?api_key=" + apiKeyT + "&language=en-US";
  var xhr = new XMLHttpRequest();
  xhr.onload = function() {
    var response = JSON.parse(this.responseText).results;
    if (response.length > 0) {
      var trailerKey = response[0].key;
      var youtubeUrl = "https://www.youtube.com/watch?v=" + trailerKey;
      var trailerWindow = window.open("", "_blank", "width=560,height=315");
      trailerWindow.document.write(`
            <html>
  <head>
    <title>預告片</title>
  </head>
  <body style="margin: 0;">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/${trailerKey}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
  </body>
</html>
          `);
    } else {
      alert("找不到預告片");
    }
  };
  xhr.open("GET", trailerUrl, true);
  xhr.send();
}


function search(e) {
  e.preventDefault();
  resultT.innerHTML = "";
  var searchTitle = input.value;
  makeTRequest(searchTitle);
  input.value = "";
}

// for TMDb
var apiKeyT = "2a42a839a54f5cc62dae2671848e035c";
var urlT = "https://api.themoviedb.org/3/search/movie?api_key="
  + apiKeyT + "&query=";
var langT = "&language=zh-tw";

function makeTRequest(searchTitle) {
  xhr = new XMLHttpRequest();
  xhr.onload = function() {
    var response = JSON.parse(this.responseText).results;
    response.map(function(item) {
      if (item.poster_path !== null) {
        movieResult(
          "https://image.tmdb.org/t/p/w300" + item.poster_path,
          item.title,
          item.release_date,
          item.vote_average,
          item.overview,
          item.id );
  }
});
};
xhr.open("GET", urlT + searchTitle + langT, true);
xhr.send();
}

form.addEventListener("submit", search);