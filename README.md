# Mocatra

[![Build Status](https://travis-ci.org/shoyan/mocatra.svg?branch=master)](https://travis-ci.org/shoyan/mocatra)

Mocatra is mock server with sinatra. Returns set in the response file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mocatra'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mocatra

## Usage

First, create file and records directory.

```
$ touch app.rb
$ mkdir records
```

Edit app.rb as follows:

```ruby
require 'mocatra'
Mocatra::App.record_path = './records/'
Mocatra::App.run!
```

Create records/index.yml.

```yml
---
status: 200
body:
  version: '1'
  result: OK
```

Server start as follows:

```
$ ruby app.rb
== Sinatra (v1.4.7) has taken the stage on 4567 for development with backup from Thin
Thin web server (v1.6.4 codename Gob Bluth)
Maximum connections set to 1024
Listening on 0.0.0.0:4567, CTRL+C to stop
```

Exec API as follows:

```
$ curl http://localhost:4567 -i 
HTTP/1.1 200 OK
Content-Type: text/html;charset=utf-8
Content-Length: 29
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
Connection: keep-alive
Server: thin

{"version":"1","result":"OK"}
```

The content of index.yml is returned.

### Define response

Creates response file in the record_path directory.
Response file is required status code and body.
For example.

```
---
status: 200
body:
  version: '1'
  result: OK
```

records/index.yml will correspond to the following URL.

```
http://localhost:4567
```

* `http://localhost:4567/user` correspond `records/user.yml`.
* `http://localhost:4567/user/` correspond `records/user/index.yml`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shoyan/mocatra. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

