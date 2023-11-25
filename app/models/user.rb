class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :birthday, presence: true
  validate :password_complexity
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :email, format: { with: /@/, message: 'は@を含まないと登録できません' }

  private

  def password_complexity
    # パスワードが英字と数字の両方を含むことを確認
    unless password.match(/^(?=.*[a-zA-Z])(?=.*\d).+/)
      errors.add :password, 'は英字と数字の両方を含めて設定してください'
    end
  end
end
