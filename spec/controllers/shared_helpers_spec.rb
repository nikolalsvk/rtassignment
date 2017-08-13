shared_context "user logs in" do
  before do
    @user = double(User)
    allow(controller).to receive(:current_user).and_return(@user)
    allow(controller).to receive(:authenticate_user!)
  end
end
