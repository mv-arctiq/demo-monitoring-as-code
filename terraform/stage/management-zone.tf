module "management-zone" {
  name        = "tf-my-team-stage"
  source      = "git::git@github.com:SolalVall/terraform-dynatrace-modules.git//management-zone?ref=main"
  description = "This terraform MZ is automatically created using Terraform."
  dimension_rules = [
    {
      dimension_rule = {
        applies_to = "LOG"
        dimension_conditions = [
          {
            condition_type = "DIMENSION"
            key            = "log.source"
            rule_matcher   = "EQUALS"
            value          = "sandbox-1"
          }
        ]
      }
    }
  ]
  attribute_rules = [
    {
      attribute_rule = {
        entity_type = "WEB_APPLICATION"
        attribute_conditions = [
          {
            key      = "WEB_APPLICATION_TAGS"
            operator = "EQUALS"
            tag      = "team-name:my-team"
          }
        ]
      }
    },
    {
      attribute_rule = {
        entity_type = "KUBERNETES_CLUSTER"
        attribute_conditions = [
          {
            key          = "KUBERNETES_CLUSTER_NAME"
            operator     = "EQUALS"
            string_value = "sandbox-1"
          }
        ]
      }
    },
    {
      attribute_rule = {
        entity_type                 = "SERVICE"
        service_to_pgpropagation    = true
        service_to_host_propagation = true
        attribute_conditions = [
          {
            key          = "KUBERNETES_CLUSTER_NAME"
            operator     = "EQUALS"
            string_value = "sandbox-1"
          }
        ]
      }
    },
    {
      attribute_rule = {
        entity_type           = "HOST"
        host_to_pgpropagation = true
        attribute_conditions = [
          {
            key          = "KUBERNETES_CLUSTER_NAME"
            operator     = "EQUALS"
            string_value = "sandbox-1"
          }
        ]
      }
    },
    {
      attribute_rule = {
        entity_type = "KUBERNETES_SERVICE"
        attribute_conditions = [
          {
            key          = "KUBERNETES_CLUSTER_NAME"
            operator     = "EQUALS"
            string_value = "sandbox-1"
          }
        ]
      }
    },
    {
      attribute_rule = {
        entity_type = "CLOUD_APPLICATION"
        attribute_conditions = [
          {
            key          = "KUBERNETES_CLUSTER_NAME"
            operator     = "EQUALS"
            string_value = "sandbox-1"
          }
        ]
      }
    },
    {
      attribute_rule = {
        entity_type = "CLOUD_APPLICATION_NAMESPACE"
        attribute_conditions = [
          {
            key          = "KUBERNETES_CLUSTER_NAME"
            operator     = "EQUALS"
            string_value = "sandbox-1"
          }
        ]
      }
    }
  ]
}
