$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rails/all'
require 'rspec/rails'
require 'citero_renderers/ris_renderable'
require 'citero_renderers/bibtex_renderable'
require 'acts_as_citable'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}


ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Schema.define(:version => 1) do
  create_table :record_changed_fields, :force => true do |t|
    t.string :data
    t.string :from_format
  end
end

class RecordChangedField < ActiveRecord::Base
  acts_as_citable do |c|
    c.format_field = 'from_format'
  end
end
