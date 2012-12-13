class AddOrganizationIdToChannel < ActiveRecord::Migration
  def change
    change_table :channels do |t|
      t.belongs_to :organization
    end
  end
end
