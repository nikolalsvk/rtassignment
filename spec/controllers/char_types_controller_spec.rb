require "rails_helper"

RSpec.describe CharTypesController, :type => :controller do
  include_context "user logs in"
  
  before do
    @char_type = double(CharType)
  end

  describe "GET index" do
    before do
      allow(@user).to receive_message_chain(:char_types,
                                            :by_title, :page, :per).and_return(@char_types)
      get :index, :page => "bla"
    end

    it "should assign character types" do
      expect(assigns(:char_types)).to eql(@char_types)
    end

    it "should render template index" do
      expect(response).to render_template("index")
    end

    it "should have successful response" do
      expect(response).to be_success
    end
  end

  describe "GET show" do
    before do
      find_char_type_stub
      get :show, :id => 46
    end

    it "should assign character type" do
      expect(assigns(:char_type)).to eql(@char_type)
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
      allow(controller).to receive_message_chain(:current_user, :char_types, :new).and_return(@char_type)
      get :new
    end

    it "should create new character type" do
      expect(assigns(:char_type)).to eql(@char_type)
    end

    it "should render template new" do
      expect(response).to render_template("new")
    end

    it "should have successful response" do
      expect(response).to be_success
    end
  end

  describe "GET edit" do
    before do
      find_char_type_stub
      get :edit, :id => 46
    end

    it "should assign character type" do
      expect(assigns(:char_type)).to eql(@char_type)
    end

    it "should render template edit" do
      expect(response).to render_template("edit")
    end

    it "should have successful response" do
      expect(response).to be_success
    end
  end

  describe "POST create" do

    before(:each) do
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

      it "should return http status redirect" do
        expect(response).to have_http_status(:redirect)
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

      it "renders template new" do
        expect(response).to render_template("new")
      end

      it "should return http status success" do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "PATCH update" do
    before do
      find_char_type_stub
    end

    context "update is valid" do
      before do
        allow(@char_type).to receive(:update).and_return(true)
        patch :update, :id => 46, :char_type => { :title => "Rogue" }
      end

      it "should assign character type" do
        expect(assigns(:char_type)).to eql(@char_type)
      end

      it "redirects to character type page" do
        expect(response).to redirect_to(char_type_path(@char_type))
      end

      it "should return http status redirect" do
        expect(response).to have_http_status(:redirect)
      end
    end

    context "update is not valid" do
      before do
        allow(@char_type).to receive(:update).and_return(false)
        patch :update, :id => 46, :char_type => { :title => "Rogue" }
      end

      it "should assign character type" do
        expect(assigns(:char_type)).to eql(@char_type)
      end

      it "renders template edit" do
        expect(response).to render_template("edit")
      end

      it "should return http status success" do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "DELETE destroy" do
    before do
      find_char_type_stub
      allow(@char_type).to receive(:destroy)
    end

    it "should assign character type" do
      delete_destroy

      expect(assigns(:char_type)).to eql(@char_type)
    end

    it "should destroy character type" do
      expect(@char_type).to receive(:destroy)

      delete_destroy
    end

    it "should redirect to character types page" do
      delete_destroy

      expect(response).to redirect_to(char_types_path)
    end

    it "should return http status redirect" do
      delete_destroy

      expect(response).to have_http_status(:redirect)
    end
  end

  def find_char_type_stub
    allow(@user).to receive_message_chain(:char_types, 
                                          :find_by_id).and_return(@char_type)
  end

  def delete_destroy
    delete :destroy, :id => 46
  end
end
