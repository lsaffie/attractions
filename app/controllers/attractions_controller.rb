class AttractionsController < ApplicationController

before_filter :login_required, :only => [:list, :attractions, :index, :show, :create, :destroy, :edit]  

uses_tiny_mce(:options => {:theme => 'advanced',
                           #:browsers => %w{msie gecko},
                           :theme_advanced_toolbar_location => "top",
                           :theme_advanced_toolbar_align => "left",
                           :theme_advanced_resizing => true,
                           :theme_advanced_resize_horizontal => false,
                           :paste_auto_cleanup_on_paste => true,
                           #:theme_advanced_buttons1 => %w{formatselect fontselect fontsizeselect bold italic underline strikethrough separator justifyleft justifycenter justifyright indent outdent separator bullist numlist forecolor backcolor separator link unlink image undo redo},
                           :theme_advanced_buttons1 => %w{bold italic underline separator justifyleft justifycenter justifyright indent outdent separator bullist numlist separator link unlink undo redo},
                           :theme_advanced_buttons2 => [],
                           :theme_advanced_buttons3 => [],
                           :plugins => %w{contextmenu paste}},
              :only => [:new, :edit])
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    #@attraction_pages, @attractions = paginate :attractions, :per_page => 10
    @attractions = Attraction.find(:all)
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
    @price = Price.new
  end

  def create
    @attraction = Attraction.new(params[:attraction])
    #@price = @attraction.prices.build(params[:prices])
    if @attraction.save
      flash[:notice] = 'Attraction was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update_attributes(params[:attraction])
      flash[:notice] = 'Attraction was successfully updated.'
      redirect_to :action => 'show', :id => @attraction
    else
      render :action => 'edit'
    end
  end

  def destroy
    Attraction.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
