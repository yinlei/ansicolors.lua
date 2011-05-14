local ansicolors = require 'ansicolors'

local c27 = string.char(27)

describe('ansicolors', function()
  
  it('should add resets if no options given', function()
    assert_equal(ansicolors('foo'), c27 .. '[0m' .. 'foo' .. c27 .. '[0m' )
  end)

  it('should throw an error on invalid options', function()
    assert_error(function() ansicolors('%{blah}foo') end)
  end)
  
  it('should add red color to text', function()
    assert_equal(ansicolors('%{red}foo'), c27 .. '[0m' .. c27 .. '[31mfoo' .. c27 .. '[0m')
  end)

  it('should add red underlined text', function()
    assert_equal(ansicolors('%{red underline}foo'),  c27 .. '[0m' .. c27 .. '[31m' .. c27 .. '[4mfoo' .. c27 .. '[0m')
  end)

  it('should with heterogeneous attributes', function()
    assert_equal(ansicolors('%{bright white}*%{bright red}BEEP%{bright white}*'),  c27 .. '[0m' .. c27 .. '[1m' .. c27 .. '[37m*' .. c27 .. '[1m' .. c27 .. '[31mBEEP' .. c27 .. '[1m' .. c27 .. '[37m*' .. c27 .. '[0m')
  end)

end)
