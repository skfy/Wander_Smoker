class RemoveTaxPaymentAmountFromSmokingInformation < ActiveRecord::Migration[5.2]
  def change
    remove_column :smoking_informations, :TaxPaymentAmount, :integer
  end
end
