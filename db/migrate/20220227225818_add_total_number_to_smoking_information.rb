class AddTotalNumberToSmokingInformation < ActiveRecord::Migration[5.2]
  def change
    change_column :smoking_informations, :total_number, :integer
  end
end
