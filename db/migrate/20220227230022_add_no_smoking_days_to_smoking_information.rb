class AddNoSmokingDaysToSmokingInformation < ActiveRecord::Migration[5.2]
  def change
    add_column :smoking_informations, :no_smoking_days, :integer
  end
end
