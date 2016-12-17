class Honey < ApplicationRecord
  mount_uploader :honeyimg, HoneyimgUploader

  validates_presence_of :honeyimg, message: "Bobokám, tölts fel egy képet is!"


  def next
    self.class.where('id > ?', id).order(:id)
  end
end
