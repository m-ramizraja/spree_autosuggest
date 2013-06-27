# Spree Autosuggest

[![Build Status](https://secure.travis-ci.org/futhr/spree_autosuggest.png?branch=master)](http://travis-ci.org/futhr/spree_autosuggest)
[![Dependency Status](https://gemnasium.com/futhr/spree_autosuggest.png)](https://gemnasium.com/futhr/spree_autosuggest)
[![Coverage Status](https://coveralls.io/repos/futhr/spree_autosuggest/badge.png?branch=master)](https://coveralls.io/r/futhr/spree_autosuggest)

This extension adds suggestions for product search.

## Installation

1. Add to Gemfile: `gem 'spree_autosuggest', github: 'futhr/spree_autosuggest'`
2. Run `rails g spree_autosuggest:install`
3. Run `rake spree_autosuggest:seed` to add all Taxon & Product names to the autosuggest database

## Contributing

In the spirit of [free software][1], **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* by using prerelease versions
* by reporting [bugs][2]
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code (*no patch is too small*: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by resolving [issues][2]
* by reviewing patches

Starting point:

* Fork the repo
* Clone your repo
* Run `bundle install`
* Run `bundle exec rake test_app` to create the test application in `spec/test_app`
* Make your changes and follow this [Style Guide](https://github.com/thoughtbot/guides)
* Ensure specs pass by running `bundle exec rspec spec`
* Submit your pull request

Copyright (c) 2013 Aleksey Demidov, released under the [New BSD License][3]

[1]: http://www.fsf.org/licensing/essays/free-sw.html
[2]: https://github.com/futhr/spree_autosuggest/issues
[3]: https://github.com/futhr/spree_autosuggest/tree/master/LICENSE