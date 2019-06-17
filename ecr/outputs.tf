output "application-repository-names" {
  value = "${aws_ecr_repository.container-repository.*.name}"
}
output "application-repository-urls" {
  value = "${aws_ecr_repository.container-repository.*.repository_url}"
}