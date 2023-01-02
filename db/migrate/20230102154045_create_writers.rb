class CreateWriters < ActiveRecord::Migration[7.0]
  def change
    create_table :writers do |t|
      t.string :name
      t.string :feed
      t.string :website
      t.string :substack
      t.string :twitter
      t.boolean :staff
      t.boolean :mentor

      t.timestamps
    end
  end
end
