resource "aws_sqs_queue" "sqs-for-lambda-in-scala" {
  name     = "sqs-for-lambda-in-scala"
}

resource "aws_iam_role" "iam-for-lambda-in-scala" {
    name = "iam-for-lambda-in-scala"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "iam-policy-for-lambda-in-scala" {
  name = "iam-policy-for-lambda-in-scala"
  role = "${aws_iam_role.iam-for-lambda-in-scala.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Sid": "1",
      "Action": [
          "sqs:DeleteMessage",
          "sqs:GetQueueUrl",
          "logs:CreateLogStream",
          "sqs:ListDeadLetterSourceQueues",
          "sqs:ChangeMessageVisibility",
          "sqs:ReceiveMessage",
          "sqs:GetQueueAttributes",
          "sqs:ListQueueTags",
          "logs:PutLogEvents"
      ],
      "Resource": [
          "${aws_sqs_queue.sqs-for-lambda-in-scala.arn}",
          "${aws_cloudwatch_log_group.lambda-log-group.arn}"
      ]
    }
  ]
}
EOF

}

variable "lambda-in-scala" {
  type = "string"
  default = "lambda-in-scala"
}


resource "aws_cloudwatch_log_group" "lambda-log-group" {
  name              = "/aws/lambda/${var.lambda-in-scala}"
  retention_in_days = 14
}

resource "aws_lambda_function" "lambda-in-scala" {
  function_name = "${var.lambda-in-scala}"
  role          = "${aws_iam_role.iam-for-lambda-in-scala.arn}"
  handler       = "com.ru.waka::hello"
  filename = ""

  runtime = "java8"
}

resource "aws_lambda_event_source_mapping" "mapping" {
  event_source_arn = "${aws_sqs_queue.sqs-for-lambda-in-scala.arn}"
  function_name    = "${aws_lambda_function.lambda-in-scala.arn}"
}

