module "slo" {
  source    = "git::git@github.com:SolalVall/terraform-dynatrace-modules.git//slo?ref=main"
  team_name = "my-team"
  slos = {
    "slo-demo-prod" = {
      name           = "(prod)"
      description      = "This is a slo created with terraform for measuring application user experience for app with tag test"
      warning        = 99.90
      target           = 98.50
      timeframe        = "-1m"
      predefine_metric = "application_user_experience"
      filter_type      = "APPLICATION"
      filter_entity    = "My Web Application"
   }
  }
}
