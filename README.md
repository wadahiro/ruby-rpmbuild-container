
# Build ruby-2.1.x rpm on Docker container

## Requirements

* [VirtualBox](http://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/)


## How to build rpm

1. Clone this project
    ```bash
    $ git clone https://github.com/wadahiro/ruby-rpmbuild-container.git
    ```

2. Start the guest machine
    ```bash
    $ cd ruby-rpmbuild-container
    $ vagrant up
    $ vagrant ssh
    ```

3. Build docker container
    ```
    $ cd /tmp/rpmbuild
    $ sudo docker build -t <USERNAME>/rubybuild .
    ```

4. rpmbuild in the container
    ```bash
    $ sudo docker run --rm -v $PWD:/shared:rw -it <CONTAINER_ID> /bin/sh ./rubybuild.sh
    ```

5. check the rpm file on virtual machine
    ```bash
    $ ls *.rpm
    ruby-2.1.2-2.el6.x86_64.rpm
    ```

Enjoy!
