class Post < ApplicationRecord
  # ApplicationRecord 继承自 ActiveRecord::Base，后者定义了一系列有用的方法。
  # 使用 ActiveRecord::Base.table_name= 方法可以指定要使用的表名
  # self.table_name = "test_posts"
  # 如果这么做，还要调用 set_fixture_class 方法，手动指定固件（my_products.yml）的类名
  # fixtures :test_posts
  # 还可以使用 ActiveRecord::Base.primary_key= 方法指定表的主键：
  # self.primary_key = "product_id"
  validates :title, presence: true,uniqueness: true
end
