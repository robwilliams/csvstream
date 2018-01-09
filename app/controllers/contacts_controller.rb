class ContactsController < ApplicationController
  def index
    respond_to do |format|
      format.csv do
        headers["X-Accel-Buffering"] = "no" # https://www.nginx.com/resources/wiki/start/topics/examples/x-accel/#x-accel-buffering
        headers["Cache-Control"] = "no-cache" # if Cache-Control is set to anything but "no-cache" streaming will not occur
        self.response_body = Enumerator.new do |yielder|
          Contact.csv_header(yielder)
          Contact.csv_rows(yielder)
        end
      end
    end
  end
end
