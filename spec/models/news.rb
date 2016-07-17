RSpec.describe News, type: :model do
  it { should belong_to(:category).class_name('NewsCategory') }
end
