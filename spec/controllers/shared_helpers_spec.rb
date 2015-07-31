shared_context "user logs in" do

  before do
    @user = double(User)
    allow(controller).to receive(:current_user).and_return(@user)
    allow(controller).to receive(:authenticate_user!)
  end
end

shared_context "find character type" do

  context "it assigns character type" do

    before do
      allow(@user).to receive_message_chain(:char_types, :find_by_id).and_return(@char_type)
    end

    it "should assign character type" do
      expect(assigns(:char_type)).to eql(@char_type)
    end
  end

  context "it does not assign character type" do

    before do
      allow(@user).to receive_message_chain(:char_types, :find_by_id).and_return(nil)
    end

    it "should not assign character type" do
      expect(assigns(:char_type)).to eql(nil)
    end

    it "should render 404 page" do
      expect(response).to render_template("public/404")
    end
  end

end

shared_context "find character attribute" do

end