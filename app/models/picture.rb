class Picture < ApplicationRecord

# If you find yourself using the same code over and over again to select records, you’ll want to save those queries as methods in your model.
  def self.newest_first
  Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  def self.pictures_created_in_year(year)
    Picture.where("YEAR(created_at) = ?", year.year)
  end

end
