class ApplicationController < ActionController::Base
  include PrismicHelper
  include PrismicController

  protect_from_forgery with: :exception

  # before_action :authenticate_user!
  # Req authenticate user when trying to access these views
  before_action :authenticate_user!, :only => [:welcome, :resources, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  # protected  // For some reason uncommenting this "protected" code prevents application/jobs from showing

  def configure_permitted_parameters
      @contactform = Contactform.new
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :remember_me)}
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :thumbnail, :about, :skills)}
      # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :thumbnail, :about, :skills, :password, :current_password, :remember_me)}
  end

  # Routes users to welcome page after login and sign up
  def after_sign_in_path_for(resource)
    application_welcome_path
  end

  # Rescue bad preview cookies errors for some actions
  rescue_from Prismic::Error, with: :clearcookies

  # Homepage action: querying the "everything" form (all the documents, paginated by 20)
  def index
    @contactform = Contactform.new
  end

  def welcome
    @contactform = Contactform.new
  end 

  def jobs
    id = params[:id]
    slug = params[:slug]
    @documents = api.all({
      "orderings" => '[document.last_publication_date desc]', 
      "page" => params[:page] ? params[:page] : "1",
      "page_size" => params[:page_size] ? params[:page_size] : 20, 
      "ref" => ref,
    })  
    @jobemail = Jobemail.new
    @contactform = Contactform.new
  end

  def resources
    @contactform = Contactform.new
  end  

  # Single-document page action: mostly, setting the @document instance variable, and checking the URL
  def document
    id = params[:id]
    slug = params[:slug]

    @google_id = api.experiments.current
    @document = api.getByID(id)
    @jobemail = Jobemail.new
    @contactform = Contactform.new

    # This is how an URL gets checked (with a clean redirect if the slug is one that used to be right, but has changed)
    # Of course, you can change slug_checker in prismic_service.rb, depending on your URL strategy.
    # @slug_checker = PrismicService.slug_checker(@document, slug)
    # if !@slug_checker[:correct]
    #   render inline: "Document not found", status: :not_found if !@slug_checker[:redirect]
    #   redirect_to document_path(id, @document.slug), status: :moved_permanently if @slug_checker[:redirect]
    # end
  end

  # Search result: querying all documents containing the q parameter
  def search
    @contactform = Contactform.new
    @google_id = api.experiments.current
    @documents = api.form('everything')
                    .query(Prismic::Predicates.fulltext('document', params[:q]))
                    .page(params[:page] ? params[:page] : '1')
                    .page_size(params[:page_size] ? params[:page_size] : '20')
                    .submit(ref)
  end

  # For writers to preview a draft with the real layout
  def preview
    preview_token = params[:token]
    redirect_url = api.preview_session(preview_token, link_resolver(), '/')
    cookies[Prismic::PREVIEW_COOKIE] = { value: preview_token, expires: 30.minutes.from_now }
    redirect_to redirect_url
  end
end