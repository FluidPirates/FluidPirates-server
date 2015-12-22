puts File.read("routes.txt").lines.map { |l| l.scan(/(?:GET|POST|DELETE|PATCH|PUT) +[a-zA-Z0-9:_\/]+/)[0].to_s.gsub(/ +/, " ") }
