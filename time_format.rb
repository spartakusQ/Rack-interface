class TimeFormat

  attr_reader :errors, :result

  Format = { year: '%Y', month: '%m', day: '%d', hour: '%k', minute: '%M', second: '%S' }.freeze

  def initialize(request)
    @request = request
    @errors = []
    @time_string = ''
    @result = nil
    format_time
  end

  private

  def format_time
    matching(@request["format"].split(','))
    if @errors.empty?
      t = Time.now
      @result = t.strftime(@time_string.chop!)
    end
    nil
  end

  def matching(querys)
    querys.each do |query|
      if Format[query.to_sym].nil?
        @errors.push(query)
      else
        format_time_string(Format[query.to_sym])
      end
    end
  end

  def format_time_string(query)
    @time_string << query << '-'
  end

end
