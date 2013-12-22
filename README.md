# Opscode Chef cookbook for the Titan

Installs the graph database Titan server package including the Rexster server for HTTP access in version 0.4.1 and utilizing the Apache Cassandra backend in version 0.2.2.

Please not that when trying to glue together different versions of Titan and Apache Cassandra this must conform to the [compatibility index](thinkaurelius.github.io/titan/wikidoc/0.4.1/Version-Compatibility.html).

Cookbook dependecies are managed by Berkshelf (see Berksfile meta file)

## Using vagrant

1. Install [Vagrant](http://www.vagrantup.com/)
2. Install [Berkshelf](http://berkshelf.com/)
3. `$ vagrant box add precise64 http://files.vagrantup.com/precise64.box`
4. $ `vagrant plugin install vagrant-omnibus`
5. $ `vagrant plugin install vagrant-berkshelf`
6. $ `berks install`
7. $ `vagrant up`

## License

Copyright 2013 Martin Biermann

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
