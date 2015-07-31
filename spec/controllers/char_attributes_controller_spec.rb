require 'rails_helper'

describe CharAttributesController, :type => :controller do
  # have legit user, char_type and char_attribute mocks
  before do

    @user = double(User)
    @char_type = double(CharType)
    @char_attribute = double(CharAttribute)

    allow(controller).to receive(:current_user).and_return(@user)
    allow(controller).to receive(:authenticate_user!)

  end

  describe "#show" do

    before do
      find_char_type_stub
      find_char_attribute_stub
      get :show, valid_parameters
    end

    it "should have successful response" do
      expect(response).to be_success
    end

  end

  describe "#new" do

    before do
      find_char_type_stub
    end

    it "should make a new character attribute" do
      allow(@char_type).to receive_message_chain(:char_attributes, :new)
      get :new, :char_type_id => 46

      expect(response).to be_success
    end

  end

  describe "#edit" do

    before do
      find_char_type_stub
      find_char_attribute_stub
      get :edit, valid_parameters
    end

    it "should have successful response" do
      expect(response).to be_success
    end

  end

  describe "#create" do

    before do
      find_char_type_stub
      allow(@char_type).to receive_message_chain(:char_attributes, 
                                                 :build).and_return(@char_attribute)
    end

    context "character attribute is valid" do

      before do
        allow(@char_attribute).to receive(:save).and_return(true)
        post :create, :char_type_id => 42, 
                      :char_attribute => { :title => "Rogue", :value => "20" }
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
        post :create, :char_type_id => 46, 
                      :char_attribute => { :title => "Rogue", :value => "20" }
      end

      it "should create new attribute" do
        expect(assigns(:char_attribute)).to eql(@char_attribute)
      end

      it "should render template new" do
        expect(response).to render_template("new")
      end

    end

  end

  describe "#update" do

    before do
      find_char_type_stub
      find_char_attribute_stub
    end

    context "successful update" do
      it "redirect to character type page" do
        allow(@char_attribute).to receive(:update).and_return(true)
        put :update, :char_type_id => 46, :id => 2, 
                     :char_attribute => { :title => "Rogue", :value => "20" }

        expect(response).to redirect_to(char_type_path(@char_type))
      end
    end

    context "failed update" do
      it "should render 'edit' template" do
        allow(@char_attribute).to receive(:update).and_return(false)
        put :update, :char_type_id => 46, :id => 2, 
                     :char_attribute => { :title => "Rogue", :value => "20" }

        expect(response).to render_template("edit")
      end
    end
  end

  describe "#destroy" do

    before do
      find_char_type_stub
      find_char_attribute_stub
      allow(@char_attribute).to receive(:destroy)
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


  def delete_destroy
    delete :destroy, valid_parameters
  end

  def find_char_type_stub
    allow(@user).to receive_message_chain(:char_types, 
                                          :find_by_id).and_return(@char_type)
  end

  def find_char_attribute_stub
    allow(@char_type).to receive_message_chain(:char_attributes, 
                                               :find_by_id).and_return(@char_attribute)
  end

  def valid_parameters
    { :char_type_id => 54, :id => 1 }
  end
end
