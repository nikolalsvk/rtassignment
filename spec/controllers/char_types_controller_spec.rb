require "rails_helper"

RSpec.describe CharTypesController, :type => :controller do

  describe "#index" do

  end

  describe "#show" do

  end

  describe "#new" do

  end

  describe "#edit" do

  end

  describe "#create" do

    before(:each) do
        @user = double(User)
        @char_type = double(CharType)

        allow(controller).to receive(:current_user).and_return(@user)
        allow(controller).to receive(:authenticate_user!)
        allow(controller).to receive(:current_user).and_return(@user)
        allow(@user).to receive_message_chain(:char_types, :new).and_return(@char_type)
    end

    context "char type is valid" do

      before do
        allow(@char_type).to receive(:save).and_return(true)

        post :create, :char_type => { :title => "Rogue" }
      end

      it "creates new character type" do
        expect(assigns(:char_type)).to eql(@char_type)
      end

      it "redirects to character types page" do
        expect(response).to redirect_to(char_type_path(@char_type))
      end

    end

    context "char type is invalid" do

      before do
        allow(@char_type).to receive(:save).and_return(false)

        post :create, :char_type => { :title => "Random" }
      end

      it "creates new character type" do
        expect(assigns(:char_type)).to eql(@char_type)
      end

      it "renders temaplate new" do
        expect(response).to render_template("new")
      end

    end
  end

  describe "#update" do

  end

  describe "#destroy" do

  end
end
