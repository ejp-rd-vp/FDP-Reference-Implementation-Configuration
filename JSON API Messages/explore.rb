require 'rest-client'
require 'json'

un = "albert.einstein@example.com"
pw = "password"
domain = "http://localhost:9000/"

auth = {"Authorization" => "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI3ZTY0ODE4ZC02Mjc2LTQ2ZmItOGJiMS03MzJlNmUwOWY3ZTkiLCJpYXQiOjE3NDYwMjQ1NzksImV4cCI6MTc0NzIzNDE3OX0.2v_P6JIayWe6fMzbvqWL2IDMhIIcUIP8S1ga0rBFAIM6ICauxUYbMboq1-fo0gswLmeDlQwBXUtDcTS0TkvUmQ"}
contenttype = {accept: :json, content_type: :json}


begin
  response = RestClient::Request.execute(
    method: :get,
    url: domain + "metadata-schemas",
    headers: auth.merge(contenttype),
  )
  # puts response.body
rescue RestClient::ExceptionWithResponse => e
  puts "Error: #{e.response}"
end

response = JSON.parse(response.body)

response.each do |record|
  latest = record['latest']
  # puts latest.keys
    puts latest['uuid']
    puts latest['name']
    puts latest['type']
    puts; puts
end


# tests:  ddfc6ee1-899f-43bc-a2fa-727a26c4a8cc   e8af7982-fd4d-41be-8921-3e0e90ef5452
# resp = RestClient.put("#{location}/meta/state", 
# '{ "current": "PUBLISHED" }', 
# headers={authorization: "Bearer #{$token}",  
# content_type: 'application/json'})        

# each record is:
# "uuid": "6a668323-3936-4b53-8380-a4fd2ed082ee",
# "version": "1.0.0",
# "versionUuid": "71d77460-f919-4f72-b265-ed26567fe361",
# "previousVersionUuid": null,
# "name": "Resource",
# "published": false,
# "abstractSchema": true,
# "latest": true,
# "type": "INTERNAL",
# "origin": "https://purl.org/fairdatapoint/app",
# "importedFrom": "https://purl.org/fairdatapoint/app",
# "definition": "@prefix :         <http://fairdatapoint.org/> .\n@prefix dash:     <http://datashapes.org/dash#> .\n@prefix dcat:     <http://www.w3.org/ns/dcat#> .\n@prefix dct:      <http://purl.org/dc/terms/> .\n@prefix foaf:     <http://xmlns.com/foaf/0.1/>.\n@prefix sh:       <http://www.w3.org/ns/shacl#> .\n@prefix xsd:      <http://www.w3.org/2001/XMLSchema#> .\n\n:ResourceShape a sh:NodeShape ;\n  sh:targetClass dcat:Resource ;\n  sh:property [\n    sh:path dct:title ;\n    sh:nodeKind sh:Literal ;\n    sh:minCount 1 ;\n    sh:maxCount  1 ;\n    dash:editor dash:TextFieldEditor ;\n  ], [\n    sh:path dct:description ;\n    sh:nodeKind sh:Literal ;\n    sh:maxCount 1 ;\n    dash:editor dash:TextAreaEditor ;\n  ], [\n    sh:path dct:publisher ;\n    sh:node :AgentShape ;\n    sh:minCount 1 ;\n    sh:maxCount 1 ;\n    dash:editor dash:BlankNodeEditor ;\n  ], [\n    sh:path dct:hasVersion ;\n    sh:name \"version\" ;\n    sh:nodeKind sh:Literal ;\n    sh:minCount 1 ;\n    sh:maxCount 1 ;\n    dash:editor dash:TextFieldEditor ;\n    dash:viewer dash:LiteralViewer ;\n  ], [\n    sh:path dct:language ;\n    sh:nodeKind sh:IRI ;\n    sh:maxCount 1 ;\n    dash:editor dash:URIEditor ;\n    dash:viewer dash:LabelViewer ;\n  ], [\n    sh:path dct:license ;\n    sh:nodeKind sh:IRI ;\n    sh:maxCount 1 ;\n    dash:editor dash:URIEditor ;\n    dash:viewer dash:LabelViewer ;\n  ], [\n    sh:path dct:rights ;\n    sh:nodeKind sh:IRI ;\n    sh:maxCount 1 ;\n    dash:editor dash:URIEditor ;\n    dash:viewer dash:LabelViewer ;\n  ] .\n\n:AgentShape a sh:NodeShape ;\n  sh:targetClass foaf:Agent ;\n  sh:property [\n    sh:path foaf:name;\n    sh:nodeKind sh:Literal ;\n    sh:minCount 1 ;\n    sh:maxCount  1 ;\n    dash:editor dash:TextFieldEditor ;\n  ] .\n",
# "description": "",
# "targetClasses": [
#   "http://www.w3.org/ns/dcat#Resource"
# ],
# "extendsSchemaUuids": [],
# "suggestedResourceName": null,
# "suggestedUrlPrefix": null
# },
# "draft": null,
# "versions": [
# "1.0.0"
# ],
# "extendSchemaUuids": [],
# "childSchemaUuids": [
# "2aa7ba63-d27a-4c0e-bfa6-3a4e250f4660",
# "866d7fb8-5982-4215-9c7c-18d0ed1bd5f3",
# "ebacbf83-cd4f-4113-8738-d73c0735b0ab",
# "89d94c1b-f6ff-4545-ba9b-120b2d1921d0"
# ]
# },
# extendSchemaUuids
# childSchemaUuids
