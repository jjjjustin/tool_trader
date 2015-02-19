class Tool < ActiveRecord::Base
  belongs_to :user

  def self.to_csv(options ={})
    CSV.generate do |csv|
      csv << column_names
      all.each do |tool|
        csv << tool.attributes.values_at(*column_names)
      end
    end
  end
end

