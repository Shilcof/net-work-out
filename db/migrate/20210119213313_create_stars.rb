class CreateStars < ActiveRecord::Migration[6.1]
  def change
    create_table :stars do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.references :starable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
