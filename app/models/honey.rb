class Honey < ApplicationRecord
  mount_uploader :honeyimg, HoneyimgUploader

  validates_presence_of :honeyimg, message: "Bobokám, tölts fel egy képet is!"
end
