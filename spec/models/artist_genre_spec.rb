require 'rails_helper'

RSpec.describe 'ArtistGenreモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Artistモデルとの関係' do
      it '1:Nとなっている' do
        expect(ArtistGenre.reflect_on_association(:artist).macro).to eq :belongs_to
      end
    end
    context 'Genreモデルとの関係' do
      it '1:Nとなっている' do
        expect(ArtistGenre.reflect_on_association(:genre).macro).to eq :belongs_to
      end
    end
  end
end
