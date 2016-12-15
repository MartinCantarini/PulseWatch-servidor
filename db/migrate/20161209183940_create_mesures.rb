class CreateMesures < ActiveRecord::Migration[5.0]
  def change
    create_table :mesures do |t|
      t.integer :value
      t.references :user

      t.timestamps
    end
  end
end
