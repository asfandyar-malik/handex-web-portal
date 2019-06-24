class AddNewColumnsIntoInsuranceTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :insurances, :repayment_profile_structure_payment_term_mid, :repayment_structure_payment_term_mid
    rename_column :insurances, :loan_term_other_description_payment_term_mid, :loan_term_start_description_payment_term_mid
    rename_column :insurances, :credit_start_date_payment_term_both, :loan_term_start_payment_term_both
    rename_column :insurances, :credit_start_special_description_payment_term_both, :loan_term_start_description_payment_term_both
    rename_column :insurances, :payment_vehichle_explain_payment_term_both, :payment_vehichle_payment_term_both
  end
end
