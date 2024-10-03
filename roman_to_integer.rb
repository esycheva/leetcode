#! /usr/bin/env ruby

# Римские числа представлена семью символами I, V, X, L, C, D и M

# Символ | Значение
# -------| --------
#   I    | 1
# -------| --------
#   V    | 5       
# -------|---------
#   X    | 10      
# -------|---------
#   L    | 50      
# -------|---------
#   C    | 100     
# -------|---------
#   D    | 500     
# -------|---------
#   M    | 1000    
# -------|---------

{ 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => '500', 'M' => 1000 } 

# например, число 2 записывается как II (I + I)
#           число 12 записывается как XII (X + II)
#           число 27 записывавется как XXVII (XX + V + II)

# Римские цифры обычно записываются от большего к меншему, слева направо. Однако для числа 4, это не IIII. Вместо этого
# число 4 это IV. Потому что один перед пятью, это вычитание одного из пяти, получаем 4. Тот же самый принцип применен к числу 9, которое
# записывается как IX.
# Существует шесть экземпляров, где используется вычитание:
# - I перед V и X для получения 4 и 9
# - X перед L и C для получения 40 и 90
# - C перед D и M для получения 400 и 900

# Дано римское число, конвертируйте его в integer


require 'rspec'

def roman_to_int(s)
    raise StandardError if s == ''
    raise StandardError if s.length > 15

    dictionary = { 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000, '' => 0 } 
    result = 0

    previous = ''
    s.each_char do |sym|       
        value = dictionary[sym]

        if previous == 'I' and ['V', 'X'].include?(sym)       
            value = (dictionary[sym] - dictionary[previous])
            result -= dictionary[previous]
        end
        
        if previous == 'X' and ['L', 'C'].include?(sym)
            value = (dictionary[sym] - dictionary[previous])
            result -= dictionary[previous]
        end

        if previous == 'C' and ['D', 'M'].include?(sym)
            value = (dictionary[sym] - dictionary[previous])
            result -= dictionary[previous]
        end
        result += value

        if ['I', 'X', 'C'].include?(sym)
            previous = sym
        else
            previous = ''
        end        
    end
    result
end

describe 'A roman_to_int ' do
    it 'accepts IX string' do
        expect(roman_to_int('IX')).to eq(9)
    end

    it 'accepts IV string' do
        expect(roman_to_int('IV')).to eq(4)
    end

    it 'accepts III string' do
        expect(roman_to_int('III')).to eq(3)
    end

    it 'accepts LVIII' do
        expect(roman_to_int('LVIII')).to eq(58) 
    end

    it 'accepts MCMXCIV' do
        expect(roman_to_int('MCMXCIV')).to eq(1994)
    end

    it 'accepts "I"' do 
        expect(roman_to_int("I")).to eq(1)
    end

    it 'accepts "MCCLX"' do
        expect(roman_to_int('MCCLX')).to eq(1260)
    end

    it 'accepts ""' do
        expect { roman_to_int('') }.to raise_error(StandardError) 
    end

    it 'accepts "IIIIIIIIIIIIIIIII"' do
        expect { roman_to_int('IIIIIIIIIIIIIIIII') }.to raise_error(StandardError)
    end

    it 'accepts "I"' do
        expect { roman_to_int("I") }.to_not raise_error       
    end

    it 'accepts "IIIIIIIIIIIIIII"' do
        expect { roman_to_int("IIIIIIIIIIIIIII") }.to_not raise_error
    end

    it 'accepts "IVXLCDM"' do
        expect { roman_to_int('IVXLCDM') }.to_not raise_error 
    end

    it 'accepts "IVXLCDA"' do
        expect { roman_to_int('IVXLCDA') }.to raise_error(StandardError) 
    end
end