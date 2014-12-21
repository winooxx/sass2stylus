# Sass2stylus

Convert any number of sass files to stylus files in a ruby script or on the command line. If you're looking for an online option, you should use [sass2stylus.com](http://sass2stylus.com/). This project is essentially an all-ruby version of [@mojotech's work](https://github.com/mojotech/sass2stylus/) meant to be used on the command line.

## Installation

To use Sass2Stylus as a command line utility, install the gem:

```
$ gem install sass2stylus
```

To use in your ruby project, add this line to your application's Gemfile:

```ruby
gem 'sass2stylus'
```

And then install with your other dependencies:

```
$ bundle install
```

## Usage

```
$ sass2stylus sass/folder/**/*.scss stylus/folder
```

First argument is a glob-formatted pattern which explains where the sass files are. These can be `.sass` or `.scss` files. Use the `**` pattern to recursively search a directory for sass files.

The second argument is a folder where you'd like to dump the generated stylus files. **Note** The folder structure of the sass folder will be preserved in the stylus folder.

## Ruby Class API

To use this gem in a ruby project, just import it and set up a new instance of the `Utitlities` class and pass a blob of sass files into stylus by calling:

```
require 'sass2stylus'
util = Sass2stylus::Utilities.new
util.batch(Pathname.pwd, '**/*.scss', 'stylus')
```

Pass in the base directory, the path to the sass files, and the relative path to the folder you'd like to use for output. (If you supply a folder that doesn't exist, the script will make it for you.)

## Contributing

1. Fork it ( https://github.com/paulcpederson/sass2stylus/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
