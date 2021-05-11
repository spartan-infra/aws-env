resource "aws_ecr_repository" "image_repos" {
  count                = length(var.image_registry_api_names)
  name                 = element(var.image_registry_api_names, count.index)
  image_tag_mutability = var.image_registry_tag_mutability

  tags = merge(
    {
      Name        = element(var.image_registry_api_names, count.index)
      Description = format("ECR repository for %s test api", element(var.image_registry_api_names, count.index))
    },
    var.image_registry_project_tags
  )
}