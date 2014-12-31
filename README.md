# sprockets-illusionist

[![Gem Version](http://img.shields.io/gem/v/sprockets-illusionist.svg)](https://rubygems.org/gems/sprockets-illusionist)
[![Code Climate](http://img.shields.io/codeclimate/github/mirego/sprockets-illusionist.svg)](https://codeclimate.com/github/mirego/sprockets-illusionist)

`sprockets-illusionist` makes it possible to transpile your ES6 files into ES5 using the [Illusionist node module](https://github.com/mirego/illusionist) and Sprockets.

**This entire guide assumes that you have [node](http://nodejs.org) and [npm](http://npmjs.org) already installed on your local machine.**

## Installation

First, you will need the [Illusionist](https://github.com/mirego/illusionist) node package:

```bash
$ npm install -g illusionist
```

Add this line to your application’s `Gemfile`:

```ruby
gem 'sprockets-illusionist'
```

And then execute:

```bash
$ bundle
```

## Usage

### Options

- `module_type`

	The module type you want to use.

	Available options: `amd`, `cjs` and `globals`

	Default: `amd`

- `base_path` (only applies to AMD modules)

	The `base_path` setting is used to name modules. Module names are relative paths to `base_path`, if you don’t set it, only the file name is used.

- `node_path`

	The path to the node executable.

- `illusionist_path`

	The path to the `illusionist` executable.


### Integrating with Rails

Create an initializer:

```ruby
# sprockets_illusionist.rb
SprocketsIllusionist::Config.configure do |config|
  config.base_path = Rails.root.join('app', 'assets', 'javascripts')

  # You can also choose which module format you want.
  # 'amd' is the default, other options are: 'cjs' and 'globals'
  config.module_type = 'amd'
end
```

With this configuration, a file named:

```
/projects/MyApp/app/assets/javascripts/controllers/foo_controller.js.es6
```

will yield a module named:

```
controllers/foo_controller
```

### Writing ES6 files

With `sprockets-illusionist` just write your JavaScript files with the extension `.js.es6` and everything will be transpiled for you.

## Deploying on Heroku

1. You will need to use [heroku-buildpack-multi](https://github.com/heroku/heroku-buildpack-multi) to install node and Ruby.

	Tell Heroku to use the right buildpack:

	```bash
	$ heroku config:add BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-multi.git
	```

	Create a `.buildpacks` file with the following content:

	```
	https://github.com/heroku/heroku-buildpack-nodejs.git
	https://github.com/heroku/heroku-buildpack-ruby.git
	```

2. You will need to include `illusionist` as a dependency of your project.

	Create a `package.json` file with the following content:

	```json
	{
	  "name": "Your-Project",
	  "version": "0.0.1",
	  "dependencies": {
	    "illusionist": "~<insert latest version>"
	  }
	}
	```

	Install the dependencies on your local machine for development:

	```bash
	$ npm install
	```

	**Note that `heroku-buildpack-nodejs` does that for you at deploy time.**

3. You will need to link to the local installation of `illusionist` and node to get the latest version.

	Your initializer should look like this:

	```ruby
	SprocketsIllusionist::Config.configure do |config|
	  config.node_path = ENV['NODE_BIN_PATH']
	  config.illusionist_path = ENV['ILLUSIONIST_BIN_PATH']
	  config.base_path = Rails.root.join('app', 'assets', 'javascripts')
	  config.module_type = 'amd'
	end
	```

	Then in `.env` on your local machine:

	```
	NODE_BIN_PATH=node
	ILLUSIONIST_BIN_PATH=./node_modules/.bin/illusionist
	```

	Finally, set these environment variables on Heroku:

	```bash
	$ heroku config:set NODE_BIN_PATH=./.heroku/node/bin/node
	$ heroku config:set ILLUSIONIST_BIN_PATH=./node_modules/.bin/illusionist
	```

## Contributors

* [@charlesdemers](https://github.com/charlesdemers)
* [@remiprev](https://github.com/remiprev)

## License

`sprockets-illusionist` is © 2014-2015 [Mirego](http://www.mirego.com) and may be freely distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause).
See the [`LICENSE.md`](https://github.com/mirego/sprockets-illusionist/blob/master/LICENSE.md) file.

## About Mirego

[Mirego](http://mirego.com) is a team of passionate people who believe that work is a place where you can innovate and have fun. We’re a team of [talented people](http://life.mirego.com) who imagine and build beautiful Web and mobile applications. We come together to share ideas and [change the world](http://mirego.org).

We also [love open-source software](http://open.mirego.com) and we try to give back to the community as much as we can.
