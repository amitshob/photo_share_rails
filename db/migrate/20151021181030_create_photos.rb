class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.column :title, :string

      t.timestamps
    end
  end
end
