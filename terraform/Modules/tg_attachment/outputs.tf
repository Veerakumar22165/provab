output "tg_attachment_id" {
  value = "${aws_lb_target_group_attachment.tg_attachment.*.id}"
}
