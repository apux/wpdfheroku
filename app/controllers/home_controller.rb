class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.pdf { render pdf: "file_name" }
    end
  end

private

  def pdf
    options = {
      pdf: 'myfile',
      page_size: 'Letter',
      template: 'home/pdfs/template/body',
      layout: 'pdf_layout.html',
      margin: { top: '85', bottom: '80' },
      header: { html: { template: 'home/pdfs/template/header' } },
      footer: { html: { template: 'home/pdfs/template/footer'} }
    } 
    render_to_string_with_wicked_pdf(options)
  end
end
