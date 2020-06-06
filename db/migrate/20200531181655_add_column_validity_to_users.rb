class AddColumnValidityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :paid_videos_validity, :date
  end
end
