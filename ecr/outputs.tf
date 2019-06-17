output "application-repository-names" {
  value = "${aws_ecr_repository.container_repository.name}"
}
output "application-repository-urls" {
  value = "${aws_ecr_repository.container_repository.repository_url}"
}