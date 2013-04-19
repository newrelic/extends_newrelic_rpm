require 'json'
# get the last 50 updated gems
puts `git checkout master`
%w| https://rubygems.org/api/v1/activity/latest https://rubygems.org/api/v1/activity/just_updated.json|.each do |api|
  latest = `curl -s '#{api}'`

  gems = JSON(latest)
  gems.each do |gem| 
    gem['dependencies'].each do |gem_dependencies|
      dependencies = gem_dependencies && gem_dependencies.last.select{|d| d['name'] == 'newrelic_rpm'}
      dependencies.each do |dependency|
        puts "#{gem['name']} #{gem['version']} is dependent on #{dependency['name']} #{dependency['version']} (#{dependency.inspect})"
        github_url = gem.map{|kv| (kv[0] =~ /uri/) ? (kv[1]) : nil}.compact.grep(%r|https?://github\.com/|).first

        if github_url
          repo_url = github_url.sub(%r|https?://github\.com/|, 'git@github.com:')
          cmd = "bash #{File.expand_path(File.join(File.dirname(__FILE__), 'add'))}"
          puts `#{cmd} '#{repo_url.gsub("'", "")}'`
        end
      end
    end
  end
end
exec "git pull --rebase && git push origin master"
