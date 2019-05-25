class ShortenedUrl < ApplicationRecord
  # Set length of random alphanumeric characters for short URL
  UNIQUE_ID_LENGTH = 6
  validates :long_url, presence: true, on: :create
  validates_format_of :long_url, 
  with: /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2-4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/
  before_create :generate_short_url
  before_create :sanitize

  # Generate unique URL for given web address before saving into database
  def generate_short_url
    url = ([*('a'..'z'),*('0'..'9')]).sample(UNIQUE_ID_LENGTH).join
    old_url = ShortenedUrl.where(short_url: url).last
    if old_url.present?
      self.generate_short_url
    else
      self.short_url = url
    end
  end

  # Check if any duplicate URL exist before saving into database
  def find_duplicate
    ShortenedUrl.find_by_sanitized_url(self.sanitize_url)
  end

  def new_url?
    find_duplicate.nil?
  end

  # Sanitize the given user URL
  def sanitize
    self.long_url.strip!
    self.sanitize_url = self.long_url.downcase.gsub(/(https:?\/\/)|(www\.)/, "")
    self.sanitize_url = "http://#{self.sanitize_url}"
  end
end
