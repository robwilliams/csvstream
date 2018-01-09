class ContactsController < ApplicationController
  def index
    respond_to do |format|
      format.csv do
        self.response_body = enumthingy
      end
    end
  end

  private

  def enumthingy
    Enumerator.new do |stream|
      10.times do |x|
        sleep 0.1
        stream << x.to_s
      end
    end
  end

end
