RSpec.describe NewsCategory, type: :model do
  it { should have_many(:news).class_name('News') }
end
