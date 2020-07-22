require 'rails_helper'

RSpec.describe UserBulk, type: :model do
  let!(:user_bulk) { create(:user_bulk) }

  it 'validates presence of file' do
    user_bulk.update(file: nil)
    user_bulk.reload

    expect(user_bulk.file).to_not be_nil
  end

  context 'when creating a new user' do
    it 'should enqueue user bulk' do
      expect{ UserBulk.create(file: user_bulk.file_blob) }.to have_enqueued_job(UserBulkJob)
    end
  end

  describe 'when processing spreadsheet' do
    context 'with a spreadsheet with the right format' do
      before do 
        user_bulk.process_bulk!
      end

      it 'should create users' do
        expect(User.all.count).to eq(3)
      end
      it 'should set the state of the user bulk to completed' do
        expect(user_bulk.state).to eq('completed') 
      end
    end
    
    context 'with a spreadsheet with a wrong format' do
      before do 
        user_bulk.update(file: Rack::Test::UploadedFile.new('spec/fixtures/user_bulk_file_with_error.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'))
        user_bulk.process_bulk!
      end

      it 'should not create users' do
        expect(User.all.count).to_not eq(3)
      end

      it 'should set the state of the user bulk to finished' do
        expect(user_bulk.state).to eq('completed') 
      end
    end
  end
end
