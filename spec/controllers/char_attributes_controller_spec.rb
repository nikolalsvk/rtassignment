require 'rails_helper'

describe CharAttributesController, :type => :controller do
  # have legit user, char_type and char_attribute mocks
  before do
    @user = double(User)
    @char_type = double(CharType)
    @char_attribute = double(CharAttribute)

    #allow(request.env["warden"]).to receive(:authenticate!).and_return(@user)
    allow(controller).to receive(:current_user).and_return(@user)
    allow(controller).to receive(:authenticate_user!)
  end

  describe "#create" do

    before do
      allow(@user).to receive_message_chain(:char_types, :find_by_id).and_return(@char_type)
      allow(@char_type).to receive_message_chain(:char_attributes, :build).and_return(@char_attribute)
    end

    context "character attribute is valid" do

      before do
        allow(@char_attribute).to receive(:save).and_return(true)
        post :create, :char_type_id => 42, :char_attribute => { :title => "Rogue", :value => "20" }
      end

      it "should create new attribute" do
        expect(assigns(:char_attribute)).to eql(@char_attribute)
      end

      it "should redirect to character type page" do
        expect(response).to redirect_to(char_type_path(@char_type))
      end

    end

    context "character attribute is not valid" do

      before do
        allow(@char_attribute).to receive(:save).and_return(false)
        post :create, :char_type_id => 46, :char_attribute => { :title => "Rogue", :value => "20" }
      end

      it "should create new attribute" do
        expect(assigns(:char_attribute)).to eql(@char_attribute)
      end

      it "should render template new" do
        expect(response).to render_template("new")
      end

    end

  end

  describe "#destroy" do

    before do
      allow(@user).to receive_message_chain(:char_types, :find_by_id).and_return(@char_type)
      allow(@char_type).to receive_message_chain(:char_attributes, :find_by_id).and_return(@char_attribute)
      allow(@char_attribute).to receive(:destroy)
    end

    def delete_destroy
      delete :destroy, :char_type_id => 46, :id => 213
    end

    it "should destroy attribute" do
      expect(@char_attribute).to receive(:destroy)
      delete_destroy        
    end

    it "should redirect to character types page" do
      delete_destroy
      expect(response).to redirect_to(char_types_path)
    end

  end
end
