provider "inserir nome como: aws, google e azure" {
 credentials = file("name.json")
 project = "inserir identificação de projeto" 
 region = "inserir região conforme exemplo:" "us-central1-c" 

 zone = "inserir zona conforme exemplo:" "us-central1-c"
 resource = "inserir recurso do API" "gcloud"
 name = "copy file:///inserir qual diretório $/Pasta"Documentos"/inserir nome do projeto.json"
}