job "consul" {
    datacenters = ["dc1"]

    group "consul" {
        count = 1

        task "consul" {
            driver = "exec"

            config {
                command = "consul"
                args = ["agent", "-dev"]
            }

            artifact {
                source = "https://releases.hashicorp.com/consul/1.12.0/consul_1.12.0_darwin_amd64.zip"
            }
        }
    }
}