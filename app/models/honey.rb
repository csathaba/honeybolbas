class Honey < ApplicationRecord
  mount_uploader :honeyimg, HoneyimgUploader

  validates_presence_of :honeyimg, message: "Bobokám, tölts fel egy képet is!"


  def next
    self.class.where('id > ?', id).order(:id)
  end

   def rank_up
    r = 1
    @id = id
    self.class.order(:rank).each do |honey|
      if honey.id == @id
        honey.rank = r
        honey.save
      end
      r = r+1
    end
  end
end
