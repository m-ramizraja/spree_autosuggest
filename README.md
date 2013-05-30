# Spree Autosuggest

[![Build Status](https://secure.travis-ci.org/futhr/spree_autosuggest.png?branch=master)](http://travis-ci.org/futhr/spree_autosuggest)
[![Dependency Status](https://gemnasium.com/futhr/spree_autosuggest.png)](https://gemnasium.com/futhr/spree_autosuggest)
[![Coverage Status](https://coveralls.io/repos/futhr/spree_autosuggest/badge.png?branch=master)](https://coveralls.io/r/futhr/spree_autosuggest)

This extension adds suggestions for product search.

**NOTE: THIS FORK IS WIP, HAS NOT BEEN FULLY TESTED YET WITH SPREE 2.x**

### Installation

**For Spree 2.x**

1. Add to Gemfile: `gem 'spree_autosuggest', github: 'evrone/spree_autosuggest'`
2. Run `rails g spree_autosuggest:install`
3. Run `rake spree_autosuggest:seed` to add all Taxon & Product names to the autosuggest database

## Contributing

* Fork the repo
* Clone your repo `git clone git@github.com:mrhelpful/spree_autosuggest.git`
* Create branch for your pull request `git checkout -b fix-something`
* Run `bundle`
* Run `bundle exec rake test_app` to create the test application in `spec/dummy`
* Make your changes
* Ensure specs pass by running `bundle exec rake`
* Make sure yor changes has test coverage `open coverage/index.html`
* Submit your pull request

Copyright (c) 2013 Aleksey Demidov, released under the New BSD License
