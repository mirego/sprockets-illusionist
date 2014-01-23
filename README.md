# sprockets-illusionist

`sprockets-illusionist` makes it possible to transpile your ES6 files into ES5 using the Illusionist node module and Sprockets.

## Installation

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

```
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

Mirego is a team of passionate people who believe that work is a place where you can innovate and have fun. We proudly build mobile applications for [iPhone](http://mirego.com/en/iphone-app-development/ "iPhone application development"), [iPad](http://mirego.com/en/ipad-app-development/ "iPad application development"), [Android](http://mirego.com/en/android-app-development/ "Android application development"), [Blackberry](http://mirego.com/en/blackberry-app-development/ "Blackberry application development"), [Windows Phone](http://mirego.com/en/windows-phone-app-development/ "Windows Phone application development") and [Windows 8](http://mirego.com/en/windows-8-app-development/ "Windows 8 application development") in beautiful Quebec City.

We also love [open-source software](http://open.mirego.com/) and we try to extract as much code as possible from our projects to give back to the community.
