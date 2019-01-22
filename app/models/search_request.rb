require 'csv'

class SearchRequest < ApplicationRecord
  belongs_to :user
  validates :type_transac, inclusion: { in: ["Vente", "Location"], message: "achat ou location" }
  validates :type_of_property, inclusion: { in: ["Appartement", "Maison", "Parking", "Terrain", "Boutique", "Local Commercial", "Bureaux"], message: "Choisir un type valide" }

  def insee_code
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row, encoding: 'windows-1251:utf-8' }
    filepath    = File.dirname(__FILE__) + '/../../insee-codes.csv'
    insee_hash = {}
    CSV.foreach(filepath, csv_options) do |row|
      insee_hash[row["Nom"].downcase] = row["Insee"].insert(-4, "0") unless row["Nom"].nil?
    end

    return insee_hash[city.downcase]
  end
end
