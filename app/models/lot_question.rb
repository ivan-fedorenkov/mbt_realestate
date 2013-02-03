class LotQuestion
  extend ActiveModel::Naming 
  include ActiveModel::Validations
  include ActiveModel::Conversion

  validates_presence_of :name, :email, :question

  attr_accessor :name, :phone, :email, :question

  def initialize(params = {:name => nil, :phone => nil, :email => nil, :question => nil})
    @name, @phone, @email, @question = params[:name], params[:phone], params[:email], params[:question]
  end

  def persisted?
    false
  end
end