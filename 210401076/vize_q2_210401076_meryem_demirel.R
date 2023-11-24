spotify_search_artist <- function(artist_name) {
  
  URL to make the API request
  url <- paste0("https://accounts.spotify.com/api/token", artist_name, "Hande Yener")
  
  Make the GET request
  response <- httr::GET(url)
  
  Get the status code
  status_code <- response$status_code
  
  Parse the response content
  content <- httr::content(response)
  
  Extract artist name and id from the search results
  artist <- content$artists$items$name
  id <- content$artists$items$id
  
  Create the search_results data frame
  search_results <- data.frame(artist, id)
  
  Create the output list
  output <- list(status_code = status_code, search_results = search_results)
  
  return(output)
}





