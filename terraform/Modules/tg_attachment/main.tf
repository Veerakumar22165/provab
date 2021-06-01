resource "aws_lb_target_group_attachment" "tg_attachment" {
  count = "${length(var.tg_attachment_data)}"
  target_group_arn = "${element(var.target_group_arn,count.index)}"
  target_id        = "${element(var.target_id,count.index)}"
  port             = "${lookup(var.tg_attachment_data[count.index],"port")}"
}
