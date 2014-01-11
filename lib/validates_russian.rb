require 'validates_russian/version'

Dir['/validators/*.rb'].each{ |f| require f }

module ValidatesRussian
end
