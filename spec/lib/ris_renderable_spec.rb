require './spec/spec_helper'

describe CiteroRenderers::RisRenderable do

  context 'object is an array' do
    let(:ris_renderable_array) { array.extend CiteroRenderers::RisRenderable }
    context 'array is empty' do
      let(:array) { Array.new }
      it 'returns an empty string' do
        expect(ris_renderable_array.to_ris).to eql('')
      end
    end
    context 'array has one citero object' do
      let(:array) { [Citero.map("itemType: book").from_csf] }
      it 'returns an empty string' do
        expect(ris_renderable_array.to_ris).to eql("TY  - BOOK\nER  -\n\n")
      end
    end
    context 'array has one active record' do
      let(:array) { [RecordChangedField.create!(data: "itemType: book", from_format: "csf")] }
      it 'returns an empty string' do
        expect(ris_renderable_array.to_ris).to eql("TY  - BOOK\nER  -\n\n")
      end
    end
    context 'array has many citero objects' do
      let(:array) { [Citero.map("itemType: book").from_csf, Citero.map("itemType: book").from_csf] }
      it 'returns an empty string' do
        expect(ris_renderable_array.to_ris).to eql("TY  - BOOK\nER  -\n\n\n\nTY  - BOOK\nER  -\n\n")
      end
    end
    context 'array has many active records' do
      let(:array) { [RecordChangedField.create!(data: "itemType: book", from_format: "csf"),
                     RecordChangedField.create!(data: "itemType: book", from_format: "csf")] }
      it 'returns an empty string' do
        expect(ris_renderable_array.to_ris).to eql("TY  - BOOK\nER  -\n\n\n\nTY  - BOOK\nER  -\n\n")
      end
    end
  end
end
