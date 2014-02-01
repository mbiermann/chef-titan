# Chef cookbook Titan graph database

Opscode Chef cookbook for installing the graph database Titan server including the Rexster server for HTTP access in version 0.4.1 and utilizing the Apache Cassandra backend in version 1.2.2.

Target system: Ubuntu/Linux

Please not that when trying to glue together different versions of Titan and Apache Cassandra this must conform to the [compatibility index](http://thinkaurelius.github.io/titan/wikidoc/0.4.1/Version-Compatibility.html).

Cookbook dependecies are managed by Berkshelf (see Berksfile meta file)

## Attributes

### Default recipe

	{
		"titan": {
			"graph": "sample_graph",
			"download_url": "http://s3.thinkaurelius.com/downloads/titan/titan-server-0.4.1.zip",
  			"bundle": "titan-server-0.4.1.zip",
  			"installation_dir": "/usr/local/titan",
  			"user": "titan"
  		},
  		"java": {
  			"install_flavor": "oracle",
			"jdk_version": "7"
			"oracle": {
				"accept_oracle_download_terms": true
			}
		}
	}

### OpsCenter recipe

	{
		"opscenter": {
			"clusters": {
				"seeds": "10.0.1.0,10.0.1.1,10.0.1.2"
			}
		}
	}

## Using vagrant

1. Install [Vagrant](http://www.vagrantup.com/)
2. Install [Berkshelf](http://berkshelf.com/)
3. `$ vagrant box add precise64 http://files.vagrantup.com/precise64.box`
4. `$ vagrant plugin install vagrant-omnibus`
5. `$ vagrant plugin install vagrant-berkshelf`
6. `$ berks install`
7. `$ vagrant up`

## Test

Cookbook testing is powered by [Test-Kitchen](https://github.com/test-kitchen/test-kitchen/wiki/Getting-Started) using Vagrant via kitchen-vagrant driver. To run the tests, follow these steps:

1. Install bundler via `gem install bundler`
2. Install test-kitchen from `Gemfile` file using bunder via `bundle install`
3. Run test-kitchen to test the configuration setup within all platforms specified in the `.kitchen.yml` confuration file.

## License

The MIT License (MIT)

Copyright (c) 2013 Martin Biermann

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
