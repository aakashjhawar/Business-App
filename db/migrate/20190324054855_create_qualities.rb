class CreateQualities < ActiveRecord::Migration[5.2]
  def change
    create_table :qualities do |t|
      t.string :quality_name
      t.string :shade_no

      t.timestamps
    end
  end
end
