# Create the Cloudlet Policy
resource "akamai_cloudlets_policy" "edge_redirect_policy" {
  name = "Global_Redirect_Manager"
  cloudlet_code = "ER" # Edge Redirector code
  description = "Managed via Terraform - Global URL migrations"
  group_id = var.group_id
  match_rules = data.akamai_cloudlets_edge_redirector_match_rule.marketing_redirects.json
}

# Activate on Staging for testing
resource "akamai_cloudlets_policy_activation" "staging_activation" {
  policy_id = akamai_cloudlets_policy.edge_redirect_policy.id
  network = "staging"
  version = akamai_cloudlets_policy.edge_redirect_policy.version
}
