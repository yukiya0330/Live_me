require 'rails_helper'

RSpec.describe 'PerformingArtistモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Artistモデルとの関係' do
      it '1:Nとなっている' do
        expect(PerformingArtist.reflect_on_association(:artist).macro).to eq :belongs_to
      end
    end
    context 'Liveモデルとの関係' do
      it '1:Nとなっている' do
        expect(PerformingArtist.reflect_on_association(:live).macro).to eq :belongs_to
      end
    end
  end
end
