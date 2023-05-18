module "dashboards" {
  source = "git::git@github.com:SolalVall/terraform-dynatrace-modules.git//dashboard?ref=main"
  name   = "stage"
  commonConfig = {
    mgmtZone = "tf-my-team-stage"
    owner    = "it"
    tags     = ["my_team"]
  }
  dashboards = {
    infrastructureOverview   = { enabled = true }
    realUserMonitoring       = { enabled = true }
    userExperienceKubernetes = { enabled = true }
    kubernetesOverview       = { enabled = true }
  }
}
