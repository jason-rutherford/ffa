%w(
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
  /Users/jasonr/Projects/fantasy_football_nerd/
).each { |path| Spring.watch(path) }
