require 'rails_helper'

RSpec.describe UserBulkJob, type: :job do
  it 'queues the job' do
    expect{ UserBulkJob.perform_later(1) }.to have_enqueued_job
  end

  it 'is in user_bulks queue' do
    expect(UserBulkJob.new.queue_name).to eq('user_manager_test_user_bulks')
  end

  describe 'when performing the queue' do
    let!(:user_bulk) { create(:user_bulk) }

    it 'should change the user bulk state to completed' do
      UserBulkJob.new.perform(user_bulk.id)
      expect(user_bulk.state).to eq('processing')
    end
  end
end