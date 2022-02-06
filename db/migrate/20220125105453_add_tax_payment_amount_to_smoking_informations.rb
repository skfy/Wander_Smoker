class AddTaxPaymentAmountToSmokingInformations < ActiveRecord::Migration[5.2]
  def change
    add_column :smoking_informations, :tax_payment_amount, :string
  end
end
