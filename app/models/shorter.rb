class Shorter < ActiveRecord::Base

  geocoded_by :ip_address
  before_validation :generate_short_url
  validates :long_url, presence: :true
  validates :short_url, presence: :true
  validates :short_url, uniqueness: { case_sensitive: false }
  belongs_to :user
  has_many :analytics, dependent: :destroy

  default_scope {order('created_at desc')}
  scope :public_url, -> { where(:user_id => nil).pluck(:short_url, :long_url, :created_at)}

  def click_counter
    self.increment!(:clicks)
  end

  def generate_short_url
    begin
      generate_url = SecureRandom.urlsafe_base64
      self.short_url = generate_url[0..6]
    end while self.class.exists?(short_url: short_url)
  end
end
