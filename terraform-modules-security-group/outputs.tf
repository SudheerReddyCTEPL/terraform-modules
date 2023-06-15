output "public_sg_id" {
  value = aws_security_group.public_sg.id
}
output "workernode_sg_id" {
  value = aws_security_group.workernode_sg.id
}
output "control_plane_sg_id" {
  value = aws_security_group.control_plane_sg.id
}
