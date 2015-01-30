module CiteroRenderers
  module RisRenderable
    def to_ris
      self.collect { |r| r.to_ris if r.respond_to? :to_ris}.join("\n\n")
    end
  end
end
