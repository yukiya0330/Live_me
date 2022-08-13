require 'rails_helper'

RSpec.describe 'BookmarkLiveモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it '1:Nとなっている' do
        expect(BookmarkLive.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
    context 'Liveモデルとの関係' do
      it '1:Nとなっている' do
        expect(BookmarkLive.reflect_on_association(:live).macro).to eq :belongs_to
      end
    end
  end
end
