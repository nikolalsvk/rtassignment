require 'rails_helper'

RSpec.describe CharCombatsController, type: :controller do
  include_context "user logs in"

  describe "POST create" do
    before do
      allow(controller).to receive(:find_first_char).and_return(@first_char)
      allow(controller).to receive(:find_second_char).and_return(@second_char)
      allow(controller).to receive_message_chain(:combat, :title).and_return(@winner)

      post :create, :char_combat => { :first_char => 32,
                                      :second_char => 12 }
    end

    it "should assign first character" do
      expect(assigns(:first_char)).to eql(@first_char)
    end

    it "should assign second character" do
      expect(assigns(:second_char)).to eql(@second_char)
    end

    it "should assign the winner" do
      expect(assigns(:winner)).to eql(@winner)
    end

    it "should redirect to combat result page" do
      expect(response).to redirect_to(char_combats_path(@winner))
    end

    it "should have http status redirect" do
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET index" do
    before do
      get :index
    end

    it "should render index template" do
      expect(response).to render_template("index")
    end

    it "should have successful response" do
      expect(response).to be_success
    end
  end

  describe "GET new" do
    before do
      get :new
    end

    it "should render new template" do
      expect(response).to render_template("new")
    end

    it "should have successful response" do
      expect(response).to be_success
    end
  end
end
