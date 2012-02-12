class ShortUrl < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
 
  validates_presence_of :url
 
  def key
    Base58.encode(self.id) if self.id
  end
  
  def self.find_by_key(key)
    begin
      find(:first, :conditions => ['id = ?', Base58.decode(key.to_s)])
    rescue
      nil
    end
  end

  protected
  
  def validate
    begin
      uri = URI.parse(self.url)
      if uri.class != URI::HTTP
        errors.add(:url, 'Only HTTP protocol addresses can be used')
      end
    rescue URI::InvalidURIError
      errors.add(:url, 'The format of the url is not valid.')
    end
    true
  end
end
