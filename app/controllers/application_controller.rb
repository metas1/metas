class ApplicationController < ActionController::Base
  include PrismicHelper
  include PrismicController

  protect_from_forgery with: :exception

  # This code makes sure not to allow anyone to view any page other than 'index', unless they are signed in
  before_action :authenticate_user!, :except => [:index]

  before_action :configure_permitted_parameters, if: :devise_controller?

  # protected  // For some reason uncommenting this "protected" code prevents application/jobs from showing

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :remember_me)}
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :thumbnail, :about, :skills, :password, :current_password, :remember_me)}
  end

  # This block of code is what routes users to welcome page after login and sign up
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || application_welcome_path
  end

  def after_sign_up_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || application_welcome_path
  end

  # Rescue bad preview cookies errors for some actions
  rescue_from Prismic::Error, with: :clearcookies

  # Homepage action: querying the "everything" form (all the documents, paginated by 20)
  def index
  end

  def jobs
    id = params[:id]
    slug = params[:slug]
    @google_id = api.experiments.current
    @documents = api.all({
      "page" => params[:page] ? params[:page] : "1",
      "page_size" => params[:page_size] ? params[:page_size] : 20, 
      "ref" => ref,
    })
  end

  # Single-document page action: mostly, setting the @document instance variable, and checking the URL
  def document
    id = params[:id]
    slug = params[:slug]

    @google_id = api.experiments.current
    @document = api.getByID(id)
    @all_users = User.all
    @user = current_user
    # This is how an URL gets checked (with a clean redirect if the slug is one that used to be right, but has changed)
    # Of course, you can change slug_checker in prismic_service.rb, depending on your URL strategy.
    @slug_checker = PrismicService.slug_checker(@document, slug)
    if !@slug_checker[:correct]
      render inline: "Document not found", status: :not_found if !@slug_checker[:redirect]
      redirect_to document_path(id, @document.slug), status: :moved_permanently if @slug_checker[:redirect]
    end
  end

  # Search result: querying all documents containing the q parameter
  def search
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