class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :name
      t.string :console
      t.string :games
      t.string :searchActivityDestiny
      t.string :searchDestinyLightLevel
      t.string :searchDestinyClass
      t.string :searchActivityGrandTheftAutoOnline
      t.string :searchGTALevel
      t.string :searchActityNBA2k
      t.string :searchNBAPosition
      t.string :searchActivityDAInquisition


      t.text :notes

      t.timestamps null: false
    end
  end
end
