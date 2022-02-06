class CreateSmokingInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :smoking_informations do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
