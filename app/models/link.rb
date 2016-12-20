class Link < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :url

  validates :url, url: true

  belongs_to :user
  def read!
    publish if read == false
    update_attribute(:read, true)
  end

  def publish

  end
end
