require 'unirest'
module MakerBlog
  class Client
    def list_posts
      response = Unirest.get('http://makerblog.herokuapp.com/posts',
        headers: { "Accept" => "application/json" })
      posts = response.body
      posts.each do |post|
        puts post
      end
    end

    def show_post(id)
      url = 'http://makerblog.herokuapp.com/posts/' + id.to_s
      response = Unirest.get(url,
        headers: { "Accept" => "application/json" })
      puts response.body
    end

    def edit_post(id, options = {})
      url = 'http://makerblog.herokuapp.com/posts/' + id.to_s
      params = {}

      params[:name] = options[:name] unless options[:name].nil?
      params[:title] = options[:title] unless options[:title].nil?
      params[:content] = options[:content] unless options[:content].nil?

      response = Unirest.put(url,
        parameters: { :post => params },
        headers: { "Accept" => "application/json",
                   "Content-Type" => "application/json" })


      puts response.body
    end

    def delete_post(id)
      url = 'http://makerblog.herokuapp.com/posts/' + id.to_s
      response = Unirest.delete(url,
        headers: { "Accept" => "application/json" })
      puts response.code
    end
  end
end

client = MakerBlog::Client.new
# client.show_post(18620)
client.list_posts
# client.edit_post(18624, {:name => "Snake Plissssken",title: "Don't kill birds", :content => "Escape from LA"})
# client.delete_post(18623)