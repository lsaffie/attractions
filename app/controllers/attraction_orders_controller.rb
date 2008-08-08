class AttractionOrdersController < ApplicationController
  
  # Use before_filter :login_requrired in combination with :only => [] or :except => []
  # in order to  protect actions that need logins.
  #
  # If the user does not have access to the page, the before_filter will throw them to the 
  # login page.  If the login fails, they will stay on the login page.  If they succeed, they
  # should be returned to the page they were on, or if they don't have cookies activated, they 
  # will be re-directed to the /acttractions_orders page
  before_filter :login_required, :only => [:list, :attractions, :index, :show, :create, :destroy]
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    #@attraction_order_pages, @attraction_orders = paginate :attraction_orders, :per_page => 10
    @attraction_orders = AttractionOrder.find(:all)
    @attraction_order_pages = AttractionOrder.find(:all)
  end

  def show
    @attraction_order = AttractionOrder.find(params[:id])
  end

  def new
    @attraction_order = AttractionOrder.new
    attractions_all = Attraction.find(:all)
    @quantity_option = [1,2,3,4,5,6,7,8,9,10]
    #attractions_selected = Attraction.find(5,23)
		#attractions_merged = attractions_all - attractions_selected
		#@attractions = attractions_selected + attractions_merged
		@attractions = attractions_all
    @cart = find_attraction_cart
  end

  def create
    @attraction_order = AttractionOrder.new(params[:attraction_order])
    if @attraction_order.save
      flash[:notice] = 'ATTRACTION ORDER WAS SUCCESSFULLY CREATED.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @attraction_order = AttractionOrder.find(params[:id])
  end

  def update
    @attraction_order = AttractionOrder.find(params[:id])
    if @attraction_order.update_attributes(params[:attraction_order])
      flash[:notice] = 'AttractionOrder was successfully updated.'
      redirect_to :action => 'show', :id => @attraction_order
    else
      render :action => 'edit'
    end
  end

  def destroy
    AttractionOrder.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
	
	def attraction_description
		@attraction = Attraction.find(params[:id])
		@cart = find_attraction_cart
		@quantities = {1,2,3,4,5,6,7,8,9,10}
		redirect_to(:action => 'new')
	end
	
	def add_attraction_to_cart_c
		@cart = find_attraction_cart
		@count = Integer(params[:count])
		@attraction = Attraction.find(params[:id])
		@price = @attraction.price_children
		@type = "Children"
		@cart.add_attraction(@attraction,@count,@price,@type)
		redirect_to(:action => 'attraction_description', :id => @attraction)
	end
	
	def add_attraction_to_cart_a
		@cart = find_attraction_cart
		@count = Integer(params[:count])
		@attraction = Attraction.find(params[:id])
		@price = @attraction.price_adult
		@type = "Adult"
		@cart.add_attraction(@attraction,@count,@price,@type)
		redirect_to(:action => 'attraction_description', :id => @attraction)
	end
	
	def add_attraction_to_cart_s
		@cart = find_attraction_cart
		@count = Integer(params[:count])
		@attraction = Attraction.find(params[:id])
		@price = @attraction.price_senior
		@type = "senior"
		@cart.add_attraction(@attraction,@count,@price,@type)
		redirect_to(:action => 'attraction_description', :id => @attraction)
	end
	
	def add_attraction_to_cart_o
		@cart = find_attraction_cart
		@count = Integer(params[:count])
		@attraction = Attraction.find(params[:id])
		@price = @attraction.optional_field_price
		@type = "Optional Field"
		@cart.add_attraction(@attraction,@count,@price,@type)
		redirect_to(:action => 'attraction_description', :id => @attraction)
	end
	
	def show_attraction_cart
		@cart = find_attraction_cart
	end 

  def empty_cart
    session[:attraction_cart] = nil
    flash[:notice] = "YOUR CART IS EMPTY"
    redirect_to :action => :new
  end
  
  def checkout
    @cart = find_attraction_cart
    if @cart.items.empty?
      flash[:notice] = "YOUR CART IS EMPTY"
      redirect_to :action => :new
    else
      @order = AttractionOrder.new
    end
  end
  
  def save_order
    @cart = find_attraction_cart
    @order = AttractionOrder.new(params[:attraction_order])
    @order.add_line_items_from_cart(@cart)
    @order.set_total(@order)
    if @order.save
      OrderMailer.deliver_confirm_admin(@order,@cart)
      OrderMailer.deliver_confirm_guest(@order,@cart)
      session[:attraction_cart] = nil
      #redirect_to_index ("Thank you for your order")
      redirect_to :action => :thank_you
    else
      flash[:notice] = "PLEASE FILL OUT ALL REQUIRED FIELDS"
      render :action => :checkout
    end
  end
  
  def redirect_to_index(msg)
    flash[:notice] = msg if msg
    redirect_to :action => :new
  end
  
  def status   
    attraction = AttractionOrder.find(params[:id])
    attraction.update_attribute(:order_status,params[:order_status])
    attraction.update_attribute(:updated_by,session[:username])
    redirect_to :action => :list
  end
  
  def thank_you 
    #render :action => :sendmail
  end
  
  def display_map
    @attraction = Attraction.find(params[:id])
  end
  
  def more
    @attraction = Attraction.find(params[:id])
  end
		
	private #----------------
	
	def find_attraction_cart
		session[:attraction_cart] ||= AttractionCart.new
	end
	
	def sendmail
    #email = @params["email"]
 	  #recipient = email["recipient"]
 	  #subject = email["subject"]
 	  #message = email["message"]
       #Emailer.deliver_contact(recipient, subject, message)
       OrderMailer.deliver_confirm_admin()
       OrderMailer.deliver_confirm_guest()
       return if request.xhr?
  end

end 
