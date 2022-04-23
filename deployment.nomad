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
        }
    }
}