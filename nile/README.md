## Readme file for the development process of this app.

### Tuturial 2

###### Link Below
[HERE](https://www.youtube.com/watch?v=nCb_mqAKusg&list=PLbTv9eGiI03u1-JFkFpPGsR_hMre6WX3e&index=2) 

###### Commands run
- rails routes (to check all existing routes)
- rails g controller BooksController index (creates controller BooksController)
- rails g model Book title:string author:string (creates model Books)
- rails db:migrate
- Book.create!(author: 'nanco pulao', title: 'good ban!') (this command is run in rails console I.E. rails c)

### Tuturial 3

###### Link Below
[HERE](https://www.youtube.com/watch?v=rFHCMu2t4SY&list=PLbTv9eGiI03u1-JFkFpPGsR_hMre6WX3e&index=3) 

###### Commands run
- rails routes | grep book (just like `rails routes` but will output the routes generated for book only)


### Tutorial 4

##### Link Below
[HERE](https://www.youtube.com/watch?v=yZM4oRZvltU&list=PLbTv9eGiI03u1-JFkFpPGsR_hMre6WX3e&index=4)

- Basically this code only talks about status codes - not much coding.

### Tutorial 5 - Rails validations

- We modify code in `app/models/book.rb`
- More on the subject --> https://guides.rubyonrails.org/active_record_validations.html

### Tutorial 6 - Destroy route [ DELETE ]
- Add destroy method in `app/controllers/books_controller.rb`
- Add route in `config/routes.rb`

### Tutorial 7 - exception handling [ rescue_from ]
- Use rescue_from for specific ActiveRecord errors `ActiveRecord::RecordNotFound`.
- more info [HERE](https://edgeapi.rubyonrails.org/classes/ActiveSupport/Rescuable/ClassMethods.html)