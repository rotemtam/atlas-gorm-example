data "external_schema" "gorm" {
  program = [
    "go",
    "run",
    "-mod=mod",
    "ariga.io/atlas-provider-gorm",
    "load",
    "--path", "./models",
    "--dialect", "postgres",
  ]
}

env "gorm" {
  url = data.external_schema.gorm.url
  src = data.external_schema.gorm.url
  migration {
    dir = "file://migrations"
  }
  dev = "docker://postgres/15/dev?search_path=public"
}
