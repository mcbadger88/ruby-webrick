def parse_csv()
  rows = File.read('football_teams.csv')

  rowsarray = rows.split("\n")
  headers = []
  headers << rowsarray.shift
  
  headers = headers[0].split(",")
  arr =[]
  headers.each do |item|
    arr << item.to_sym # so that the keys are not strings
  end
  # p arr
  teams = []

  rowsarray.each do |item|
    teams << item.split(",")
  end

  # p headers.zip(teams[0]).to_h

  team_data = []

  teams.each do |item|
    team_data << arr.zip(item).to_h
  end

  # team_data.each do |item|
  #   item

team_data
end

parse_csv()



# data = [
#     {
#         id: 1,
#         team: "Collingwood",
#         city: "Melbourne",
#         premierships: 15
#     },
#     {
#         id: 2,
#         team: "West Coast",
#         city: "Perth",
#         premierships: 4
#     }
# ]

# html = {
#     tag: 'body',
#     class: nil,
#     text_content: nil
#     children: 
#         [ 
#             {
#                 tag: "header",
#                 class: "title",
#                 text_content: nil
#                 children: 
#                     [ 
#                         {
#                             tag: "h1",
#                             class: nil
#                             text_content: "Football teams"
#                             children: nil
#                         }
#                     ]
#             },
#             {
#                 tag: "div",
#                 class: "team-names",
#                 text_content: nil,
#                 children: 
#                     [
#                         {
#                             tag: "ul",

#                         }
                        
#                     ]
#             }
#         ]
#         }
#     ]
# }
