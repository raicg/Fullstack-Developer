require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  it 'validates presence of full_name' do
    user.update(full_name: nil)
    user.reload

    expect(user.full_name).to_not be_nil
  end
end
