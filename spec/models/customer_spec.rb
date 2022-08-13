require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { customer.valid? }

    let(:customer) { build(:customer) }

    context 'nameカラム' do
      it '空欄でないこと' do
        customer.name = ''
        is_expected.to eq false
      end
    end
    
    context 'nicknameカラム' do
      it '空欄でないこと' do
        customer.nickname = ''
        is_expected.to eq false
      end
    end
    
    context 'is_deletedカラム' do
      it 'falseであること' do
        customer.is_deleted
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
    
    context 'Reportモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:reports).macro).to eq :has_many
      end
    end
    
    context 'FavoriteArtistモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:favorite_artists).macro).to eq :has_many
      end
    end
    
    context 'FavoriteGenreモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:favorite_genres).macro).to eq :has_many
      end
    end
    
    context 'BookmarlLiveモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:bookmark_lives).macro).to eq :has_many
      end
    end
  end
end
