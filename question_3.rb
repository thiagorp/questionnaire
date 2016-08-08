require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

class Adder
  def add(x, y)
    x + y
  end
end

RSpec.describe Adder do
  describe '#add' do
    context 'isolated tests' do
      it 'calls the :+ on the first term passing the second as parameter' do
        first_term = double('adder')
        second_term = 'second term'

        expect(first_term).to receive(:+).with(second_term)

        subject.add(first_term, second_term)
      end

      it 'raises an error if the first term is nil' do
        first_term = nil
        second_term = 'second term'

        expect { subject.add(first_term, second_term) }.to raise_error(NoMethodError)
      end
    end

    context 'when adding integers' do
      it 'returns the sum if the two entries are numbers' do
        sum = subject.add(1, 2)

        expect(sum).to eq(3)
      end

      it 'raises an error if the first term is nil' do
        expect { subject.add(nil, 3) }.to raise_error(NoMethodError)
      end

      it 'raises an error if the second term is nil' do
        expect { subject.add(3, nil) }.to raise_error(TypeError)
      end
    end
  end
end
