class NutritionApi
  BASE_URL = 'http://api.nal.usda.gov'

  def initialize(api_key)
    @api_key = api_key
    @conn = establish_connection
  end

  def fetch_report(report_id, rep_type, req_format = 'json')
    params = {}
    params[:ndbno] = report_id
    params[:type] = report_type(rep_type)
    params[:format] = req_format
    params[:api_key] = @api_key
    resp = @conn.get('/ndb/reports/', params)
    resp.body
  end

  private

  def establish_connection
    my_logger = Logger.new("#{Rails.root}/log/logfile.log")
    my_logger.level = Logger::INFO

    Faraday.new(url: BASE_URL) do |faraday|
      faraday.response :detailed_logger, Rails.logger
      faraday.adapter(Faraday.default_adapter)
    end
  end

  def report_type(rep_type)
    case rep_type
      when :full
        'f'
      when :stat
        's'
      else
        'b'
    end
  end

end