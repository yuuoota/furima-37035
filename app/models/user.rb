class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
      validates :family_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' } do
      validates :family_name_kana
      validates :first_name_kana
    end
  end

  PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください'
end
