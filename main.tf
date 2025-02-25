data "aviatrix_caller_identity" "test" {

}

output "test2" {
  value = data.aviatrix_caller_identity.test
}
