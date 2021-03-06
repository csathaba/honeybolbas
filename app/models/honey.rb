class Honey < ApplicationRecord
  mount_uploader :honeyimg, HoneyimgUploader

  validates_presence_of :honeyimg, message: "Bobokám, tölts fel egy képet is!"


  def next
    self.class.where('id > ?', id).order(:id)
  end

  def set_ranks
    r = 1
    self.class.order(:rank).each do |honey|
      honey.rank = r
      honey.save
      r = r + 1
    end
  end

  def rank_up
    change_rank("up")
  end

  def rank_down
    change_rank("down")
  end

  def print_honeys
    self.class.order(:id).each do |honey|
      puts "id: #{honey.id}, rank: #{honey.rank}"
    end
  end

  protected

  def change_rank(direction)
    @id = id
    @rank = rank
    # puts "id: #{@id}, rank: #{@rank}"
    self.class.order(:rank).each do |honey|
      if honey.id == @id
        if direction == "up" and @rank != 1
          honey.rank = @rank - 1
          honey.save
        elsif direction == "down" and @rank != self.class.order(:rank).last.rank
          honey.rank = @rank + 1
          honey.save
        end

      elsif direction == "up" and honey.rank == @rank - 1
        # puts "Time to increment the rank! id: #{honey.id}, rank: #{honey.rank}"
        honey.rank = honey.rank + 1
        honey.save

      elsif direction == "down" and honey.rank == @rank + 1
        honey.rank = honey.rank - 1
        honey.save
      end
      # puts "After id: #{honey.id}, rank: #{honey.rank}"
    end
  end

end
