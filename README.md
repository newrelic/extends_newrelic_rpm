# newrelic_rpm contribs repo

There are a lot of gems out on the internet that rely on and extend newrelic_rpm.
This repo is an attempt to capture the most common of them via git submodules
so we can easily search for usages of certain classes when we refactor our code.

## Usage
Um, clone it and you'll get the code.

## Adding
There's a script to make it a little simpler to add in a new repo.

    $ script/add git@github.com:filtersquad/rocket_pants-rpm.git

This will add the rocket_pants-rpm repo as a submodule with a simple commit
message.
