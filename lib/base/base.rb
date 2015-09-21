#$: << File.expand_path(File.join(__File__, '..', 'auto_crawl'))
#autoload(:NoJsCrawl,     'no_js')
#autoload(:DecodeJsCrawl, 'decode_js')

#class Base
#end

require 'nokogiri'
require 'nokogumbo'
require 'open-uri'

# JSデコードの有無にかかわらず共通して使いそうなメソッドをひとまずBaseに定義
module Base
  # @return String
  # TODO: 相対リンクに対応させる
  def get_page_content(target_url)
    Nokogiri::HTML5 open(target_url).read
  end

  # @return Array
  def get_all_links(url)
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    source = agent.get(url)
    source.links.map {|element| element.href}.to_a
  end
end
