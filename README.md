# extends_newrelic_rpm
Plenty of gems rely on and extend newrelic_rpm. This repo captures a set of them that we're aware of via git submodules.

**Inclusion in this repo doesn't imply support or knowledge from New Relic about these gems**

## Usage
The Ruby agent team uses this repo when researching impact for code changes, in particular renaming and removal of internal classes and methods.

An automated scripts also monitors for new gem pushes to rubygems.org listing `newrelic_rpm` as a dependency. We're also very happy to accept pull requests if your gem doesn't get caught automatically.

## Adding Gems
There's a script to make it simpler to add a new gem to the repo.

    $ script/add git@github.com:filtersquad/rocket_pants-rpm.git

This will add the `rocket_pants-rpm` repo as a submodule with a simple commit
message.
