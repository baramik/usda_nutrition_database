class NutrientApi
  BASE_URL = 'http://api.nal.usda.gov'

  def initialize(api_key)
    @api_key = api_key
    @conn = establish_connection
  end

  def fetch_foods_report(report_id, rep_type, req_format = 'json')
    params = {}
    params[:ndbno] = report_id
    params[:type] = report_type(rep_type)
    params[:format] = req_format
    params[:api_key] = @api_key
    resp = @conn.get('/ndb/reports/', params)
    resp.body
  end

  #http://api.nal.usda.gov/ndb/list?format=json&lt=f&sort=id&api_key=DEMO_KEY
  def fetch_list(format = 'json', lt = :food, sort = 'id', items_to_fetch = 1500, offset = 0)
    params = {}
    params[:format] = format
    params[:lt] = list_type(lt)
    params[:sort] = sort
    params[:max] = items_to_fetch
    params[:offset] = offset
    params[:api_key] = @api_key
    resp = @conn.get('/ndb/list', params)
    resp.body
  end

  private

  def establish_connection
    my_logger = Logger.new("#{Rails.root}/log/logfile.log")
    my_logger.level = Logger::INFO

    Faraday.new(url: BASE_URL) do |faraday|
      faraday.response :detailed_logger, my_logger
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

  def list_type(list_type)
    case list_type
      when :foods
        'f'
      when :nutrients
        'n'
      when :food_groups
        'g'
      else
        'f'
    end
  end

end