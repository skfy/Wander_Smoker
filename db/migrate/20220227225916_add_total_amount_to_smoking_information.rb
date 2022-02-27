class AddTotalAmountToSmokingInformation < ActiveRecord::Migration[5.2]
  def change
    add_column :smoking_informations, :total_amount, :integer
  end
end
