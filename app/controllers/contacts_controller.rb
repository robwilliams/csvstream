# https://medium.com/table-xi/stream-csv-files-in-rails-because-you-can-46c212159ab7
# https://blog.clearbit.com/rack-csv-streaming/
# https://gist.github.com/CMCDragonkai/6bfade6431e9ffb7fe88
class ContactsController < ApplicationController
  def index
    respond_to do |format|
      format.csv do
        headers["X-Accel-Buffering"] = "no" # https://www.nginx.com/resources/wiki/start/topics/examples/x-accel/#x-accel-buffering
				headers["Cache-Control"] = "no-cache" # if Cache-Control is set to anything but "no-cache" streaming does not occur
        self.response_body = Enumerator.new do |yielder|
          Contact.csv_header(yielder)
          Contact.csv_rows(yielder)
        end
      end
    end
  end
end
