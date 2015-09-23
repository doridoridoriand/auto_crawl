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
  # 重複したリンクは排除(短縮URLサービスとか使っていたりすると不可能)
  def get_all_links(url)
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    source = agent.get(url)
    source.links.map {|element| element.href}.to_a.uniq!
  end

  # mailtoなどもリンクに入ってしまっているので、これを除外する
  def remove_needlsee_links
    arr = []
    needless = %w(mailto javascript)
    self.each do |link|
      needless.each do |mess|
        unless link.include?(mess)
          arr.push(link)
        end
      end
    end
    arr
  end
end
