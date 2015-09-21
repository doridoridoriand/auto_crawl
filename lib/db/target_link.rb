class TargetLink < ActiveRecord::Base
end

module TargetLinkModule
  # absolute_urlとpage_typeに関しては存在しない場合も考慮しないといけない
  def sasve_items(id = 0)
    TargetLink.create(
      id: id,
      top_url: self[:top_url],
      relative_url: self[:relative_url],
    )
  end
end
