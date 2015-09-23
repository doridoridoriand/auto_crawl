require 'active_record'
require 'yaml'
require 'mechanize'
require 'feedjira'
require 'kconv'
require 'open-uri'
require 'pry'
require 'optparse'
require 'logger'

# local libs
require 'db/target_web_site'
require 'db/target_link'
require 'db/crawled_origin_page'
require 'base/base'
require 'crawl/no_js_crawl'

# DB Setting
db_config = YAML.load_file(File.expand_path(File.join(__FILE__, '..', '..', 'config', 'database.yml')))
ActiveRecord::Base.establish_connection(db_config['db']['production'])

class AutoCrawl
end
