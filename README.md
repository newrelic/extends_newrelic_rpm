# extends_newrelic_rpm
Lots of gems out there rely on and extend `newrelic_rpm` which is awesome! This repo captures a list of related gems we're aware of as git submodules.

**Inclusion here doesn't imply New Relic support or testing for these.**

## Usage
The Ruby agent team uses this repo when researching impact for code changes, in particular renaming and removal of internal classes and methods.

An automated scripts also monitors for new gem pushes to rubygems.org listing `newrelic_rpm` as a dependency. We're also very happy to accept pull requests if your gem doesn't get caught automatically.

## Adding Gems
There's a script to make it simpler to add a new gem to the repo.

    $ script/add git@github.com:jasonrclark/my_awesome_gem-newrelic.git

This will add the `my_awesome_gem-newrelic` repo as a submodule with a simple commit
message.
