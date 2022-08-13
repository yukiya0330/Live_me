require 'rails_helper'

RSpec.describe 'Commentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { comment.valid? }

    let(:comment) { build(:comment) }

    context 'commentカラム' do
      it '空欄でないこと' do
        comment.comment = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it '1:Nとなっている' do
        expect(Comment.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
    context 'Artistモデルとの関係' do
      it '1:Nとなっている' do
        expect(Comment.reflect_on_association(:artist).macro).to eq :belongs_to
      end
    end
  end
end
