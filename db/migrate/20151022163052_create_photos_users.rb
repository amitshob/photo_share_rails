class CreatePhotosUsers < ActiveRecord::Migration
  def change
    create_table :photos_users do |t|
      t.belongs_to :photo, index: true
      t.belongs_to :user, index: true
    end
  end
end
