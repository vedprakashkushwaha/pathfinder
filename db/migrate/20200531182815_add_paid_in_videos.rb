class AddPaidInVideos < ActiveRecord::Migration
  def change
    add_column :videos, :paid, :boolean
  end
end
