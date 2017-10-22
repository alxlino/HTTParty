#encoding:utf-8

Dado("que o cliente informou seus dados cadastrais:") do |table|                
    @request = table.rows_hash
    remove_account(@request)
end    

Dado("o cliente ja esta cadastrado") do                                      
    steps %{Quando faco uma requisicao POST para o servico accounts}
end
                                                                            
Quando("faco uma requisicao POST para o servico accounts") do                   
    @result = HTTParty.post(
       'https://nbooks.herokuapp.com/api/accounts',
       body: @request.to_json
    )
end                                                                             
                                                                            
Entao("o codigo de respostas deve ser {string}") do |status_code|                    
    expect(@result.response.code).to eql status_code
end

Entao("deve ser exibido um JSON com a mensagem:") do |message|                
    expect(@result.parsed_response['message']).to eql message
end