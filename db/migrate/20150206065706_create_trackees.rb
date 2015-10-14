class CreateTrackees < ActiveRecord::Migration
  def change
    create_table :trackees do |t|
      t.string :name
      t.datetime :last_login
      t.integer :login_count
      t.boolean :trackBrowser
      t.boolean :track
      t.boolean :flag

      t.timestamps
    end
  end
end
