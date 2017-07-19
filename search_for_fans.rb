#!/usr/local/bin/ruby

require 'json'
require 'rest-client'

# get the last 50 updated gems
puts `git checkout master`

gems = JSON(RestClient.get("https://rubygems.org/api/v1/gems/newrelic_rpm/reverse_dependencies.json"))
gems = gems.reject { |g| g.include? 'rpm_contrib' } # rpm_contrib is deprecated
gems.each do |g|
  unless Dir.exist? g
    gem_info = JSON(RestClient.get("https://rubygems.org/api/v1/gems/#{g}.json"))

    uri = if gem_info['source_code_uri']
      gem_info['source_code_uri']
    else
      if gem_info['homepage_uri'] && gem_info['homepage_uri'] =~ /github\.com\/.*\//
        gem_info['homepage_uri']
      else
        nil
      end
    end

    if uri # not all gems have source code URLs in their gemspec.
      begin
        response = RestClient.get(uri) # check to make sure the gem source is still valid.
      rescue RestClient::ExceptionWithResponse => err
        puts "Got HTTP error #{err.http_code} from #{uri} for #{g}."
      else
        puts "Adding #{g} at #{uri}"
        puts `git submodule add #{uri} #{g}`
        puts `git commit -m"Adding #{g}"`
      end
    end
  end
end
