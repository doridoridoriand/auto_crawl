$: << File.expand_path(File.join(__FILE__, '..'))
require 'db_base'

class CrawledOriginPage < ActiveRecord::Base
end

include DbBase

module CrawledOriginPageModule
  def save_to_db(id, top_url, url, page_type)
    CrawledOriginPage.create(
      id: id,
      page_id: id + 2000,
      top_url: top_url,
      page_type: page_type,
      url: url,
      html: self
    )
  end
end
