#! /usr/bin/env ruby

# Семь различных символов представляют Римские числа со следующими значениями:

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

# Соглашение по размещению символов в Римском числе:

# - если значение не начинается с 4 и 9, выбирите символ максимального значения,
# которое может быть вычтено из входного значения, добавить этот символ к результату,
# вычтите его значение, и конвертируйте остаток в Римское число

# - если число начинается с 4 или 9 используйте форму вычитания (substractive form), представляя 
# один символ, вычитая его из следующего символа, например 4 это IV, 9 это на 1 меньше чем
# 10 IX, используйте следующие формы вычитания 
# 4(IV), 9(IX), 40(XL), 90(XC), 400(CD), 900(CM)

# - только степени 10 (I, X, C, M) могут быть добавлены последовательно максимум 3 раза,
# чтобы представить число кратное 10. Вы не можете добавить 5(V), 50(L), или 500(D)
# несколько раз. Если вам необходимо добавить символ 4 раза используйте substractive form.

# Дано целое число, переведите его в Римское.
# { 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000 } 

require 'rspec'

def integer_to_roman(num)
    dictionary = { 1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX', 10 => 'X', 40 => 'XL', 50 => 'L', 90 => 'XC', 100 => 'C',400 => 'CD', 500 => 'D', 900 => 'CM', 1000 => 'M' }

    roman = lambda do |acc, num|
        delta = dictionary.keys.map{|v| num - v }.select{ |d| d >= 0 }.min
        value = dictionary.keys.detect{ |v| (num - v) == delta }
        sym = dictionary[value]

        if delta == 0
           acc + sym  
        else
            roman.call(acc + sym, num - value)
        end
    end
    roman.call('', num)
end

describe 'A integer_to_roman' do
    it 'accept 2' do
        expect(integer_to_roman(2)).to eq('II')
    end

    it 'accept 3' do
        expect(integer_to_roman(3)).to eq('III')
    end

    it 'accept 6' do
        expect(integer_to_roman(6)).to eq('VI')
    end

    it 'accept 4' do
        expect(integer_to_roman(4)).to eq('IV')
    end

    it 'accept 58' do
        expect(integer_to_roman(58)).to eq('LVIII')
    end

    it 'accept 3749' do
        expect(integer_to_roman(3749)).to eq('MMMDCCXLIX')
    end

    it 'accept 1994' do
        expect(integer_to_roman(1994)).to eq('MCMXCIV')
    end
end