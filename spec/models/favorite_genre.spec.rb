require 'rails_helper'

RSpec.describe 'FavoriteGenreモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it '1:Nとなっている' do
        expect(FavoriteGenre.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
    context 'Genreモデルとの関係' do
      it '1:Nとなっている' do
        expect(FavoriteGenre.reflect_on_association(:genre).macro).to eq :belongs_to
      end
    end
  end
end
