Layout.delete_all
two_col = Layout.create(name: '2-Column', columns: 2)
three_col = Layout.create(name: '3-Column', columns: 3)

Page.delete_all
home = Page.create(name: 'home', layout_id: two_col.id)
about = Page.create(name: 'about', layout_id: three_col.id)

Block.delete_all
side_nav = Block.create(name: 'Side Nav')
comments = Block.create(name: 'Comments')

home.add_block_to_column(side_nav, 1)
home.add_block_to_column(comments, 2)

about.add_block_to_column(comments, 3)
about.add_block_to_column(side_nav, 3)
