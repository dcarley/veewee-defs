def create_vm(config, name, box)
    domain = "veewee"

    config.vm.define name do |c|
        c.vm.box            = box
        fqdn                = "#{name}.#{domain}"
        c.vm.host_name      = fqdn
        c.vm.customize      ["modifyvm", :id, "--name", fqdn]
    end
end

Vagrant::Config.run do |config|
    create_vm(config, :cent5, "centos58-puppet26")
    create_vm(config, :cent6, "centos62-puppet26")
end
