require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/jobs/'
  add_filter '/mailers/'
  add_filter '/channels/'
  add_filter '/helpers/'
  add_filter '/config/'
  add_filter '/spec/'

  # You can also set a minimum coverage percentage
  SimpleCov.minimum_coverage 90
end
