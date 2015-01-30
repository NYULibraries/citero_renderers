module CiteroRenderers
  module BibtexRenderable
    def to_bibtex
      self.collect { |r| r.to_bibtex if r.respond_to? :to_bibtex }.join("\n\n")
    end
  end
end
