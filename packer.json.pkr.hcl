source "googlecompute" "basic-example" {
  project_id   = "infra-as-code-1981"
  source_image = "debian-9-stretch-v20200805"
  ssh_username = "packer"
  zone         = "us-central1-a"
  image_name   = "infra-test"
  account_file = "key.json"
  image_labels = {
    application = "test"
  }
}
build {
  sources = ["sources.googlecompute.basic-example"]
}
