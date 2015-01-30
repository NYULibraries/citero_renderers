module CiteroRenderers
  module MimeTypes
    # Mime type for bibtex and an alias, bib
    Mime::Type.register "application/x-bibtex", :bibtex, [:bib], [:bib]
  end
end
