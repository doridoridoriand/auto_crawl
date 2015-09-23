module DbBase
  def absolute_url(top_url)
    if self =~ /http/
      self
    else
      "#{top_url.chop}#{self}"
    end
  end
end
