class AddTotalNumberToSmokingInformation < ActiveRecord::Migration[5.2]
  def change
    add_column :smoking_informations, :total_number, :integer
  end
end
