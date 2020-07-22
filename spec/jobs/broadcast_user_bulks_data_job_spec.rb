require 'rails_helper'

RSpec.describe BroadcastUserBulksDataJob, type: :job do
  it 'queues the job' do
    expect{ BroadcastUserBulksDataJob.perform_later(1) }.to have_enqueued_job
  end

  it 'is in broadcast_dashboard_data queue' do
    expect(BroadcastUserBulksDataJob.new.queue_name).to eq('user_manager_test_broadcast_user_bulks_data')
  end

  describe 'when performing the queue' do
    before do
      @data = {
        user_bulks: UserBulk.all
      }
    end
    it 'should broadcast the dashboard data' do
      expect { BroadcastUserBulksDataJob.perform_now }.to have_broadcasted_to('user_bulks_channel').with(@data)
    end
    
    it 'should enqueue the job again' do
      expect{ BroadcastDashboardDataJob.perform_now }.to have_enqueued_job
    end
  end
end