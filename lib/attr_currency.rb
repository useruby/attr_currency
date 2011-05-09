module AttrCurrency
  def self.included base
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def attr_currency *columns
      columns.each do |column|
        define_method column do
          value = read_attribute(column)
          value/100.0 unless value.nil?
        end

        define_method "#{column}=" do |value|
          write_attribute column, (value.to_f*100).to_i
        end
      end
    end
  end
end
