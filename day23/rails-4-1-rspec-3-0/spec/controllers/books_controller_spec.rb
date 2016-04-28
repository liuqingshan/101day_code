require 'rails_helper'

RSpec.describe BooksController, :type => :controller do

  describe "GET index" do
    it "assigns all books as @books" do
      book = create(:book)
      get :index
      expect(assigns(:books)).to eq([book])
    end
  end

  describe "GET show" do
    it "assigns the requested book as @book" do
      book = create(:book)
      get :show, id: book.id
      expect(assigns(:book)).to eq(book)
    end
  end

  describe "GET new" do
    it "assigns a new book as @book" do
      get :new
      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe "GET edit" do
    it "assigns the requested book as @book" do
      book = create(:book)
      get :edit, {:id => book.id }
      expect(assigns(:book)).to eq(book)
    end
  end

  describe "POST create" do
    describe "with valid params" do

      it "creates a new Book" do
        expect {
          post :create, {:book => attributes_for(:book) }
        }.to change(Book, :count).by(1)
      end

      it "assigns a newly created book as @book" do
        post :create, {:book => attributes_for(:book) }
        expect(assigns(:book)).to be_a(Book)
        expect(assigns(:book)).to be_persisted
      end

      it "redirects to the created book" do
        post :create, {:book => attributes_for(:book) }
        expect(response).to redirect_to(Book.last)
      end
    end

    describe "with invalid params" do

      before :each do
        post :create, { :book => attributes_for(:invalid_book) }
      end

      it "assigns a newly created but unsaved book as @book" do
        expect(assigns(:book)).to be_a_new(Book)
      end

      it "re-renders the 'new' template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do

      before :each do
        @book = create(:book)
        put :update, {:id => @book.to_param, :book => attributes_for(:book, title: "new_title", isbn: "new_isbn")}
      end

      it "updates the requested book" do
        @book.reload
        expect(@book.title).to eq("new_title")
        expect(@book.isbn).to eq("new_isbn")
      end

      it "assigns the requested book as @book" do
        expect(assigns(:book)).to eq(@book)
      end

      it "redirects to the book" do
        expect(response).to redirect_to(@book)
      end
    end

    describe "with invalid params" do
      before :each do
        @book = create(:book)
        put :update, {:id => @book.id, :book => attributes_for(:invalid_book) }
      end
      it "assigns the book as @book" do
        expect(assigns(:book)).to eq(@book)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested book" do
      book = create(:book)
      expect {
        delete :destroy, {:id => book.id }
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      book = create(:book)
      delete :destroy, {:id => book.id }
      expect(response).to redirect_to(books_url)
    end
  end

end
