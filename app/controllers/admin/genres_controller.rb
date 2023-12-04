class Admin::GenresController < ApplicationController

def index
  @genres = Genre.all
end

def create
  @genres = Genre.new
end

def edit
end

def update
end

end
