require 'validates_russian'

Dir[File.dirname(__FILE__) + '/support/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.order = 'random'
  config.color_enabled = true
  config.formatter     = 'documentation'
end
