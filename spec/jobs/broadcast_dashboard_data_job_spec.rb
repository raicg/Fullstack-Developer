require 'rails_helper'

RSpec.describe BroadcastDashboardDataJob, type: :job do
  it 'queues the job' do
    expect{ BroadcastDashboardDataJob.perform_later(1) }.to have_enqueued_job
  end

  it 'is in broadcast_dashboard_data queue' do
    expect(BroadcastDashboardDataJob.new.queue_name).to eq('user_manager_test_broadcast_dashboard_data')
  end

  describe 'when performing the queue' do
    before do
      total_number_of_users_grouped = User.all.group(:role).count
      total_number_of_users = total_number_of_users_grouped.values.inject(&:+).to_i
      @data = {
        total_number_of_users_grouped: total_number_of_users_grouped,
        total_number_of_users: total_number_of_users
      }
    end
    it 'should broadcast the dashboard data' do
      expect { BroadcastDashboardDataJob.perform_now }.to have_broadcasted_to('dashboard_channel').with(@data)
    end
    
    it 'should enqueue the job again' do
      expect{ BroadcastDashboardDataJob.perform_now }.to have_enqueued_job
    end
  end
end