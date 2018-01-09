require "csv"

class Contact < ApplicationRecord

  def self.csv_header(output="")
    Rails.logger.debug "generating header row"
    output << CSV.generate_line(%w(
      id
      name
      company_name
      email
      date_of_birth
      needlessly_expensive_count
    ))
  end

  def self.csv_rows(output="")
    find_each do |contact|
      Rails.logger.debug "generating csv row for contact: #{contact.id}"
      output << contact.to_csv
    end
  end

  def to_csv
    CSV.generate_line [
      id,
      name,
      company_name,
      email,
      date_of_birth,
      needlessly_expensive_count
    ]
  end

  def needlessly_expensive_count
    sleep(0.01) # to simulate slow rendering
    1234
  end
end
