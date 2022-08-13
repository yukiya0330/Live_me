require 'rails_helper'

RSpec.describe "Artistモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    subject { artist.valid? }

    let!(:other_artist) { create(:artist) }
    let(:artist) { build(:artist) }

    context 'nameカラム' do
      it '空欄でないこと' do
        artist.name = ''
        is_expected.to eq false
      end
      it '一意性があること' do
        artist.name = other_artist.name
        is_expected.to eq false
      end
    end
    context 'introductionカラム' do
      it '空欄でないこと' do
        artist.introduction = ''
        is_expected.to eq false
      end  
    end
    context 'statusカラム' do
      it 'ステータスが含まれていること' do
        artist.status = ''
        is_expected.to eq false
      end
    end  
  end
  
  describe 'アソシエーションのテスト' do
    context 'FavoriteArtistモデルとの関係' do
      it '1:Nとなっている' do
        expect(Artist.reflect_on_association(:favorite_artists).macro).to eq :has_many
      end
    end
    context 'ArtistGenreモデルとの関係' do
      it '1:Nとなっている' do
        expect(Artist.reflect_on_association(:artist_genres).macro).to eq :has_many
      end
    end
    context 'PerformingArtistモデルとの関係' do
      it '1:Nとなっている' do
        expect(Artist.reflect_on_association(:performing_artists).macro).to eq :has_many
      end
    end
    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Artist.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
  end
end