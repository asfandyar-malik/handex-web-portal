class AddComannyNameToOnboarding < ActiveRecord::Migration[5.2]
    def change
        add_column :onboardings, :company_name, :string
        add_column :onboardings, :number_of_employees, :integer
        add_column :onboardings, :year_founded, :string
        add_column :onboardings, :legal_form, :string
        add_column :onboardings, :address_line_one, :string
        add_column :onboardings, :address_line_two, :string
        add_column :onboardings, :post_code, :integer
        add_column :onboardings, :country, :string
        add_column :onboardings, :tax_id, :string
        add_column :onboardings, :commercial_register_name, :string
        add_column :onboardings, :commercial_register_number, :string
        add_column :onboardings, :date_of_registration, :datetime
        add_column :onboardings, :last_fiscal_year, :string
        add_column :onboardings, :is_euler_cover_in_past, :boolean
        add_column :onboardings, :euler_dnnr_number, :string
        add_column :onboardings, :is_insolvent_in_last_five_years, :boolean
        add_column :onboardings, :is_investigated_in_last_five_years, :boolean
        add_column :onboardings, :is_business_with_sanctioned_company, :boolean
        add_column :onboardings, :business_with_sanctioned_company_name, :string
        add_column :onboardings, :shareholder_name, :string
        add_column :onboardings, :shareholder_participation, :string
        add_column :onboardings, :is_shareholder_of_another_company, :boolean
        add_column :onboardings, :shareholder_of_another_company_name, :string
        add_column :onboardings, :shareholder_of_another_company_participation, :string
        add_column :onboardings, :is_legal_representative_pep, :boolean
        add_column :onboardings, :legal_representative_pep_firstname, :string
        add_column :onboardings, :legal_representative_pep_lastname, :string
        add_column :onboardings, :legal_representative_pep_dob, :string
        add_column :onboardings, :legal_representative_pep_address_line_one, :string
        add_column :onboardings, :legal_representative_pep_address_line_one, :string
        add_column :onboardings, :legal_representative_pep_postcode, :integer
        add_column :onboardings, :legal_representative_pep_country, :string
        add_column :onboardings, :legal_representative_pep_reason, :text
        add_column :onboardings, :is_source_of_fund_own_assets, :boolean
        add_column :onboardings, :is_source_of_fund_assets_transfer, :boolean
        add_column :onboardings, :is_source_of_fund_income_operations, :boolean
        add_column :onboardings, :is_source_of_fund_assets_sales, :boolean
        add_column :onboardings, :is_source_of_fund_insurance_indemnization, :boolean
        add_column :onboardings, :is_source_of_fund_no_assets, :boolean
        add_column :onboardings, :is_source_of_fund_other, :boolean
        add_column :onboardings, :is_source_of_fund_other_specify, :text

    end
end
