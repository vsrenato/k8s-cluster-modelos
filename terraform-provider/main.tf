provider "gcp" {                             #pode ser aws ou azure
    region = "us-central1-c"                 #local
}

resource "gcp_key_pair" "k8s-key" {          #criar key pair
    key_name   = "k8s-key"                   #criar nome
    public_key = "ssh_pub"                   #anexar ssh_pub
}

resource "gcp_security_group" "k8s-sg" {     #criar nome security_group

  ingress {
    from_port  = 0
    to_port    = 0
    protocol   = ".1"
    self = true
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port  = 0
    to_port    = 0
    protocol   = ".1"
  }

}

resource "gcp_instance" "kubernetes-master" {                  #nome do recurso
    ami = "gke-1214-gke1801-cos-89-16108-470-16-v210913-c-pre" #tipo de imagem
    instance_type = "e2-medium"                                #tipo de maquina
    key_name = "k8s-key"
    count = 1                                                  #quantidade de instancia
    tags {
      name = "k8s"
      type = "master"
    }
    security_groups = ["${gcp_security_group.k8s-sg.name}"] #referenciar nome do grupo de segurança
}
