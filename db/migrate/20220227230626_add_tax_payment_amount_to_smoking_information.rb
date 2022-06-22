class AddTaxPaymentAmountToSmokingInformation < ActiveRecord::Migration[5.2]
  def change
    change_column :smoking_informations, :tax_payment_amount, :integer
  end
end
