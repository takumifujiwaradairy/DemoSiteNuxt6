# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.create(title: 'AAA', body: 'AAAAAAAAAAAAAAAA', user_id: '1')
Article.create(title: 'BBB', body: 'BBBBBBBBBBBBBBBB', user_id: '1')
Article.create(title: 'CCC', body: 'CCCCCCCCCCCCCCCC', user_id: '1')

User.create(name: 'AAA', email: 'aaa@bar.com', password: 'AAAAAA')
User.create(name: 'BBB', email: 'bbb@bar.com', password: 'BBBBBB')
User.create(name: 'CCC', email: 'ccc@bar.com', password: 'CCCCCC')

Tag.create(name: '日本食')
Tag.create(name: 'フランス料理')
Tag.create(name: '中華')

ArticleTagRelation.create(article_id: 1, tag_id:1)
ArticleTagRelation.create(article_id: 2, tag_id:2)
ArticleTagRelation.create(article_id: 3, tag_id:2)