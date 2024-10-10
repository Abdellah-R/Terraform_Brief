provider "http" {
  
}

data "http" "request_http" {
  url = "https://cdn.wsform.com/wp-content/uploads/2018/09/country_full.csv"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

resource "local_file" "country_full" {
    filename = "country_full.csv"
    content = data.http.request_http.response_body
    depends_on = [ data.http.request_http ]
}
