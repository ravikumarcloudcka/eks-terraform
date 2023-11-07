terraform {
  cloud {
    organization = "ravidevops"
    hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      project = "zi-assignment"
      tags = ["env", "test"]
    }
  }
}

