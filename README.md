# extends_newrelic_rpm
While New Relic's Ruby agent, `newrelic_rpm`, instruments many frameworks out of the box, it can't cover every gem out there. Thankfully, many people in the community have stepped up to provide custom instrumentation, which is awesome!

This repository uses git submodules to link any related gems we're aware of. While the Ruby agent team doesn't test or maintain these gems directly, we use this repository when researching the impact of code changes, in particular renames/deletions for internal classes and methods.

**Inclusion here doesn't imply New Relic support or testing for the related gem.**

## Usage
An automated scripts monitors new gem pushes to rubygems.org listing `newrelic_rpm` as a dependency.

We're also very happy to accept pull requests if your gem isn't get caught automatically.

## Adding Gems
There's a script to simplify adding to the repo.

    $ script/add git@github.com:jasonrclark/my_awesome_gem-newrelic.git

This adds `my_awesome_gem-newrelic` as a submodule with a simple commit
message.
