require 'rails_helper'

RSpec.describe 'FavoriteArtistモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it '1:Nとなっている' do
        expect(FavoriteArtist.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
    context 'Reportモデルとの関係' do
      it '1:Nとなっている' do
        expect(FavoriteArtist.reflect_on_association(:artist).macro).to eq :belongs_to
      end
    end
  end
end
