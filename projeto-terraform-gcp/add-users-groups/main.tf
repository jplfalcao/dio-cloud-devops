provider "googleworkspace" {
  credentials             = "${file("serviceaccount.yml")}"
  customer_id             = "C02sg8pie"
  impersonated_user_email = "falcao@jplfalcao.com.br"
  oauth_scopes = [
    "https://www.googleapis.com/auth/admin.directory.user",
    "https://www.googleapis.com/auth/admin.directory.userschema",
    "https://www.googleapis.com/auth/admin.directory.group",	
  ]
}

resource "googleworkspace_group" "devops" {
  email       = "devops@jplfalcao.com.br"
  name        = "DevOps"
  description = "DevOps Group"

  aliases = ["dev-ops@jplfalcao.com.br"]

  timeouts {
    create = "1m"
    update = "1m"
  }
}

resource "googleworkspace_user" "void" {
  primary_email = "void@jplfalcao.com.br"
  password      = "cab8111fd0b710a336c898e539090e34"
  hash_function = "MD5"

  name {
    family_name = "Berserk"
    given_name  = "Void"
  }
}

resource "googleworkspace_user" "femto" {
  primary_email = "femto@jplfalcao.com.br"
  password      = "de06ed8dfc218126aa1bfbb9385f612e"
  hash_function = "MD5"

  name {
    family_name = "Berserk"
    given_name  = "Femto"
  }
}

resource "googleworkspace_user" "slan" {
  primary_email = "slan@jplfalcao.com.br"
  password      = "caaad522de864ab45ed679c4a16edd8d"
  hash_function = "MD5"

  name {
    family_name = "Berserk"
    given_name  = "Slan"
  }
}

resource "googleworkspace_group_members" "devops" {
  group_id = googleworkspace_group.devops.id

  members {
  	email = googleworkspace_user.void.primary_email
  	role  = "MANAGER"
  }
  
  members {
  	email = googleworkspace_user.femto.primary_email
	role  = "MEMBER"
  }

  members {
  	email = googleworkspace_user.slan.primary_email
  	role  = "MEMBER"
  }
}
