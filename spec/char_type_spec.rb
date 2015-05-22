require "spec_helper"
require "rails_helper"

describe CharType do
	it { should validate_presence_of(:title) }
end
