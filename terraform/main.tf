module "management_zone_v2_test-demo-tf" {
  name        = "test-demo-tf"
  source      = "git::ssh://git@github.com/SolalVall/terraform-dynatrace-modules.git//management-zone?ref=main"
  description = "This terraform MZ is automatically created using Terraform"
  entity_selector_rules = [
    { selector = "type(\"SERVICE\"),tag(\"test1\")" },
    { selector = "type(\"SERVICE\"),tag(\"test2\")" },
    { selector = "type(\"SERVICE\"),tag(\"test3\")" },
    { selector = "type(\"SERVICE\"),tag(\"test4\")" },
    {
      enabled  = false
      selector = "type(\"SERVICE\"),tag(\"test4b\")"
    }
  ]
  dimension_rules = [
    {
      dimension_rule = {
        applies_to = "METRIC"
        dimension_conditions = [
          {
            condition_type = "METRIC_KEY"
            rule_matcher   = "BEGINS_WITH"
            value          = "foo"
          },
          {
            condition_type = "DIMENSION"
            key            = "dim_key"
            rule_matcher   = "BEGINS_WITH"
            value          = "dim_value"
          }
        ]
      }
    },
    {
      enabled = false
      dimension_rule = {
        applies_to = "LOG"
        dimension_conditions = [
          {
            condition_type = "LOG_FILE_NAME"
            rule_matcher   = "EQUALS"
            value          = "foobar.log"
          },
        ]
      }
    }
  ]
  attribute_rules = [
    {
      attribute_rule = {
        entity_type              = "SERVICE"
        service_to_pgpropagation = true
        attribute_conditions = [
          {
            key          = "SERVICE_DETECTED_NAME"
            operator     = "BEGINS_WITH"
            string_value = "my_servcice_test"
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
            key          = "HOST_GROUP_NAME"
            operator     = "EQUALS"
            string_value = "my_host_group_name_FOO"
          },
          {
            key          = "HOST_GROUP_NAME"
            operator     = "EQUALS"
            string_value = "my_host_group_name_BAR"

          }
        ]
      }
    },
    {
      enabled = false
      attribute_rule = {
        entity_type               = "PROCESS_GROUP"
        pg_to_host_propagation    = true
        pg_to_service_propagation = true
        attribute_conditions = [
          {
            key                = "PROCESS_GROUP_CUSTOM_METADATA"
            operator           = "CONTAINS"
            string_value       = "my_metadata_value"
            dynamic_key        = "my_metadata_key"
            dynamic_key_source = "test"
          }
        ]
      }
    },
    {
      attribute_rule = {
        entity_type = "WEB_APPLICATION"
        attribute_conditions = [
          {
            key      = "WEB_APPLICATION_TAGS"
            operator = "EQUALS"
            tag      = "Mytagkey:Mytagvalue"
          }
        ]
      }
    }
  ]
}
