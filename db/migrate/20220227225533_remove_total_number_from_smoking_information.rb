class RemoveTotalNumberFromSmokingInformation < ActiveRecord::Migration[5.2]
  def change
    remove_column :smoking_informations, :total_number, :string
  end
end
