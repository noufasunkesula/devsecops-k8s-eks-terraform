resource "aws_iam_instance_profile" "k8s_noufa_instance_profile" {
  name = "k8s-noufa-jenkins-server-instance-profile"
  role = aws_iam_role.k8s_noufa_iam_role.name
}
