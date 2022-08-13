require 'rails_helper'

RSpec.describe "Liveモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { live.valid? }

    let!(:other_live) { create(:live) }
    let(:live) { build(:live) }

    context 'nameカラム' do
      it '空欄でないこと' do
        live.name = ''
        is_expected.to eq false
      end
    end
    context 'introductionカラム' do
      it '空欄でないこと' do
        live.introduction = ''
        is_expected.to eq false
      end  
    end
    context 'live_dateカラム' do
      it '空欄でないこと' do
        live.live_date = ''
        is_expected.to eq false
      end  
    end
    context 'statusカラム' do
      it 'ステータスが含まれていること' do
        live.status = ''
        is_expected.to eq false
      end
    end  
  end
  
  describe 'アソシエーションのテスト' do
    context 'PerformingArtistモデルとの関係' do
      it '1:Nとなっている' do
        expect(Live.reflect_on_association(:performing_artists).macro).to eq :has_many
      end
    end
    context 'LiveScheduleモデルとの関係' do
      it '1:Nとなっている' do
        expect(Live.reflect_on_association(:live_schedules).macro).to eq :has_many
      end
    end
    context 'BookmarlLiveモデルとの関係' do
      it '1:Nとなっている' do
        expect(Live.reflect_on_association(:bookmark_lives).macro).to eq :has_many
      end
    end
    context 'Reportモデルとの関係' do
      it '1:Nとなっている' do
        expect(Live.reflect_on_association(:reports).macro).to eq :has_many
      end
    end
  end
end  
