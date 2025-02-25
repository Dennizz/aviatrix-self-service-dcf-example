data "aviatrix_caller_identity" "test" {

}

output "test123" {
  value = data.aviatrix_caller_identity.test
}
