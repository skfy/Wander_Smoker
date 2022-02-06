class AddTotalNumberToSmokingInformations < ActiveRecord::Migration[5.2]
  def change
    add_column :smoking_informations, :total_number, :string
  end
end
