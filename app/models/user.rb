class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, presence: true
  validates :birthday, presence: true
  validate :password_complexity

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角文字を使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  private

  def password_complexity
    # パスワードが英字と数字の両方を含むことを確認
    unless password.match(/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)
      errors.add :password, 'には英字と数字の両方を含めて設定してください'
    end
  end
end
