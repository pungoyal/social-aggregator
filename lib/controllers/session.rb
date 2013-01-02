class SocialAggregator::Controllers::Session < Sinatra::Base
  get '/' do
    erb "
    <a href='auth/developer'>Login with developer</a><br>
    <a href='auth/facebook'>Login with facebook</a><br>
    <a href='auth/linkedin'>Login with linkedin</a><br>
    <a href='auth/twitter'>Login with twitter</a><br>"
  end

  get '/auth/:provider/callback' do
    session[:authenticated] = true
    erb "<h1>#{params[:provider]}</h1>
         <pre>#{JSON.pretty_generate(request.env['omniauth.auth'])}</pre>"
  end

  get '/auth/failure' do
    erb "<h1>Authentication Failed:</h1><h3>message:<h3> <pre>#{params}</pre>"
  end

  get '/auth/:provider/deauthorized' do
    erb "#{params[:provider]} has deauthorized this app."
  end

  get '/protected' do
    throw(:halt, [401, "Not authorized\n"]) unless session[:authenticated]
    erb "<pre>#{request.env['omniauth.auth'].to_json}</pre><hr>
         <a href='/logout'>Logout</a>"
  end

  get '/logout' do
    session[:authenticated] = false
    redirect '/'
  end
end
