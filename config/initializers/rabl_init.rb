class PrettyJson
  def self.dump(object)
    JSON.pretty_generate(object, indent: "  ")
  end
end

Rabl.configure do |config|
  config.json_engine = PrettyJson
end
