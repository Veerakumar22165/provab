resource "aws_ebs_volume" "extra" {
  count = "${length(var.azs)}"
  availability_zone = "${element(var.azs, count.index)}"
  size              = "${var.extra-volume-size}"
  tags = {
    Name = "${element(var.volumename, count.index)}"
    ENV  = "for extera-volume"
  }
}
resource "aws_volume_attachment" "ebs_att" {
  count = "${length(var.azs)}"
  device_name = "/dev/xvdf"
  volume_id   = "${element(aws_ebs_volume.extra.*.id, count.index)}"
  instance_id = "${element(var.instances-id, count.index)}"
}
