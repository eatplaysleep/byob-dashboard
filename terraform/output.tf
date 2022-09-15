# This is the aws CLI command that must be run
output "api_env_json" {
  value = join("\n",
    [
      "\"AWS_PROFILE\": \"${var.aws_profile}\",",
      "\"AWS_REGION\": \"${var.aws_region}\",",
      "\"ENVIRONMENT\": \"${var.environment}\",",
      "\"AWS_SSM_PREFIX\": \"${var.aws_ssm_prefix}\"",
    ]
  )
}

output "vue_env_dev" {
  value = <<EOF
VUE_APP_CLIENT_ID=${okta_app_oauth.okta-byob.client_id}
VUE_APP_ISSUER=https://${var.org_name}.${var.base_url}/oauth2/${okta_auth_server.okta-byob.id}
VUE_APP_LOGO=
VUE_APP_LOGO_INVERSE=
VUE_APP_COMPANY_NAME=
VUE_APP_MAINCOLOR=
VUE_APP_COMPANY_NAME=
VUE_APP_RECAPTCHA_SITE_KEY=
VUE_APP_ADMIN_URL=http://localhost:8080/login
EOF
}

