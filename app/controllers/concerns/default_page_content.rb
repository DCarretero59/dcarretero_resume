module DefaultPageContent
  extend ActiveSupport::Concern

  included do 
    before_action :set_page_defaults
  end
  private
    def set_page_defaults
      @page_title = "Diego C. Resume"
      @page_subtitle = "Home"
      @page_description = "Engineer on Computer Science Diego Carretero Alvarez Website including Resume, Portfolio, Blog, CV Download and contact info."
      @seo_keywords = "Diego Carretero, Diego Carretero Alvarez, Resume, Curriculum, CV, Portfolio, Blog"
    end
  
end