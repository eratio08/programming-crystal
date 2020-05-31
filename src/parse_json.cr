require "json"
path = "src/example.json"
out_path = "src/ok.txt"

begin
  if File.exists?(path)
    raw_file = File.read(path)
    map = JSON.parse(raw_file)
    File.write(out_path, "ok")
    :ok
  end
rescue JSON::ParseException
  raise "Could not parse file"
rescue ex
  raise "Other error: #{ex.message}"
end
