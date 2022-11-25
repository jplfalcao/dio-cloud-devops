output "instance_ip" {
  value = google_compute_instance.infoall_terraform.network_interface.0.network_ip
}