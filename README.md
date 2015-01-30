Citero Renderers
===============

Renderers for Citero for Rails 3, 4.

How to use
==========
You can have it render the format with a responds with action. You must have something like this in your controller.

```
    class TestController < ApplicationController
    	respond_to :ris, :bibtex, :json
    	def test
    		rec = Record.create(:data => "itemType: book", :format => "csf")
    		arr = Array.new
    		arr << rec
    		respond_with(arr)
    	end
    end
```

__RAILS 4.2__

In Rails 4.2, you have to include the [responders](https://github.com/plataformatec/responders) gem if you want to use `respond_with`.
