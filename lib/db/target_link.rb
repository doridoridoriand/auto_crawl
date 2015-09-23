$: << File.expand_path(File.join(__FILE__, '..'))
require 'db_base'

class TargetLink < ActiveRecord::Base
end

include DbBase

module TargetLinkModule
  # absolute_urlとpage_typeに関しては存在しない場合も考慮しないといけない
  def save_items(top_url, id = 0)
    TargetLink.create(
      id:           id,
      top_url:      top_url,
      relative_url: self,
      absolute_url: absolute_url(top_url)
    )
  end
end
