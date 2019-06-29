variable "region" {
    description = "AWS region to host your network"
    default     = "ap-northeast-1"
}

provider "aws" {
    region = "${var.region}"
}
