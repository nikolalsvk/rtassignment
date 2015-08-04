require 'rails_helper'

RSpec.describe CharCombat, type: :model do
  it { should have_db_column(:winner) }
  it { should have_db_column(:loser) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }

  it { should validate_presence_of(:winner) }
  it { should validate_presence_of(:loser) }
end
