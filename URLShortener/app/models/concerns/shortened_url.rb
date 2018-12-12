class ShortenedUrl < ApplicationRecord
  # validate: ShortenedUrl.random_code

  def self.random_code
    code = SecureRandom.urlsafe_base64 
    while ShortenedUrl.exists?(code)
      code = SecureRandom.urlsafe_base64
    end
    return code 
  end

  def self.create_short_url(user, long_url) 
    ShortenedUrl.create!(long_url: long_url, short_url: ShortenedUrl.random_code, user_id: user.id )
  end
    
  belongs_to :submitter,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id
end