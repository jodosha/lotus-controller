# Lotus::Controller

Controller layer for Lotus.

## Philosophy

It offers lightweight controllers and routing as Rack wrappers.

## Installation

Add this line to your application's Gemfile:

    gem 'lotus-controller'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lotus-controller

## Usage

    # config.ru
    require 'lotus-controller'

    class FlowersController < Lotus::Controller
      def index
        response.body = ['Hello, Lotus!']
      end
    end

    Lotus::Routes = Lotus::Routing.draw do
      get '/flowers', controller: 'flowers'
    end

    run Lotus::App.new(Lotus::Routes)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
