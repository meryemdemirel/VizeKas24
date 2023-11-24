
#ozellik 1:


library(httr)

# SPOTIFY_ID ve SPOTIFY_SECRET environment variable'lar??n?? ayarlamak i??in
Sys.setenv(SPOTIFY_ID = "3c9b630783f2432bb3241a41ad7c2a3d")
Sys.setenv(SPOTIFY_SECRET = "520afcd7623146fb9d44116fc1d3ae12")

# Ard??ndan, fonksiyonu ??a????rabilirsiniz
library(httr)

spotify_token <- function() {
  # Spotify API token alma URL
  token_url <- "https://accounts.spotify.com/api/token"
  
  # Spotify uygulama bilgileri environment variable'lardan al??n??yor
  client_id <- Sys.getenv("SPOTIFY_ID")
  client_secret <- Sys.getenv("SPOTIFY_SECRET")
  
  if (client_id == "" || client_secret == "") {
    stop("SPOTIFY_ID ve SPOTIFY_SECRET environment variable'lar??n?? ayarlay??n.")
  }
  
  # Token alma iste??i i??in body
  body <- list(
    grant_type = "client_credentials",
    client_id = client_id,
    client_secret = client_secret
  )
  
  # Token alma iste??i g??nderme
  response <- POST(
    url = token_url,
    body = body,
    encode = "form",
    add_headers("Content-Type" = "application/x-www-form-urlencoded")
  )
  
  # HTTP status code'u alma
  status_code <- status_code(response)
  
  # Token de??erini alma
  token <- content(response)$access_token
  
  # Bearer token stringini olu??turma
  bearer_token <- paste("Bearer", token)
  
  # Sonu??lar?? liste olarak d??nd??rme
  result <- list(
    status_code = status_code,
    token = bearer_token
  )
  
  return(result)
}


