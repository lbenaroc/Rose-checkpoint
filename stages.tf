resource "aws_api_gateway_deployment" "deploy" {
  depends_on = [
    aws_api_gateway_integration.hello_integration,
    aws_api_gateway_integration.time_integration
  ]
  rest_api_id = aws_api_gateway_rest_api.api.id

  triggers = {
    redeploy = sha1("v5")
  }
}

resource "aws_api_gateway_stage" "dev" {
  deployment_id         = aws_api_gateway_deployment.deploy.id
  rest_api_id           = aws_api_gateway_rest_api.api.id
  stage_name            = "dev"
  cache_cluster_enabled = true
  cache_cluster_size    = "0.5"

  variables = {
    environment = "dev"
  }
}

resource "aws_api_gateway_stage" "preprod" {
  deployment_id         = aws_api_gateway_deployment.deploy.id
  rest_api_id           = aws_api_gateway_rest_api.api.id
  stage_name            = "preprod"
  cache_cluster_enabled = true
  cache_cluster_size    = "0.5"

  variables = {
    environment = "preprod"
  }
}

resource "aws_api_gateway_stage" "prod" {
  deployment_id         = aws_api_gateway_deployment.deploy.id
  rest_api_id           = aws_api_gateway_rest_api.api.id
  stage_name            = "prod"
  cache_cluster_enabled = true
  cache_cluster_size    = "0.5"

  variables = {
    environment = "prod"
  }
}
