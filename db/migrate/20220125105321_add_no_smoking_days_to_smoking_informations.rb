class AddNoSmokingDaysToSmokingInformations < ActiveRecord::Migration[5.2]
  def change
    add_column :smoking_informations, :no_smoking_days, :string
  end
end
