class RenameSeekerBioAndHousingPostModelNames < ActiveRecord::Migration
  def change
    rename_table :housing_posts, :posts
    rename_table :seeker_bios, :profiles
  end
end
