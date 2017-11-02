# List number of nodes to load balance across zones
variable "num_of_nodes" {
  default = "3"
}

# Input to the list of zones to loadbalance. Only a unique set will be used.
variable "list_of_zones" {
  default = ["us-west-1a", "us-west-1c", "us-west-1d"]
}

# Input to the list of zones to remove from var.list_of_zones
variable "exclude_list_of_zones" {
  default = ["us-west-1b"]
}
