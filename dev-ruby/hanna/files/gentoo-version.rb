module Hanna

  VERSION = '0.1.12'

  # The version of RDoc that Hanna should use
  RDOC_VERSION = '2.3.0'
  RDOC_VERSION_REQUIREMENT = "~> #{RDOC_VERSION}"

  # Load the correct version of RDoc
  def self.require_rdoc(terminate = true)
    gem 'rdoc'
  end

end
