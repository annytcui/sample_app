ENV['RAILS_ENV'] ||= 'test'

class ActiveSupport::TestCase
  fixtures :all
  include ApplicationHelper
end
