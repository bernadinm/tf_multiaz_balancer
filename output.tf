# Output Section
output "num_of_nodes" {
 value = "${var.num_of_nodes}"
}

output "available-zones" {
 value = "${length(distinct(var.list_of_zones))}"
}

output "zone-1-name" {
 value = "${element(split(",", data.template_file.zone-by-name.rendered),0)}"
}

output "zone-2-name" {
 value = "${element(split(",", data.template_file.zone-by-name.rendered),1)}"
}

output "zone-3-name" {
 value = "${element(split(",", data.template_file.zone-by-name.rendered),2)}"
}

output "zone-4-name" {
 value = "${element(split(",", data.template_file.zone-by-name.rendered),3)}"
}

output "zone-5-name" {
 value = "${element(split(",", data.template_file.zone-by-name.rendered),4)}"
}

output "zone-6-name" {
 value = "${element(split(",", data.template_file.zone-by-name.rendered),5)}"
}

output "zone-1-count" {
 value = "${data.template_file.zone-1.rendered}"
}

output "zone-2-count" {
 value = "${data.template_file.zone-2.rendered}"
}

output "zone-3-count" {
 value = "${data.template_file.zone-3.rendered}"
}

output "zone-4-count" {
 value = "${data.template_file.zone-4.rendered}"
}

output "zone-5-count" {
 value = "${data.template_file.zone-5.rendered}"
}

output "zone-6-count" {
 value = "${data.template_file.zone-6.rendered}"
}

output "zone-by-name" {
 value = "${split(",",data.template_file.zone-by-name.rendered)}"
}
