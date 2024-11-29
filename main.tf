resource "google_compute_instance" "test-im" {
  name         = "im"
  project      = "gsd-dentsu-umang"
  machine_type = "n2-standard-2"
  zone         = "asia-east1-c"
  tags         = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "ugam-vpc"

    access_config {
      // Ephemeral public IP
    }
  }


}
