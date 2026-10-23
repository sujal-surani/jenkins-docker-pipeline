output "jenkins_server_public_ip" {
  description = "Public IP of the Jenkins server"
  value       = aws_instance.jenkins_server.public_ip
}

output "jenkins_dashboard_url" {
  description = "Access Jenkins here once initialization completes"
  value       = "http://${aws_instance.jenkins_server.public_ip}:8080"
}