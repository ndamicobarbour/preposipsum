class CreatePrepositions < ActiveRecord::Migration[5.1]
  def change
    create_table :prepositions do |t|
      t.string :p

      t.timestamps
    end
  end
end
