require "./lib/ranks"
require "./lib/input_reader"

module PatrickCarver
  module ProjectEuler
    module Problem54
      class App
        def run(input_file)
          parser = InputParser.new.parse(input_file)
        end
      end
    end
  end
end

app = PatrickCarver::ProjectEuler::Problem54::App.new
app.run "poker.txt"
