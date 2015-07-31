require 'rails_helper'

describe CharAttributesController, :type => :controller do

  include_context "user logs in"
  before do
    @char_type = double(CharType)
    @char_attribute = double(CharAttribute)
  end

  describe "GET show" do

    before do
      find_char_type_stub
      find_char_attribute_stub
      get :show, valid_parameters
    end

    it "should assign character type" do
      expect(assigns(:char_type)).to eql(@char_type)
    end

    it "should assign character attribute" do
      expect(assigns(:char_attribute)).to eql(@char_attribute)
    end

    it "should render template show" do
      expect(response).to render_template("show")
    end

    it "should have successful response" do
      expect(response).to be_success
    end
  end

  describe "GET new" do

    before do
      find_char_type_stub
      allow(@char_type).to receive_message_chain(:char_attributes, 
                                                 :new).and_return(@char_attribute)
      get :new, :char_type_id => 46
    end

    it "should assign character type" do
      expect(assigns(:char_type)).to eql(@char_type)
    end

    it "should assign new character attribute" do
      expect(assigns(:char_attribute)).to eql(@char_attribute)
    end

    it "should have a successful response" do
      expect(response).to be_success
    end

    it "should render template new" do
      expect(response).to render_template("new")
    end
  end

  describe "GET edit" do

    before do
      find_char_type_stub
      find_char_attribute_stub
      get :edit, valid_parameters
    end

    it "should assign character type" do
      expect(assigns(:char_type)).to eql(@char_type)
    end

    it "should assign new character attribute" do
      expect(assigns(:char_attribute)).to eql(@char_attribute)
    end

    it "should have successful response" do
      expect(response).to be_success
    end

    it "should render template edit" do
      expect(response).to render_template("edit")
    end
  end

  describe "POST create" do

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

      it "should assign character type" do
        expect(assigns(:char_type)).to eql(@char_type)
      end

      it "should assign new attribute" do
        expect(assigns(:char_attribute)).to eql(@char_attribute)
      end

      it "should redirect to character type page" do
        expect(response).to redirect_to(char_type_path(@char_type))
      end

      it "should have http status redirect" do
        expect(response).to have_http_status(:redirect)
      end
    end

    context "character attribute is not valid" do

      before do
        allow(@char_attribute).to receive(:save).and_return(false)
        post :create, :char_type_id => 46, 
                      :char_attribute => { :title => "Rogue", :value => "20" }
      end

      it "should assign character type" do
        expect(assigns(:char_type)).to eql(@char_type)
      end

      it "should assign new attribute" do
        expect(assigns(:char_attribute)).to eql(@char_attribute)
      end

      it "should render template new" do
        expect(response).to render_template("new")
      end

      it "should have successful response" do
        expect(response).to be_success
      end
    end

  end

  describe "PUT update" do

    before do
      find_char_type_stub
      find_char_attribute_stub
    end

    context "successful update" do
      before do
        allow(@char_attribute).to receive(:update).and_return(true)
        put :update, :char_type_id => 46, :id => 2, 
                     :char_attribute => { :title => "Rogue", :value => "20" }
      end

      it "should assign character type" do
        expect(assigns(:char_type)).to eql(@char_type)
      end

      it "should assign new character attribute" do
        expect(assigns(:char_attribute)).to eql(@char_attribute)
      end

      it "redirects to character type page" do
        expect(response).to redirect_to(char_type_path(@char_type))
      end

      it "should have http status redirect" do
        expect(response).to have_http_status(:redirect)
      end
    end

    context "failed update" do
      before do
        allow(@char_attribute).to receive(:update).and_return(false)
        put :update, :char_type_id => 46, :id => 2, 
                     :char_attribute => { :title => "Rogue", :value => "20" }
      end

      it "should assign character type" do
        expect(assigns(:char_type)).to eql(@char_type)
      end

      it "should assign new character attribute" do
        expect(assigns(:char_attribute)).to eql(@char_attribute)
      end

      it "should render 'edit' template" do
        expect(response).to render_template("edit")
      end

      it "should have successful response" do
        expect(response).to be_success
      end
    end
  end

  describe "DELETE destroy" do

    before do
      find_char_type_stub
      find_char_attribute_stub
      allow(@char_attribute).to receive(:destroy)
    end

    it "should assign character type" do
      delete_destroy
      expect(assigns(:char_type)).to eql(@char_type)
    end

    it "should assign new character attribute" do
      delete_destroy
      expect(assigns(:char_attribute)).to eql(@char_attribute)
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
