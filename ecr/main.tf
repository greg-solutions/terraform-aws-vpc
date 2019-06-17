resource "aws_ecr_repository" "container_repository" {
  count = "${length(var.app_env_list)}"
  name  = "${lower(var.image_tag)}-${lower(element(var.app_env_list,count.index))}"
}

resource "aws_ecr_lifecycle_policy" "container_repository_lifecycle_policy" {
  count      = "${length(var.app_env_list)}"
  repository = "${element(aws_ecr_repository.container_repository.*.name,count.index)}"

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 14 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 14
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

resource "aws_ecr_repository_policy" "container_repository_policy" {
  count      = "${length(var.app_env_list)}"
  repository = "${element(aws_ecr_repository.container_repository.*.name,count.index)}"

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:DescribeRepositories",
                "ecr:GetRepositoryPolicy",
                "ecr:ListImages",
                "ecr:DeleteRepository",
                "ecr:BatchDeleteImage",
                "ecr:SetRepositoryPolicy",
                "ecr:DeleteRepositoryPolicy"
            ]
        }
    ]
}
EOF
}
