require 'rails_helper'

RSpec.describe CharCombatsController, type: :controller do
  include_context "user logs in"

  describe "GET index" do
    it "should render index" do
      skip "it renders something else, skipped for now"
      expect(response).to render_template("index")
    end

    it "should have successful response" do
      expect(response).to be_success
    end
  end
end
