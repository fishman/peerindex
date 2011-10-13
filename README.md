# The Peerindex Ruby Gem
A Ruby wrapper for the Peerindex API

## <a name="installation">Installation</a>
    gem install peerindex

## Howto
This version no longer requires that you explicitly pass the authenticated
user's ID or screen name.

    Peerindex.configure do |config|
      config.api_key = YOUR_API_KEY
    end

    Peerindex.user("rjzzleep")

## <a href="performance">Performance</a>
You can improve performance by preloading a faster JSON or XML parsing library.
By default, the JSON will be parsed with [okjson][okjson] and XML will be
parsed with [REXML][rexml]. For faster JSON parsing, we recommend
[yajl-ruby][yajl] and for faster XML parsing, we recommend
[libxml-ruby][libxml] or [nokogiri][nokogiri].

[okjson]: https://github.com/ddollar/okjson
[rexml]: http://www.germane-software.com/software/rexml
[yajl]: https://github.com/brianmario/yajl-ruby
[libxml]: https://github.com/dvdplm/libxml-ruby
[nokogiri]: http://nokogiri.org

## <a name="examples">Usage Examples</a>
    require "rubygems"
    require "peerindex"

    # Get a user's peerindex
    puts Peerindex.user("rjzzleep").peerindex

## <a name="copyright">Copyright</a>
Copyright (c) 2011 Reza Jelveh
This is heavily based on John Nunemaker, Wynn Netherland, Erik Michaels-Ober, Steve Richert twitter gem so they probably own the copyright as well
See [LICENSE](https://github.com/fishman/peerindex/blob/master/LICENSE.md) for details.
