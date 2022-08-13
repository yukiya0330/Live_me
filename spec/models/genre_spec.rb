require 'rails_helper'

RSpec.describe 'Genreモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { genre.valid? }

    let(:genre) { build(:genre) }

    context 'nameカラム' do
      it '空欄でないこと' do
        genre.name = ''
        is_expected.to eq false
      end
    end
  end  

  describe 'アソシエーションのテスト' do
    context 'ArtistGenreモデルとの関係' do
      it '1:Nとなっている' do
        expect(Genre.reflect_on_association(:artist_genres).macro).to eq :has_many
      end
    end
    context 'FavoriteGenreモデルとの関係' do
      it '1:Nとなっている' do
        expect(Genre.reflect_on_association(:favorite_genres).macro).to eq :has_many
      end
    end
  end
end
