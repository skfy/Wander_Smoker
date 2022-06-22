class AddTotalAmountToSmokingInformation < ActiveRecord::Migration[5.2]
  def change
    change_column :smoking_informations, :total_amount, :integer
  end
end
