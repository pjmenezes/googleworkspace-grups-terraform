provider "googleworkspace" {
  credentials             = "${file("serviceaccount.yaml")}"
  customer_id             = "C03ryq21a" #id do cliente  https://admin.google.com/ac/accountsettings/profile
  impersonated_user_email = "algumacoisa@seudominioprincial.com" #email principal Google Workspace
  oauth_scopes = [
    "https://www.googleapis.com/auth/admin.directory.user",
    "https://www.googleapis.com/auth/admin.directory.userschema",
    "https://www.googleapis.com/auth/admin.directory.group",	
    # include scopes as needed
  ]
}
#criando o grupo
resource "googleworkspace_group" "devops" {
  email       = "algumacoisa@seudominioprincial.com"
  name        = "Devops"
  description = "Devops Group"

  aliases = ["dev-ops@seudominioprincial.com"]

  timeouts {
    create = "1m"
    update = "1m"
  }
}
#criando usuario
resource "googleworkspace_user" "name" {
  primary_email = "name@seudominio.com"
  password      = "senhapraconta"
  hash_function = "MD5"

  name {
    family_name = "name"
    given_name  = "user"
  }
}
#associando
resource "googleworkspace_group_member" "manager" {
  group_id = googleworkspace_group.devops.id
  email    = googleworkspace_user.name.primary_email

  role = "MANAGER"
}