require "cgi"
require "net/http"
require "uri"
require "json"

class ViaCepAdapter
  def self.get_address(param)
    encoded_param = CGI.escape(param)

    url = URI.parse("https://viacep.com.br/ws/#{encoded_param}/json/")

    response = Net::HTTP.get_response(url)

    return { success: JSON.parse(response.body) } if response.is_a?(Net::HTTPSuccess)

    { failure: "Erro na consulta de endereço" }
  rescue StandardError => e
    { failure: "#{e.message}" }
  end
end
