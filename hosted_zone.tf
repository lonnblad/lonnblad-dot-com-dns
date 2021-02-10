data "google_dns_managed_zone" "root" {
  name = "lonnblad"
}

resource "google_dns_record_set" "developer" {
  name = "developer.${data.google_dns_managed_zone.root.dns_name}"
  type = "TXT"
  ttl  = 300

  managed_zone = data.google_dns_managed_zone.root.name

  rrdatas = ["test"]
}
