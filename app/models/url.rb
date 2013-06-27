class Url < ActiveRecord::Base
  validates :original, :presence => true
  validates :original, :format => { :with => /https?:\/\// }
  validate :is_valid_url?

  def is_valid_url?
    begin
      open(self.original)
    rescue
      self.errors[:base] << "Not a valid url ... doof."
    end 
  end
end
