class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :phone_1
      t.string :phone_2
      t.string :fax
      t.string :url

      t.timestamps
    end
  end
end
