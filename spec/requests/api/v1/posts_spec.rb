require 'rails_helper'

describe 'PostAPI' do
  it '获取全部post' do
    FactoryBot.create_list(:post, 10)

    get '/api/v1/posts'
    json = JSON.parse(response.body)

    # 状态码
    expect(response.status).to eq(200)

    # 返回正确的数据
    expect(json['data'].length).to eq(10)
  end
end
