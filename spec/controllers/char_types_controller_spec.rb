require "rails_helper"

RSpec.describe CharTypesController, :type => :controller do

  describe "character type create" do

    context "char type is valid" do
      before do
        @user = double(User)
        @char_type = double(CharType)

        allow(request.env["warden"]).to receive(:authenticate!).and_return(@user)
        allow(controller).to receive(:current_user).and_return(@user)
        allow(@user).to receive_message_chain(:char_types, :new).and_return(@char_type)
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
        @user = double(User)
        @char_type = double(CharType)

        allow(request.env["warden"]).to receive(:authenticate!).and_return(@user)
        allow(controller).to receive(:current_user).and_return(@user)
        allow(@user).to receive_message_chain(:char_types, :new).and_return(@char_type)
        allow(@char_type).to receive(:save).and_return(false)

        post :create, :char_type => { :title => "Random" }
      end

      it "creates new character type" do
        expect(assigns(:char_type)).to eql(@char_type)
      end

      it "renders temaplte new" do
        expect(response).to render_template("new")
      end

    end
  end
end


# nesto.should_receive bla
# expect(nesto).to receive(bla)

