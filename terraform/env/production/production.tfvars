module_version = "0.38.0"

region = "ap-southeast-1"

availability_zones = ["ap-southeast-1a", "ap-southeast-1b"]

namespace = "default"

stage = "production"

name = "eks"

kubernetes_version = "1.19"

oidc_provider_enabled = true

enabled_cluster_log_types = ["audit"]

cluster_log_retention_period = 7

instance_types = ["t3.small"]

desired_size = 2

max_size = 3

min_size = 2

disk_size = 20

kubernetes_labels = {}

cluster_encryption_config_enabled = false
