class CreateShirts < ActiveRecord::Migration[7.1]
  def change
    create_table :shirts do |t|
      t.string :style
      t.string :color
      t.string :size

      t.timestamps
    end
  end
end
