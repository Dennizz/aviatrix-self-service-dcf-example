data "aviatrix_caller_identity" "test" {

}

output "test" {
  value = data.aviatrix_caller_identity.test
}
