class AddFootnoteIdToFootnotes < ActiveRecord::Migration
  def change
    add_column :footnotes, :footnote_id, :integer
  end
end
