require 'webmock/rspec'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true

  config.order = :random
  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    # Enable only the newer, non-monkey-patching expect syntax.
    # For more details, see:
    #   - http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
    expectations.syntax = :expect
  end
end
