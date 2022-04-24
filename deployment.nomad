job "deployment" {
    datacenters = ["dc1"]
    type = "service"

    group "deployment" {
        #count = 1
        scaling {
            enabled = true
            min = 3
            max = 5
            #policy = {}
        }

        task "deployment" {
            driver = "docker"

            config {
                image = "priyanshushriv/nodeapp_sensehawk"
            }
            
            env {
                PORT = "${NOMAD_PORT_http}"

            }

            resources {
                network {
                    port "http" {
                        #static = 5000
                    }
                }
            }
            service {
                name = "deployment"
                port = "http"

                tags = [
                    "frontend",
                    "traefik.enable=true",
                    "traefik.http.routers.http.rule=Path(`/`)",
                ]
                check {
                    type = "http"
                    path = "/"
                    interval = "5s"
                    timeout = "2s"
                }
            }
        }
    }
}