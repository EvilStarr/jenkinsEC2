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
