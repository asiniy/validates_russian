require 'active_model'

dirs = %w{ validates_russian validators }

dirs.each do |dir|
  Dir[File.dirname(__FILE__) + "/#{dir}/*.rb"].each { |f| require f }
end
