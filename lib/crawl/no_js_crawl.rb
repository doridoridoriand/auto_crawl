require 'nokogiri'
require 'nokogumbo'
require 'mechanize'
require 'open-uri'

module NoJsCrawl
  def html_source
    begin
      Nokogiri::HTML5 open(self.to_s).read
    rescue => error
      error
    end
  end

  # 微妙なので使わない
  def html_mechanize
    begin
      agent = Mechanize.new
      source = agent.get self
      source.body
    rescue
    end
  end
end
