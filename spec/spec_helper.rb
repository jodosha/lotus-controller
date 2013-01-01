require 'rack/test'
require 'lotus-controller'

RSpec.configure do |config|
  config.include Rack::Test::Methods,
    example_group: { file_path: /\bspec\/integration\// }
end
