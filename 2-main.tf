resource "aws_s3_bucket" "frontend" {
  bucket_prefix = "jenkins-bucket-"
  force_destroy = true


  tags = {
    Name = "Jenkins Bucket"
  }
}

resource "aws_s3_object" "picture" {
  bucket = aws_s3_bucket.frontend.id
  key    = "armageddon_evidence/image.webp"
  source = "${path.module}/armageddon_evidence/image.webp"
}

resource "aws_s3_object" "text" {
  bucket = aws_s3_bucket.frontend.id
  key    = "armageddon_evidence/proof.txt"
  source = "${path.module}/armageddon_evidence/proof.txt"
}

resource "aws_s3_object" "jenkins1" {
  bucket = aws_s3_bucket.frontend.id
  key    = "jenkins_server_proof/jenkins1.png"
  source = "${path.module}/jenkins_server_proof/jenkins1.png"
}

resource "aws_s3_object" "jenkins2" {
  bucket = aws_s3_bucket.frontend.id
  key    = "jenkins_server_proof/jenkins2.png"
  source = "${path.module}/jenkins_server_proof/jenkins2.png"
}

resource "aws_s3_object" "jenkins3" {
  bucket = aws_s3_bucket.frontend.id
  key    = "jenkins_server_proof/jenkins3.png"
  source = "${path.module}/jenkins_server_proof/jenkins3.png"
}

resource "aws_s3_object" "jenkins4" {
  bucket = aws_s3_bucket.frontend.id
  key    = "jenkins_server_proof/jenkins4.png"
  source = "${path.module}/jenkins_server_proof/jenkins4.png"
}

resource "aws_s3_object" "s3proof" {
  bucket = aws_s3_bucket.frontend.id
  key    = "jenkins_server_proof/s3proof.png"
  source = "${path.module}/jenkins_server_proof/s3proof.png"
}

resource "aws_s3_object" "webhook" {
  bucket = aws_s3_bucket.frontend.id
  key    = "jenkins_server_proof/webhook.png"
  source = "${path.module}/jenkins_server_proof/webhook.png"
}

resource "aws_s3_object" "jenkinsapply" {
  bucket = aws_s3_bucket.frontend.id
  key    = "jenkins_server_proof/jenkinsapply.png"
  source = "${path.module}/jenkins_server_proof/jenkinsapply.png"
}

resource "aws_s3_object" "jenkinswebhookk" {
  bucket = aws_s3_bucket.frontend.id
  key    = "jenkins_server_proof/jenkinswebhook2.png"
  source = "${path.module}/jenkins_server_proof/jenkinswebhook2.png"
}

resource "aws_s3_object" "jenkinsz" {
  bucket = aws_s3_bucket.frontend.id
  key    = "jenkins_server_proof/jenkinss32.png"
  source = "${path.module}/jenkins_server_proof/jenkinss32.png"
}

resource "aws_s3_bucket_public_access_block" "jdollasname" {
  bucket = aws_s3_bucket.frontend.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

}

resource "aws_s3_bucket_policy" "goku" {
  bucket = aws_s3_bucket.frontend.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.frontend.arn}/*"
      },
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.jdollasname]
}
