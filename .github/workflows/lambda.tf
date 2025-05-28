resource "aws_lambda_function" "hello" {
  function_name = "hello"
  role          = "arn:aws:iam::796230645355:role/LabRole"
  handler       = "index.handler"
  runtime       = "nodejs18.x"

  filename         = "lambda/hello.zip"
  source_code_hash = filebase64sha256("lambda/hello.zip")
}

resource "aws_lambda_function" "time" {
  function_name = "time"
  role          = "arn:aws:iam::796230645355:role/LabRole"
  handler       = "index.handler"
  runtime       = "nodejs18.x"

  filename         = "lambda/time.zip"
  source_code_hash = filebase64sha256("lambda/time.zip")
}
