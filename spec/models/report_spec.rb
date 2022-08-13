require 'rails_helper'

RSpec.describe 'Reportモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { report.valid? }

    let(:report) { build(:report) }

    context 'nameカラム' do
      it '空欄でないこと' do
        report.comment = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Bookモデルとの関係' do
      it '1:Nとなっている' do
        expect(Report.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
    context 'Bookモデルとの関係' do
      it '1:Nとなっている' do
        expect(Report.reflect_on_association(:live).macro).to eq :belongs_to
      end
    end
  end
end
