# sprockets-illusionist

`sprockets-illusionist` makes it possible to transpile your ES6 files into ES5 using the [Illusionist node module](https://github.com/mirego/illusionist) and Sprockets.

## Installation

First, you will need the [Illusionist](https://github.com/mirego/illusionist) node package:

```bash
$ npm install -g illusionist
```

Add this line to your application’s Gemfile:

```ruby
gem 'sprockets-illusionist'
```

And then execute:

```bash
$ bundle
```

## Usage

### Setting the `base_path`

The `base_path` setting is used to name modules. Module names are relative paths to `base_path`, if you don’t set it, only the file name is used.

#### Using Rails

Create an initializer:

```ruby
SprocketsIllusionist::Config.configure do |config|
  config.base_path = Rails.root.join('app', 'assets', 'javascripts')
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

## License

`sprockets-illusionist` is © 2014 [Mirego](http://www.mirego.com) and may be freely distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause).
See the [`LICENSE.md`](https://github.com/mirego/sprockets-illusionist/blob/master/LICENSE.md) file.

## About Mirego

[Mirego](http://mirego.com) is a team of passionate people who believe that work is a place where you can innovate and have fun. We're a team of [talented people](http://life.mirego.com) who imagine and build beautiful Web and mobile applications. We come together to share ideas and [change the world](http://mirego.org).

We also [love open-source software](http://open.mirego.com) and we try to give back to the community as much as we can.
