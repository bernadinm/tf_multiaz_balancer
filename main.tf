# Creates a unique id and returns a list-string 
# list are not supported in templates as outputs. Only strings. 
data "template_file" "zone-by-name" {
  template = "$${zone-1},$${zone-2},$${zone-3},$${zone-4},$${zone-5},$${zone-6}"
  vars {
    zone-1 = "${1 <= length(distinct(var.list_of_zones)) ? element(distinct(var.list_of_zones), 0) : ""}"
    zone-2 = "${2 <= length(distinct(var.list_of_zones)) ? element(distinct(var.list_of_zones), 1) : ""}"
    zone-3 = "${3 <= length(distinct(var.list_of_zones)) ? element(distinct(var.list_of_zones), 2) : ""}"
    zone-4 = "${4 <= length(distinct(var.list_of_zones)) ? element(distinct(var.list_of_zones), 3) : ""}"
    zone-5 = "${5 <= length(distinct(var.list_of_zones)) ? element(distinct(var.list_of_zones), 4) : ""}"
    zone-6 = "${6 <= length(distinct(var.list_of_zones)) ? element(distinct(var.list_of_zones), 5) : ""}"
   }
}

# Counts which row needs to be removed and sums them together as a string
data "template_file" "confirmed_removed_zones" {
 template ="$${remove_zone-1}+$${remove_zone-2}+$${remove_zone-3}+$${remove_zone-4}+$${remove_zone-5}+$${remove_zone-6}"

 vars {
  remove_zone-1 = "${contains(distinct(var.list_of_zones), 1 <= length(var.exclude_list_of_zones) ? element(var.exclude_list_of_zones, 0) : "null" ) ? 1 : "0" }"
  remove_zone-2 = "${contains(distinct(var.list_of_zones), 2 <= length(var.exclude_list_of_zones) ? element(var.exclude_list_of_zones, 1) : "null" ) ? 1 : "0" }"
  remove_zone-3 = "${contains(distinct(var.list_of_zones), 3 <= length(var.exclude_list_of_zones) ? element(var.exclude_list_of_zones, 2) : "null" ) ? 1 : "0" }"
  remove_zone-4 = "${contains(distinct(var.list_of_zones), 4 <= length(var.exclude_list_of_zones) ? element(var.exclude_list_of_zones, 3) : "null" ) ? 1 : "0" }"
  remove_zone-5 = "${contains(distinct(var.list_of_zones), 5 <= length(var.exclude_list_of_zones) ? element(var.exclude_list_of_zones, 4) : "null" ) ? 1 : "0" }"
  remove_zone-6 = "${contains(distinct(var.list_of_zones), 6 <= length(var.exclude_list_of_zones) ? element(var.exclude_list_of_zones, 5) : "null" ) ? 1 : "0" }"
 }
}

# Converts the confirmed_removed_zones list to a sum
data "template_file" "sum_of_excluded_list" {
 template = "${element(split("+",data.template_file.confirmed_removed_zones.rendered), 0) + element(split("+",data.template_file.confirmed_removed_zones.rendered), 1) + element(split("+",data.template_file.confirmed_removed_zones.rendered), 2) + element(split("+",data.template_file.confirmed_removed_zones.rendered), 3) + element(split("+",data.template_file.confirmed_removed_zones.rendered), 4) + element(split("+",data.template_file.confirmed_removed_zones.rendered), 5)}"
}

# Each zone calculates their own number of nodes available for use.
data "template_file" "zone-1" {
 template = "${!contains(var.exclude_list_of_zones, element(split(",", data.template_file.zone-by-name.rendered),0)) ? (length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered) >= (1 - data.template_file.sum_of_excluded_list.rendered) ? var.num_of_nodes % (length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered) >= 1 ? ceil(var.num_of_nodes / abs((length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered))) : floor(var.num_of_nodes / abs((length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered))) : 0 : 0}"
}

data "template_file" "zone-2" {
 template = "${!contains(var.exclude_list_of_zones, element(split(",", data.template_file.zone-by-name.rendered),1)) ? (length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered) >= (2 - data.template_file.sum_of_excluded_list.rendered) ? var.num_of_nodes % (length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered) >= 2 ? ceil(var.num_of_nodes / abs((length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered))) : floor(var.num_of_nodes / abs((length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered))) : 0 : 0}"
}

data "template_file" "zone-3" {
 template = "${!contains(var.exclude_list_of_zones, element(split(",", data.template_file.zone-by-name.rendered),2)) ? (length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered) >= (3 - data.template_file.sum_of_excluded_list.rendered)  ? var.num_of_nodes % (length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered) >= 3 ? ceil(var.num_of_nodes / abs((length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered))) : floor(var.num_of_nodes / abs((length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered))) : 0 : 0}"
}

data "template_file" "zone-4" {
 template = "${!contains(var.exclude_list_of_zones, element(split(",", data.template_file.zone-by-name.rendered),3)) ? (length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered) >= (4 - data.template_file.sum_of_excluded_list.rendered) ? var.num_of_nodes % (length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered) >= 4 ? ceil(var.num_of_nodes / abs((length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered))) : floor(var.num_of_nodes / abs((length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered))) : 0 : 0}"
}

data "template_file" "zone-5" {
 template = "${!contains(var.exclude_list_of_zones, element(split(",", data.template_file.zone-by-name.rendered),4)) ? (length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered) >= (5 - data.template_file.sum_of_excluded_list.rendered) ? var.num_of_nodes % (length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered) >= 5 ? ceil(var.num_of_nodes / abs((length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered))) : floor(var.num_of_nodes / abs((length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered))) : 0 : 0}"
}

data "template_file" "zone-6" {
 template = "${!contains(var.exclude_list_of_zones, element(split(",", data.template_file.zone-by-name.rendered),5)) ? (length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered) >= (6 - data.template_file.sum_of_excluded_list.rendered) ? var.num_of_nodes % (length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered) >= 6 ? ceil(var.num_of_nodes / abs((length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered))) : floor(var.num_of_nodes / abs((length(distinct(var.list_of_zones)) - data.template_file.sum_of_excluded_list.rendered))) : 0 : 0}"
}
