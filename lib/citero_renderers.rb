module CiteroRenderers
  class CiteroRenderersRailTie < ::Rails::Railtie
    config.after_initialize do
      require 'citero_renderers/bibtex_renderable'
      require 'citero_renderers/ris_renderable'
      require 'citero_renderers/mime_types/ris_mime_type'
      require 'citero_renderers/mime_types/bibtex_mime_type'
      require 'action_controller/metal/renderers'
      # Adds a renderer for BibTeX.
      ActionController.add_renderer :bibtex do |bibtex|
        bibtex.extend CiteroRenderers::BibtexRenderable unless bibtex.respond_to?(:to_bibtex)
        filename = (bibtex.respond_to?(:to_param) and bibtex.class.respond_to?(:acts_as_citable)) ? bibtex.to_param : "export"
        bibtex = bibtex.to_bibtex
        send_data bibtex, type: Mime::Type.lookup(:bibtex), disposition: "attachment; filename=#{filename}.bib"
      end
      # Adds a renderer for RIS.
      ActionController.add_renderer :ris do |ris|
        ris.extend CiteroRenderers::RisRenderable unless bibtex.respond_to?(:to_ris)
        filename = (ris.respond_to?(:to_param) and ris.class.respond_to?(:acts_as_citable)) ? ris.to_param : "export"
        ris = ris.to_ris()
        send_data ris, type: Mime::Type.lookup(:ris), disposition: "attachment; filename=#{filename}.ris"
      end
    end
  end
end
