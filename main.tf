locals {
  #load all yaml files
  webgroups   = yamldecode(file("webgroups.yaml"))
  smartgroups = yamldecode(file("smartgroups.yaml"))
  policies    = yamldecode(file("policies.yaml"))
}

# Create all the webgroups
resource "aviatrix_web_group" "this" {
  for_each = local.webgroups

  name = each.key

  selector {
    dynamic "match_expressions" {
      for_each = try(each.value.urlfilter, try(each.value.snifilter, []))

      content {
        snifilter = contains(keys(each.value), "snifilter") ? match_expressions.value : null
        urlfilter = contains(keys(each.value), "urlfilter") ? match_expressions.value : null
      }
    }
  }
}

# Create all the smartgroups
resource "aviatrix_smart_group" "this" {
  for_each = local.smartgroups

  name = each.key

  selector {
    dynamic "match_expressions" {
      for_each = try(each.value.match_expressions, [])

      content {
        type           = try(match_expressions.value.type, null)
        tags           = try(match_expressions.value.tags, null)
        region         = try(match_expressions.value.region, null)
        k8s_pod        = try(match_expressions.value.k8s_pod, null)
        k8s_namespace  = try(match_expressions.value.k8s_namespace, null)
        k8s_cluster_id = try(match_expressions.value.k8s_cluster_id, null)
        k8s_service    = try(match_expressions.value.k8s_service, null)
        cidr           = try(match_expressions.value.cidr, null)
        fqdn           = try(match_expressions.value.fqdn, null)
        site           = try(match_expressions.value.site, null)
        res_id         = try(match_expressions.value.res_id, null)
        account_id     = try(match_expressions.value.account_id, null)
        account_name   = try(match_expressions.value.account_name, null)
        name           = try(match_expressions.value.name, null)
        zone           = try(match_expressions.value.zone, null)
        s2c            = try(match_expressions.value.s2c, null)
        external       = try(match_expressions.value.external, null)
        ext_args       = try(match_expressions.value.ext_args, null)
      }
    }
  }
}

