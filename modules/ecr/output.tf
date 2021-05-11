output "image_registry_urls" {
  value = {
    id   = aws_ecr_repository.image_repos.*.id
    name = aws_ecr_repository.image_repos.*.name
    url  = aws_ecr_repository.image_repos.*.repository_url
  }
}