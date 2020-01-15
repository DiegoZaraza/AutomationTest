module Helpers
  module Options
    def result_extract search
      value = search.split(' ')
      value[4]
    end

    def convert_json
      table_options = {
      table_style: "border: 1px solid black",
      table_class: "table table-striped table-hover table-condensed table-bordered",
      table_attributes: "border=1"
      }

      json = File.open("report.json")
      json1 = json.read

      parse = JSON.parse(json1).to_json
      json2table = Json2table::get_html_table(parse, table_options)
      json2table
    end
  end
end
