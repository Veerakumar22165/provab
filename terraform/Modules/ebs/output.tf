output "extra-volume-id" {
  value = "${aws_ebs_volume.extra.*.id}"
}
