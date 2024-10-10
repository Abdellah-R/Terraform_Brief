provider "local" {
  
}

resource "local_file" "hello_world" {
    filename = var.filename
    content = var.content
}