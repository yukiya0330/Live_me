require 'rails_helper'

RSpec.describe 'LiveScheduleモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Liveモデルとの関係' do
      it '1:Nとなっている' do
        expect(LiveSchedule.reflect_on_association(:live).macro).to eq :belongs_to
      end
    end
    context 'LiveHouseモデルとの関係' do
      it '1:Nとなっている' do
        expect(LiveSchedule.reflect_on_association(:live_house).macro).to eq :belongs_to
      end
    end
  end
end
