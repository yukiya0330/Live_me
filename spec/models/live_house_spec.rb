require 'rails_helper'

RSpec.describe "LiveHouseモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { live_house.valid? }

    let!(:other_live_house) { create(:live_house) }
    let(:live_house) { build(:live_house) }

    context 'nameカラム' do
      it '空欄でないこと' do
        live_house.name = ''
        is_expected.to eq false
      end
      it '一意性があること' do
        live_house.name = other_live_house.name
        is_expected.to eq false
      end
    end
    context 'introductionカラム' do
      it '空欄でないこと' do
        live_house.introduction = ''
        is_expected.to eq false
      end  
    end
    context 'postal_codeカラム' do
      it '空欄でないこと' do
        live_house.postal_code = ''
        is_expected.to eq false
      end
      it '7文字であること'do
        live_house.postal_code.length == 7
        is_expected.to eq true
      end
    end
    context 'addressカラム' do
      it '空欄でないこと' do
        live_house.address = ''
        is_expected.to eq false
      end
    end
    context 'statusカラム' do
      it 'ステータスが含まれていること' do
        live_house.status = ''
        is_expected.to eq false
      end
    end  
  end
  
  describe 'アソシエーションのテスト' do
    context 'LiveScheduleモデルとの関係' do
      it '1:Nとなっている' do
        expect(LiveHouse.reflect_on_association(:live_schedules).macro).to eq :has_many
      end
    end
  end
end  
